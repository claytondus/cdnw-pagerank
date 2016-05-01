#!/usr/bin/env python

#COSC 560 Assignment 3
#PageRank
#split_map.py: Map XML pages onto a single line each

import sys, string, cStringIO


doc = cStringIO.StringIO()
doc_end = "</page>"
siteinfo_end = "</siteinfo>"
siteinfo_end_found = False


with open('simplewiki-latest-pages-articles.xml', 'r') as wiki_xml:
    for line in wiki_xml:
        stripped = line.strip()
        if siteinfo_end_found:
            doc.write(stripped)
            if stripped == doc_end:
                print(doc.getvalue())
                doc.close()
                doc = cStringIO.StringIO()
        elif stripped == siteinfo_end:
            siteinfo_end_found = True
