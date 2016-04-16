#!/bin/sh
#Parse Wikipedia directory and generate link index

#HADOOP_STREAMING=/usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar
HDFS_PATH=/user/$USER

hadoop fs -mkdir -p $HDFS_PATH/pa3/in
hadoop fs -rm $HDFS_PATH/pa3/in/*
hadoop fs -put ./in/* $HDFS_PATH/pa3/in

hadoop fs -mkdir $HDFS_PATH/pa3/parse
hadoop fs -rm -R $HDFS_PATH/pa3/parse
hadoop jar $HADOOP_STREAMING \
  -files parse_map.py,parse_reduce.py \
  -mapper parse_map.py \
  -reducer parse_reduce.py \
  -input $HDFS_PATH/pa3/in/ \
  -inputreader "StreamXmlRecord,begin=<page>,end=</page>" \
  -output $HDFS_PATH/pa3/parse
