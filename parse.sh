#!/bin/sh
#Parse Wikipedia directory and generate link index

hadoop fs -mkdir hdfs/pa3/parse
hadoop fs -rm -R hdfs/pa3/parse
hadoop jar $HADOOP_STREAMING \
  -files simplewiki-latest-all-titles,parse_map.py,parse_reduce.py \
  -mapper parse_map.py \
  -reducer parse_reduce.py \
  -input $HDFS_PATH/hdfs/pa3/in/simplewiki-oneline-* \
  -output $HDFS_PATH/hdfs/pa3/parse
hadoop fs -get $HDFS_PATH/hdfs/pa3/parse/part-00000 parse_output
