/*
MySQL Data Transfer
Source Host: localhost
Source Database: bbs
Target Host: localhost
Target Database: bbs
Date: 2012-1-21 14:22:41
*/
create database bbs;

use bbs;


SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for article
-- ----------------------------
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `rootid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `cont` text,
  `pdate` datetime DEFAULT NULL,
  `isleaf` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
insert into article values (null, 0, 1, '蚂蚁大战大象', '蚂蚁大战大象', now(), 1);
insert into article values (null, 1, 1, '大象被打趴下了', '大象被打趴下了',now(), 1);
insert into article values (null, 2, 1, '蚂蚁也不好过','蚂蚁也不好过', now(), 0);
insert into article values (null, 2, 1, '瞎说', '瞎说', now(), 1);
insert into article values (null, 4, 1, '没有瞎说', '没有瞎说', now(), 0);
insert into article values (null, 1, 1, '怎么可能', '怎么可能', now(), 1);
insert into article values (null, 6, 1, '怎么没有可能', '怎么没有可能', now(), 0);
insert into article values (null, 6, 1, '可能性是很大的', '可能性是很大的', now(), 0);
insert into article values (null, 2, 1, '大象进医院了', '大象进医院了', now(), 1);
insert into article values (null, 9, 1, '护士是蚂蚁', '护士是蚂蚁', now(), 0);