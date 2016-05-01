#!/usr/bin/env python

#COSC 560 Assignment 3
#PageRank
#pagerank_map.py: Mapper for pagerank stage

import sys, re, string, os



for line in sys.stdin:
    splits = line.strip().split('\t')
    if len(splits) >= 3:
        title = splits[0]
        rank_str = splits[1]
        links_str = splits[2]
        rank = float(rank_str)
        links = links_str.split(',')

        #Save outlink list
        print(title+'\t'+'^^^'+'\t'+links_str)

        for link in links:
            print(link+'\t'+title+'\t'+str(rank/len(links)))
