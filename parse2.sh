#!/bin/sh
#Parse Wikipedia directory and generate link index

#HADOOP_STREAMING=/usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar
#HDFS_PATH=/user/$USER
#HADOOP_STREAMING=/usr/prog/hadoop-2.7.2/share/hadoop/tools/lib/hadoop-streaming-2.7.2.jar
HADOOP_STREAMING=/usr/local/Cellar/hadoop/2.7.2/libexec/share/hadoop/tools/lib/hadoop-streaming-2.7.2.jar

HDFS_PATH=.

hadoop fs -mkdir hdfs/pa3/parse
hadoop fs -rm -R hdfs/pa3/parse
hadoop jar $HADOOP_STREAMING \
  -files simplewiki-latest-all-titles,parse_map2.py,parse_reduce2.py \
  -mapper parse_map2.py \
  -jobconf mapred.max.split.size=2097152 \
  -reducer parse_reduce2.py \
  -input $HDFS_PATH/hdfs/pa3/in/simplewiki-oneline.txt \
  -output $HDFS_PATH/hdfs/pa3/parse
