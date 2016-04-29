#!/bin/bash

hadoop fs -mkdir -p $HDFS_PATH/hdfs/pa3/pagerank

if (($# > 0)); then
    ITERATIONS="$1"
else
    ITERATIONS=1
fi

LAST="parse"
COUNTER=1

while [ "$COUNTER" -le "$ITERATIONS" ]; do
    echo "********Starting PageRank iteration $COUNTER*********"
    hadoop fs -mkdir hdfs/pa3/pagerank/$COUNTER
    hadoop fs -rm -R hdfs/pa3/pagerank/$COUNTER
    hadoop jar $HADOOP_STREAMING \
      -files pagerank_map2.py,pagerank_reduce2.py \
      -mapper pagerank_map2.py \
      -reducer pagerank_reduce2.py \
      -input $HDFS_PATH/hdfs/pa3/$LAST \
      -output $HDFS_PATH/hdfs/pa3/pagerank/$COUNTER
    LAST="pagerank/$COUNTER"
    echo "********Finished PageRank iteration $COUNTER*********"
    COUNTER=$[$COUNTER + 1]
done

hadoop fs -get $HDFS_PATH/hdfs/pa3/$LAST/part-00000 pagerank_output
python sort_pagerank.py > pagerank_sorted
