#!/usr/bin/env python

#COSC 560 Assignment 3
#PageRank
#parse_map.py: Mapper for parse stage

import sys, re, string, os, codecs, fileinput, cStringIO
import xml.etree.cElementTree as ET

with codecs.open('simplewiki-latest-all-titles', encoding="utf-8") as titles_f:
    titles = [x.strip().lower() for x in titles_f.readlines()]

def parse_doc(doc):
    
    pattern_x = re.compile('<page>.+?<title>(.+?)<\/title>.*?<text[^>]*>(.+?)<\/text>.*?<\/page>',re.DOTALL)
    xml_tags = pattern_x.findall(doc)

    for tags in xml_tags:
        
        title = tags[0]
        title = unicode(title,'utf-8')
        title = string.replace(title, " ","_").lower()

        text = tags[1]

        for match in re.findall("\[\[(\S+)\]\]",text):
            match_parts = re.split("\|",match)
            link = match_parts[0].lower()
            if link in titles:
                print("\t".join((title,link)).encode('utf-8'))



doc = ""
doc_start = "<page>"
doc_end = "</page>"


for line in sys.stdin:
    if line.strip() == doc_start:
        doc = line + '\n'
    elif line.strip() == doc_end:
        doc += line
        parse_doc(doc)
        doc = ""
    else:
        doc += line + '\n'



