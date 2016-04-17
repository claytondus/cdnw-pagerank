#!/usr/bin/env python

#COSC 560 Assignment 3
#PageRank
#pagerank_reduce.py: reducer for pagerank stage

import sys, re, string, os

beta = float(0.85)
current_link = ""
links = list()
newSum = 0

for line in sys.stdin:
    link, title, rank_str, total_links_str = line.strip().split('\t')
    rank = float(rank_str)
    total_links = int(total_links_str)

    newSum += rank / total_links

    if current_link == link:
        links.append(title)
    else:
        if current_link:
            newRank = beta * newSum + (1-beta)
            print(current_link+'\t'+str(newRank)+'\t'+','.join(links))
        links = list()
        current_link = link
        newSum = 0

if current_link == link:
    newRank = beta * newSum + (1-beta)
    print(current_link+'\t'+str(newRank)+'\t'+','.join(links))
