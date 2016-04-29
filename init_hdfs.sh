#!/bin/sh
#Retrieve, split and copy input files to hdfs

wget https://dumps.wikimedia.org/simplewiki/latest/simplewiki-latest-all-titles.gz
wget https://dumps.wikimedia.org/simplewiki/latest/simplewiki-latest-pages-articles.xml.bz2
gunzip simplewiki-latest-all-titles.gz
bunzip2 simplewiki-latest-pages-articles.xml.bz2


cat simplewiki-latest-pages-articles.xml | ./split_map.py > simplewiki-oneline
split -l 30000 simplewiki-oneline simplewiki-oneline-

hadoop fs -mkdir -p $HDFS_PATH/hdfs/pa3/in
hadoop fs -rm $HDFS_PATH/hdfs/pa3/in/*
hadoop fs -put simplewiki-oneline-* $HDFS_PATH/hdfs/pa3/in/
