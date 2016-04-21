#!/usr/bin/env python

#COSC 560 Assignment 3
#PageRank
#parse_map.py: Mapper for parse stage

import sys, re, string, os, codecs, fileinput, cStringIO
import xml.etree.cElementTree as ET

with codecs.open('simplewiki-latest-all-titles', encoding="utf-8") as titles_f:
    titles = [x.strip().lower() for x in titles_f.readlines()]

#mediawiki_start = cStringIO.StringIO().write(u'<mediawiki>')
#mediawiki_end = cStringIO.StringIO().write(u'</mediawiki>')
#inputfile = fileinput.input('mediawiki_start','-','mediawiki_end')

for event, elem in ET.iterparse(sys.stdin):
    if elem.tag == "page":
        titleElem = elem.find('title')
        if titleElem is not None:
            title = unicode(string.replace(titleElem.text, " ", "_")).lower()
        else:
            sys.stderr.write('title not found\n')
            continue
        textElem = elem.find('revision/text')
        if textElem is not None:
            text = textElem.text
        else:
            sys.stderr.write('text not found for '+title+'\n')
            continue

        if text is None:
            sys.stderr.write('text is None for ' + title+'\n')
            continue

        for match in re.findall("\[\[(\S+)\]\]",text):
            match_parts = re.split("\|",match)
            link = match_parts[0].lower()
            if link in titles:
                print("\t".join((title,link)).encode('utf-8'))

        elem.clear()
