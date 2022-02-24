#!/usr/bin/env python3
import sys

extra = """  (pad 1 thru_hole circle (at -2.54 -3.81) (size 1.7 1.7) (drill 1) (layers *.Cu *.Mask))
  (pad 3 thru_hole oval (at -2.54 1.27) (size 1.7 1.7) (drill 1) (layers *.Cu *.Mask))
  (pad 2 thru_hole oval (at -2.54 -1.27) (size 1.7 1.7) (drill 1) (layers *.Cu *.Mask))
  (pad 4 thru_hole oval (at -2.54 3.81) (size 1.7 1.7) (drill 1) (layers *.Cu *.Mask))
)
"""

x = sys.stdin.read()
x = x[:x.rfind(')')] + extra



print(x, end='')