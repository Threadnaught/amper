#!/usr/bin/env python3
import sys

extra = """  (pad 2 smd rect (at -5.18533 2.25) (size 1.5 1) (layers F.Cu F.Paste F.Mask))
  (pad 1 smd rect (at -5.18533 -2.25) (size 1.5 1) (layers F.Cu F.Paste F.Mask))
  (pad 1 smd rect (at 2.81467 -2.25) (size 1.5 1) (layers F.Cu F.Paste F.Mask))
  (pad 2 smd rect (at 2.81467 2.25) (size 1.5 1) (layers F.Cu F.Paste F.Mask))
)
"""

x = sys.stdin.read()
x = x[:x.rfind(')')] + extra



print(x, end='')