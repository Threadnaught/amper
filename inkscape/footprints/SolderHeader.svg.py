#!/usr/bin/env python3
import sys

extra = """  (pad 1 thru_hole rect (at -10 4.2) (size 4 4) (drill 1) (layers *.Cu *.Mask))
  (pad 2 thru_hole rect (at -5 4.2) (size 4 4) (drill 1) (layers *.Cu *.Mask))
  (pad 3 thru_hole rect (at 0 4.2) (size 4 4) (drill 1) (layers *.Cu *.Mask))
  (pad 4 thru_hole rect (at 5 4.2) (size 4 4) (drill 1) (layers *.Cu *.Mask))
  (pad 5 thru_hole rect (at 10 4.2) (size 4 4) (drill 1) (layers *.Cu *.Mask))
)
"""

x = sys.stdin.read()
x = x[:x.rfind(')')] + extra



print(x, end='')