#!/usr/bin/env python

#COSC 560 Assignment 3
#PageRank
#sort_pagerank.py: Map XML pages onto a single line each

import sys, string
from operator import itemgetter

with open('pagerank_output') as pr_f:
    ranks = [x.strip().split('\t') for x in pr_f.readlines()]

def getRank(item):
    return float(item[1])

ranks_sorted = sorted(ranks, key=getRank, reverse=True)
for line in ranks_sorted:
    print('\t'.join(line[0:2]))
