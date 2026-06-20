#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""從 research.lbx 萃取科技描述(對應已存在的科技)。
item0=科技資料(6×50×6;[0]=group(0xff 不存在));item2+4=描述,每段定長 0xc3(195)。
輸出 TSV: field, name, english_description。"""
import struct, sys

FIELDS = ["Computers", "Construction", "Force Fields", "Planetology", "Propulsion", "Weapons"]
DESCR_LEN = 0xc3

def lbx_items(data):
    n = struct.unpack_from("<H", data, 0)[0]
    offs = [struct.unpack_from("<I", data, 8 + 4 * i)[0] for i in range(n + 1)]
    return [data[offs[i]:offs[i + 1]] for i in range(n)]

def main(path):
    data = open(path, "rb").read()
    items = lbx_items(data)
    item0 = items[0]
    names_blob = items[1][4:]
    descr_blob = items[2][4:]
    num = struct.unpack_from("<H", item0, 0)[0]
    size = struct.unpack_from("<H", item0, 2)[0]
    base = 4
    n = 0
    for i in range(num):
        rec = item0[base + i * size: base + i * size + size]
        if rec[0] == 0xff:
            continue
        field, slot = i // 50, i % 50
        name_off = struct.unpack_from("<H", rec, 4)[0]
        name = names_blob[name_off:names_blob.find(b"\x00", name_off)].decode("latin-1")
        d = descr_blob[i * DESCR_LEN:(i + 1) * DESCR_LEN]
        descr = d[:d.find(b"\x00")].decode("latin-1") if b"\x00" in d else d.decode("latin-1")
        descr = descr.strip()
        if descr:
            print(f"{FIELDS[field]}\t{name}\t{descr}")
            n += 1
    sys.stderr.write(f"# {n} descriptions\n")

if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "assets/game/research.lbx")
