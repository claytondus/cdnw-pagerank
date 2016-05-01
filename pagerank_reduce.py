#!/usr/bin/env python

#COSC 560 Assignment 3
#PageRank
#pagerank_reduce.py: reducer for pagerank stage

#input one of these:
#title ^^^ <set_of_links>
#link title partial_rank

import sys, re, string, os

beta = float(0.85)
current_title = ""
link = ""
current_sum = 0
links = ""


for line in sys.stdin:
    splits = line.strip().split('\t')
    if len(splits) >= 3:
        first = splits[0]
        second = splits[1]
        third = splits[2]
        if second == '^^^':
            current_title = first
            links = third
            current_sum = 0
        else:
            link = first
            partial_rank = float(third)
            current_sum += partial_rank
        if (link != current_title) and current_title and link:
            newRank = beta * current_sum + (1-beta)
            print(current_title+'\t'+str(newRank)+'\t'+links)
            current_title = ""
            current_sum = 0


if current_title:
    newRank = beta * current_sum + (1-beta)
    print(current_title+'\t'+str(newRank)+'\t'+links)
