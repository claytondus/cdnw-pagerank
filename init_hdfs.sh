#!/bin/sh
#Copy input files to hdfs

#HADOOP_STREAMING=/usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar
#HDFS_PATH=/user/$USER

hadoop fs -mkdir -p hdfs/pa3/in
hadoop fs -rm hdfs/pa3/in/*
hadoop fs -put ./in/* hdfs/pa3/in
