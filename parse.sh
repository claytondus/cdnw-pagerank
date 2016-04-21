#!/bin/sh
#Parse Wikipedia directory and generate link index

#HADOOP_STREAMING=/usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar
#HDFS_PATH=/user/$USER

HDFS_PATH=.

hadoop fs -mkdir hdfs/pa3/parse
hadoop fs -rm -R hdfs/pa3/parse
hadoop jar $HADOOP_STREAMING \
  -files simplewiki-latest-all-titles,parse_map.py,parse_reduce.py,mediawiki_start,mediawiki_end \
  -mapper parse_map.py \
  -reducer parse_reduce.py \
  -input $HDFS_PATH/hdfs/pa3/in/simplewiki-head-test.xml \
  -inputreader "StreamXmlRecordReader,begin=<page>,end=</page>" \
  -output $HDFS_PATH/hdfs/pa3/parse
