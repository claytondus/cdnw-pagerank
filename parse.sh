#!/bin/sh
#Parse Wikipedia directory and generate link index

#HADOOP_STREAMING=/usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar
#HDFS_PATH=/user/$USER

hadoop fs -mkdir hdfs/pa3/parse
hadoop fs -rm -R hdfs/pa3/parse
hadoop jar $HADOOP_STREAMING \
  -files simplewiki-latest-all-titles,parse_map.py,parse_reduce.py \
  -mapper parse_map.py \
  -reducer parse_reduce.py \
  -input hdfs/pa3/in/simplewiki-head.xml \
  -inputreader "StreamXmlRecordReader,begin=<page>,end=</page>" \
  -output hdfs/pa3/parse
