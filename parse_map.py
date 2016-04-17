#!/usr/bin/env python

#COSC 560 Assignment 3
#PageRank
#parse_map.py: Mapper for parse stage

import sys, re, string, os, codecs
import xml.etree.ElementTree as ET

with codecs.open('simplewiki-latest-all-titles', encoding="utf-8") as titles_f:
    titles = [x.strip().lower() for x in titles_f.readlines()]

inputstring = sys.stdin.read()

#sys.stderr.write("<mediawiki>"+inputstring+"</mediawiki>")

root = ET.fromstring("<mediawiki>"+inputstring+"</mediawiki>")


for page in root.iter('page'):
    titleElem = page.find('title')
    if titleElem is not None:
        title = unicode(string.replace(titleElem.text, " ", "_"))
    else:
        sys.stderr.write('title not found')
        continue
    textElem = page.find('revision/text')
    if textElem is not None:
        text = textElem.text
    else:
        sys.stderr.write('text not found')
        continue

    if text is None:
        sys.stderr.write('text is none for ' + title)
        continue

    for match in re.findall("\[\[(\S+)\]\]",text):
        match_parts = re.split("\|",match)
        if match_parts[0].lower() in titles:
            print("\t".join((title.lower(),match_parts[0].lower())).encode('utf-8'))
