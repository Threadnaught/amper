#!/usr/bin/env python3
import sys

extra = """  (pad 1 smd circle (at -3.81 -2.54 270) (size 1 1) (layers F.Cu F.Paste F.Mask))
  (pad 2 smd circle (at -3.81 0 270) (size 1 1) (layers F.Cu F.Paste F.Mask))
  (pad 3 smd circle (at -3.81 2.54 270) (size 1 1) (layers F.Cu F.Paste F.Mask))
  (pad 4 smd circle (at -3.81 5.08 270) (size 1 1) (layers F.Cu F.Paste F.Mask))
  (pad 5 smd circle (at 3.81 5.08 270) (size 1 1) (layers F.Cu F.Paste F.Mask))
  (pad 6 smd circle (at 3.81 2.54 270) (size 1 1) (layers F.Cu F.Paste F.Mask))
  (pad 7 smd circle (at 3.81 0 270) (size 1 1) (layers F.Cu F.Paste F.Mask))
  (pad 8 smd circle (at 3.81 -2.54 270) (size 1 1) (layers F.Cu F.Paste F.Mask))
)
"""

x = sys.stdin.read()
x = x[:x.rfind(')')] + extra



print(x, end='')