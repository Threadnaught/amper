#!/usr/bin/env python3
import sys

extra = """  (pad 1 thru_hole circle (at -2.54 -2.54) (size 1.7 1.7) (drill 1) (layers *.Cu *.Mask))
  (pad 3 thru_hole oval (at -2.54 2.54) (size 1.7 1.7) (drill 1) (layers *.Cu *.Mask))
  (pad 2 thru_hole oval (at -2.54 0) (size 1.7 1.7) (drill 1) (layers *.Cu *.Mask))
)
"""

x = sys.stdin.read()
x = x[:x.rfind(')')] + extra



print(x, end='')