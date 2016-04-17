#!/usr/bin/env python

#COSC 560 Assignment 3
#PageRank
#pagerank_map.py: Mapper for pagerank stage

import sys, re, string, os



for line in sys.stdin:
    title, rank_str, links_str = line.strip().split('\t')
    rank = float(rank_str)
    links = links_str.split(',')

    for link in links:
        print(link+'\t'+title+'\t'+str(rank)+'\t'+str(len(links)))
