#!/usr/bin/env python

#COSC 560 Assignment 3
#PageRank
#parse_reduce.py: Reducer for parse stage

import sys, re, string, os

current_title = ""
links = list()

for line in sys.stdin:
    line = line.strip()
    title, link = line.split('\t',1)

    if current_title == title:
        links.append(link)
    else:
        if current_title:
            print(current_title+'\t1.0\t'+','.join(links))
        links = list()
        links.append(link)
        current_title = title

if current_title == title:
    print(title+'\t'+str(1.0)+'\t'+','.join(links))
