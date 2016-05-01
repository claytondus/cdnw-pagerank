#!/usr/bin/env python

#COSC 560 Assignment 3
#PageRank
#split_map.py: Map XML pages onto a single line each

import sys, string, cStringIO


doc = cStringIO.StringIO()
doc_start = "<page>"
doc_end = "</page>"
mediawiki_found = False

with open('simplewiki-latest-pages-articles.xml', 'r') as wiki_xml:
    for line in wiki_xml:
        stripped = line.strip()
        if stripped == doc_start or stripped != doc_end:
            doc.write(stripped)
        else:
            doc.write(stripped)
            print(doc.getvalue())
            doc.close()
            doc = cStringIO.StringIO()
