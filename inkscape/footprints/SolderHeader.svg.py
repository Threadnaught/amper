#!/usr/bin/env python3
import sys

extra = """  (pad 1 smd rect (at -9.3 4.2) (size 4 4) (layers F.Cu F.Paste F.Mask))
  (pad 2 smd rect (at -4.3 4.2) (size 4 4) (layers F.Cu F.Paste F.Mask))
  (pad 3 smd rect (at 0.7 4.2) (size 4 4) (layers F.Cu F.Paste F.Mask))
  (pad 4 smd rect (at 5.7 4.2) (size 4 4) (layers F.Cu F.Paste F.Mask))
  (pad 5 smd rect (at 10.7 4.2) (size 4 4) (layers F.Cu F.Paste F.Mask))
)
"""

x = sys.stdin.read()
x = x[:x.rfind(')')] + extra



print(x, end='')