#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""從 diplomat.lbx(item1,外交)/ eventmsg.lbx(item0,新聞)萃取訊息。
每筆固定 0xc8 byte,字串 null 結尾,含 token(>=0x80)與控制碼(<0x20,如色碼 \\x01)。
輸出 TSV: escaped_key \\t escaped_key(第二欄供翻譯;token/控制碼以 \\xNN 表示供 strtr 還原)。
去重:相同字串只輸出一次。"""
import struct, sys

REC_LEN = 0xc8

def lbx_items(data):
    n = struct.unpack_from("<H", data, 0)[0]
    offs = [struct.unpack_from("<I", data, 8 + 4 * i)[0] for i in range(n + 1)]
    return [data[offs[i]:offs[i + 1]] for i in range(n)]

def escape(bs):
    out = []
    for b in bs:
        if 0x20 <= b < 0x7f and b not in (0x5c, 0x09):  # 可印 ASCII(排除 \ 與 tab)
            out.append(chr(b))
        else:
            out.append("\\x%02x" % b)
    return "".join(out)

def main(path, item_idx):
    data = open(path, "rb").read()
    blob = lbx_items(data)[item_idx][4:]   # 跳過 2 byte num + 2 byte size
    nrec = len(blob) // REC_LEN
    seen = set()
    n = 0
    for i in range(nrec):
        rec = blob[i * REC_LEN:(i + 1) * REC_LEN]
        z = rec.find(b"\x00")
        s = rec[:z] if z >= 0 else rec
        s = s.rstrip(b"\x00")
        if not s:
            continue
        esc = escape(s)
        if esc in seen:
            continue
        seen.add(esc)
        print(f"{esc}\t{esc}")
        n += 1
    sys.stderr.write(f"# {n} unique messages from {path} item {item_idx}\n")

if __name__ == "__main__":
    # 用法:dump_messages.py <lbx> <item_idx>
    main(sys.argv[1], int(sys.argv[2]))
