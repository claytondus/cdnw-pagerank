#!/bin/sh
#Run pagerank algorithm

#HADOOP_STREAMING=/usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar
#HDFS_PATH=/user/$USER

HDFS_PATH=.

hadoop fs -mkdir hdfs/pa3/pagerank
hadoop fs -rm -R hdfs/pa3/pagerank
hadoop jar $HADOOP_STREAMING \
  -files pagerank_map.py,pagerank_reduce.py \
  -mapper pagerank_map.py \
  -reducer pagerank_reduce.py \
  -input $HDFS_PATH/hdfs/pa3/parse/part-00000 \
  -output $HDFS_PATH/hdfs/pa3/pagerank
