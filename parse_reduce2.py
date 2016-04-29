#!/usr/bin/env python

#COSC 560 Assignment 3
#PageRank
#parse_reduce.py: Reducer for parse stage

import sys, re, string, os

current_title = ""
title = ""
link = ""
links = set()

for line in sys.stdin:
    line = line.strip()
    splits = line.split('\t')

    
    if(len(splits)==2):
        if (splits[0].strip() != "") and (splits[1].strip() != ""):
            title = splits[0].strip()
            link = splits[1].strip()
   

    #Don't add self-links
    if title == link:
        continue

    if link != "":
        if current_title == title:
            links.add(link)
        else:
            if current_title:
                print(current_title+'\t1.0\t'+','.join(links))
            links = set()
            links.add(link)
            current_title = title
    
if current_title == title:
    print(title+'\t'+str(1.0)+'\t'+','.join(links))
