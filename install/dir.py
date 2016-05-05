#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (C) 2015 Dmitriy Tyurin

__author__ = 'Dmitriy Tyurin <fobia3d@gmail.com>'
__license__ = "MIT"
__version__ = '1.0'


import argparse
import sys
# ============================================================
#

# path = sys.path
# for p in path:
#     print " - {0}".format(p)
# print "------------"

def in_list(alist, v):
    k = -1
    try:
        k = alist.index(v)
    except:
        pass
    return k


parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('--path', help='path help')
parser.add_argument('dirs', nargs='+', help='bar help')

args = parser.parse_args()
# print(args.path)


# ========================================
path = args.path.split(':')

for d in args.dirs:
    if in_list(path, d) < 0:
        path.insert(0, d)


# for p in path:
    # print " - {0}".format(p)


print(':'.join(path))

