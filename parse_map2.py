#!/usr/bin/env python

#COSC 560 Assignment 3
#PageRank
#parse_map.py: Mapper for parse stage

import sys, re, string, os, codecs, cStringIO

with codecs.open('simplewiki-latest-all-titles', encoding="utf-8") as titles_f:
    titles = {x.strip().lower() for x in titles_f.readlines()}

page_pattern = re.compile('<page>.*?<title>(.+?)<\/title>.*?<text[^>]*>(.+?)<\/text>.*?<\/page>',re.DOTALL)
link_pattern = re.compile('\[\[(\S+)\]\]')
link_delimiter = re.compile('\|')

def parse_doc(doc):

    match = page_pattern.match(doc)

    if match:
        title = match.group(1)
        title = unicode(title,'utf-8')
        title = string.replace(title, " ","_").lower()

        text = match.group(2)

        for match in link_pattern.findall(text):
            match_parts = link_delimiter.split(match)
            link = unicode(match_parts[0].lower(),'utf-8')
            if link in titles:
                print("\t".join((title,link)).encode('utf-8'))




for line in sys.stdin:
    parse_doc(line.strip())
