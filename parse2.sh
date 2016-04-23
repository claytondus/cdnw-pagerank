#!/bin/sh
#Parse Wikipedia directory and generate link index

#HADOOP_STREAMING=/usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar
#HDFS_PATH=/user/$USER
HADOOP_STREAMING=/usr/prog/hadoop-2.7.2/share/hadoop/tools/lib/hadoop-streaming-2.7.2.jar

HDFS_PATH=.

hadoop fs -mkdir hdfs/pa3/parse
hadoop fs -rm -R hdfs/pa3/parse
hadoop jar $HADOOP_STREAMING \
  -files simplewiki-latest-all-titles,parse_map2.py,parse_reduce2.py,mediawiki_start,mediawiki_end \
  -mapper parse_map2.py \
  -reducer parse_reduce2.py \
  -input $HDFS_PATH/hdfs/pa3/in/simplewiki-latest-pages-articles.xml \
  -inputreader "StreamXmlRecordReader,begin=<page>,end=</page>" \
  -output $HDFS_PATH/hdfs/pa3/parse


