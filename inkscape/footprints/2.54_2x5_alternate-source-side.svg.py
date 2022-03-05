#!/usr/bin/env python3
import sys

extra = """  (pad 2 smd rect (at -5.08 -4.226) (size 0.8 2) (layers F.Cu F.Paste F.Mask))
  (pad 1 smd rect (at -5.08 1.774) (size 0.8 2) (layers F.Cu F.Paste F.Mask))
  (pad 4 smd rect (at -2.54 -4.226) (size 0.8 2) (layers F.Cu F.Paste F.Mask))
  (pad 3 smd rect (at -2.54 1.774) (size 0.8 2) (layers F.Cu F.Paste F.Mask))
  (pad 6 smd rect (at 0 -4.226) (size 0.8 2) (layers F.Cu F.Paste F.Mask))
  (pad 5 smd rect (at 0 1.774) (size 0.8 2) (layers F.Cu F.Paste F.Mask))
  (pad 8 smd rect (at 2.54 -4.226) (size 0.8 2) (layers F.Cu F.Paste F.Mask))
  (pad 7 smd rect (at 2.54 1.774) (size 0.8 2) (layers F.Cu F.Paste F.Mask))
  (pad 10 smd rect (at 5.08 -4.226) (size 0.8 2) (layers F.Cu F.Paste F.Mask))
  (pad 9 smd rect (at 5.08 1.774) (size 0.8 2) (layers F.Cu F.Paste F.Mask))
)
"""

x = sys.stdin.read()
x = x[:x.rfind(')')] + extra



print(x, end='')