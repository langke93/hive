-- test for loading into tables with the correct file format
-- test for loading into partitions with the correct file format


CREATE TABLE T1_n117(name STRING) STORED AS TEXTFILE;
LOAD DATA LOCAL INPATH '../../data/files/kv1.txt' INTO TABLE T1_n117;
SELECT COUNT(1) FROM T1_n117;


CREATE TABLE T2_n69(name STRING) STORED AS SEQUENCEFILE;
LOAD DATA LOCAL INPATH '../../data/files/kv1.seq' INTO TABLE T2_n69;
SELECT COUNT(1) FROM T2_n69;


CREATE TABLE T3_n25(name STRING) PARTITIONED BY(ds STRING) STORED AS TEXTFILE;
LOAD DATA LOCAL INPATH '../../data/files/kv1.txt' INTO TABLE T3_n25 PARTITION (ds='2008-04-09');
SELECT COUNT(1) FROM T3_n25 where T3_n25.ds='2008-04-09';


CREATE TABLE T4_n14(name STRING) PARTITIONED BY(ds STRING) STORED AS SEQUENCEFILE;
LOAD DATA LOCAL INPATH '../../data/files/kv1.seq' INTO TABLE T4_n14 PARTITION (ds='2008-04-09');
SELECT COUNT(1) FROM T4_n14 where T4_n14.ds='2008-04-09';

DESCRIBE EXTENDED T1_n117;
DESCRIBE EXTENDED T2_n69;
DESCRIBE EXTENDED T3_n25 PARTITION (ds='2008-04-09');
DESCRIBE EXTENDED T4_n14 PARTITION (ds='2008-04-09');






