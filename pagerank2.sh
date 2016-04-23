#!/bin/sh
#Run pagerank algorithm

#HADOOP_STREAMING=/usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar
#HDFS_PATH=/user/$USER

HADOOP_STREAMING=/usr/prog/hadoop-2.7.2/share/hadoop/tools/lib/hadoop-streaming-2.7.2.jar
HDFS_PATH=.

hadoop fs -mkdir hdfs/pa3/pagerank

if (($# > 0))
    ITERATIONS = $1
else
    ITERATIONS = 1

LAST = "parse"
COUNTER = 1
while [ $COUNTER -le $ITERATIONS ]; do
    
    hadoop fs -mkdir hdfs/pa3/pagerank/$COUNTER
    hadoop fs -rm -R hdfs/pa3/pagerank/$COUNTER
    hadoop jar $HADOOP_STREAMING \
      -files pagerank_map.py,pagerank_reduce.py \
      -mapper pagerank_map.py \
      -reducer pagerank_reduce.py \
      -input $HDFS_PATH/hdfs/pa3/$LAST \
      -output $HDFS_PATH/hdfs/pa3/pagerank/$COUNTER
    LAST = "pagerank/" + $COUNTER
    COUNTER = COUNTER + 1
done
