#!/bin/sh
#Parse Wikipedia directory and generate link index

hadoop fs -mkdir hdfs/pa3/parse
hadoop fs -rm -R hdfs/pa3/parse
hadoop jar $HADOOP_STREAMING \
  -files simplewiki-latest-all-titles,parse_map2.py,parse_reduce2.py \
  -mapper parse_map2.py \
  -reducer parse_reduce2.py \
  -input $HDFS_PATH/hdfs/pa3/in/simplewiki-oneline-* \
  -output $HDFS_PATH/hdfs/pa3/parse
