#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""從 help.lbx(item0)萃取說明文字。
每筆 HELP_ITEM_SIZE=0x5f8 byte;字串欄位:STR0=0xbc STR1=0xe4 STR2=0x21e STR3=0x246,
STBL=0x380 起 9 筆各 70 byte。null 結尾。
輸出 TSV: english \\t english(第二欄供翻譯;\\xNN 表示控制碼/高位元組,供 strtr 還原)。去重。"""
import struct, sys

ITEM_SIZE = 0x5f8
STR_OFFS = [0xbc, 0xe4, 0x21e, 0x246]
STBL_OFF = 0x380
STBL_SIZE = 70
STBL_N = 9

def lbx_items(data):
    n = struct.unpack_from("<H", data, 0)[0]
    offs = [struct.unpack_from("<I", data, 8 + 4 * i)[0] for i in range(n + 1)]
    return [data[offs[i]:offs[i + 1]] for i in range(n)]

def escape(bs):
    out = []
    for b in bs:
        if 0x20 <= b < 0x7f and b not in (0x5c, 0x09):
            out.append(chr(b))
        else:
            out.append("\\x%02x" % b)
    return "".join(out)

def cstr(rec, off, maxlen):
    s = rec[off:off + maxlen]
    z = s.find(b"\x00")
    if z >= 0:
        s = s[:z]
    return s.rstrip(b"\x00")

def main(path):
    data = open(path, "rb").read()
    blob = lbx_items(data)[0][4:]
    nrec = len(blob) // ITEM_SIZE
    seen = set()
    n = 0
    for i in range(nrec):
        rec = blob[i * ITEM_SIZE:(i + 1) * ITEM_SIZE]
        fields = [cstr(rec, o, 0x100) for o in STR_OFFS]
        fields += [cstr(rec, STBL_OFF + j * STBL_SIZE, STBL_SIZE) for j in range(STBL_N)]
        for s in fields:
            if not s:
                continue
            esc = escape(s)
            if esc in seen:
                continue
            seen.add(esc)
            print(f"{esc}\t{esc}")
            n += 1
    sys.stderr.write(f"# {n} unique help strings, {nrec} records from {path}\n")

if __name__ == "__main__":
    main(sys.argv[1])
