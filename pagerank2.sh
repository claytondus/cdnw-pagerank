#!/bin/bash

HADOOP_STREAMING=/usr/prog/hadoop-2.7.2/share/hadoop/tools/lib/hadoop-streaming-2.7.2.jar
HDFS_PATH=.

hadoop fs -mkdir hdfs/pa3/pagerank

if (($# > 0)); then
    ITERATIONS="$1"
else
    ITERATIONS=1
fi

LAST="parse"
COUNTER=1

while [ "$COUNTER" -le "$ITERATIONS" ]; do
    
    hadoop fs -mkdir hdfs/pa3/pagerank/$COUNTER
    hadoop fs -rm -R hdfs/pa3/pagerank/$COUNTER
    hadoop jar $HADOOP_STREAMING \
      -files pagerank_map2.py,pagerank_reduce2.py \
      -mapper pagerank_map2.py \
      -reducer pagerank_reduce2.py \
      -input $HDFS_PATH/hdfs/pa3/$LAST \
      -output $HDFS_PATH/hdfs/pa3/pagerank/$COUNTER
    LAST="pagerank/$COUNTER"
    COUNTER=$[$COUNTER + 1]
done
