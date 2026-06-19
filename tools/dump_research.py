#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""從 research.lbx 萃取科技名(對應領域/等級)。
LBX:item0 = 科技資料(6 領域×50×6 byte;[0]=group(0xff 不存在), [4:2]=name offset),
     item1+4 = null 分隔科技名。輸出 TSV: field_idx, field, tech_slot, name。"""
import struct, sys

FIELDS = ["Computers", "Construction", "Force Fields", "Planetology", "Propulsion", "Weapons"]

def lbx_items(data):
    n = struct.unpack_from("<H", data, 0)[0]
    offs = [struct.unpack_from("<I", data, 8 + 4 * i)[0] for i in range(n + 1)]
    return [data[offs[i]:offs[i + 1]] for i in range(n)]

def main(path):
    data = open(path, "rb").read()
    items = lbx_items(data)
    item0 = items[0]                 # tech data
    names_blob = items[1][4:]        # names (research.names = item1 + 4)
    # item0: 2 byte num, 2 byte size(6), then num*6 records; num=6*50=300
    num = struct.unpack_from("<H", item0, 0)[0]
    size = struct.unpack_from("<H", item0, 2)[0]
    base = 4
    rows = []
    for i in range(num):
        rec = item0[base + i * size: base + i * size + size]
        group = rec[0]
        if group == 0xff:
            continue
        name_off = struct.unpack_from("<H", rec, 4)[0]
        end = names_blob.find(b"\x00", name_off)
        name = names_blob[name_off:end].decode("latin-1")
        field = i // 50
        slot = i % 50
        rows.append((field, FIELDS[field], slot, name))
    for r in rows:
        print(f"{r[0]}\t{r[1]}\t{r[2]}\t{r[3]}")
    sys.stderr.write(f"# {len(rows)} techs\n")

if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "assets/game/research.lbx")
