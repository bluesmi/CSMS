/*
Navicat MySQL Data Transfer

Source Server         : my
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : clothes

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2017-06-05 08:12:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `clothe`
-- ----------------------------
DROP TABLE IF EXISTS `clothe`;
CREATE TABLE `clothe` (
  `cid` int(11) NOT NULL auto_increment,
  `cname` varchar(10) default NULL,
  `ccolor` varchar(10) default NULL,
  `csize` varchar(10) default NULL,
  `cnumber` int(11) default NULL,
  `cimage` varchar(20) default NULL,
  `cfacprice` smallint(6) default NULL,
  `cretprice` smallint(6) default NULL,
  `flag` int(11) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clothe
-- ----------------------------
INSERT INTO `clothe` VALUES ('1', '中款大衣', '黑色', '175', '200', '', '400', '600', '0');
INSERT INTO `clothe` VALUES ('2', '小款大衣', '红色', '155', '99', null, '400', '600', '0');
INSERT INTO `clothe` VALUES ('3', '长裤', '紫红色', '165', '111', '123', '1000', '2000', '0');
INSERT INTO `clothe` VALUES ('4', '裤头', '纯白色', '190', '125', '11', '200', '300', '0');

-- ----------------------------
-- Table structure for `stockin`
-- ----------------------------
DROP TABLE IF EXISTS `stockin`;
CREATE TABLE `stockin` (
  `sid` varchar(25) NOT NULL default '0',
  `wid` int(11) default NULL,
  `loginName` varchar(10) default NULL,
  `stime` date default NULL,
  `sremark` varchar(50) default NULL,
  `sstute` int(5) default NULL,
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockin
-- ----------------------------
INSERT INTO `stockin` VALUES ('rk2016060200001', '3', 'hanbon', '2016-06-02', 'weqwe', '0');
INSERT INTO `stockin` VALUES ('rk2016060200002', '3', 'hanbon', '2016-06-02', '123', '0');
INSERT INTO `stockin` VALUES ('rk2016060200003', '1', 'hanbon', '2016-06-02', 'weqwe', '1');
INSERT INTO `stockin` VALUES ('rk2016060200004', '1', 'hanbon', '2016-06-02', 'weqwe', '1');
INSERT INTO `stockin` VALUES ('rk2016060200005', '1', 'hanbon', '2016-06-02', 'weqwe', '1');
INSERT INTO `stockin` VALUES ('rk2016060200007', '1', 'hanbon', '2016-06-02', 'weqwe', '1');
INSERT INTO `stockin` VALUES ('rk2016060200008', '1', 'hanbon', '2016-06-02', 'weqwe', '1');
INSERT INTO `stockin` VALUES ('rk2016060200009', '1', 'hanbon', '2016-06-02', 'weqwe', '1');
INSERT INTO `stockin` VALUES ('rk2016060600001', '1', 'hanbon', '2016-06-06', 'weqwe', '1');
INSERT INTO `stockin` VALUES ('rk2016061100001', '1', 'hanbon', '2016-06-11', 'weqwe', '1');
INSERT INTO `stockin` VALUES ('rk2016061100002', '1', 'hanbon', '2016-06-11', 'weqwe', '1');
INSERT INTO `stockin` VALUES ('rk2016061100003', '2', 'hanbon', '2016-06-11', '123', '0');
INSERT INTO `stockin` VALUES ('rk2016061100004', '1', 'hanbon', '2016-06-11', 'weqwe', '1');

-- ----------------------------
-- Table structure for `stockin_item`
-- ----------------------------
DROP TABLE IF EXISTS `stockin_item`;
CREATE TABLE `stockin_item` (
  `siid` int(11) NOT NULL auto_increment,
  `sid` varchar(25) default NULL,
  `cid` int(11) default NULL,
  `sinumber` int(11) default NULL,
  PRIMARY KEY  (`siid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockin_item
-- ----------------------------
INSERT INTO `stockin_item` VALUES ('2', 'rk2016061100003', '11', '1');
INSERT INTO `stockin_item` VALUES ('3', 'rk2016061100003', '4', '1');
INSERT INTO `stockin_item` VALUES ('4', 'rk2016061100003', '11', '1');
INSERT INTO `stockin_item` VALUES ('5', 'rk2016060200002', '4', '60');

-- ----------------------------
-- Table structure for `stockout`
-- ----------------------------
DROP TABLE IF EXISTS `stockout`;
CREATE TABLE `stockout` (
  `soid` char(25) NOT NULL,
  `wid` int(11) default NULL,
  `loginName` varchar(10) default NULL,
  `soremark` varchar(50) default NULL,
  `sotime` date default NULL,
  `sostute` int(11) default NULL,
  `adress` varchar(30) default NULL,
  `sphone` char(11) default NULL,
  PRIMARY KEY  (`soid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockout
-- ----------------------------
INSERT INTO `stockout` VALUES ('ck2016060200001', '2', 'hanbon', '请发中通快递。', '2016-06-02', '1', '湖南长沙', '13874873550');
INSERT INTO `stockout` VALUES ('ck2016060200002', '1', 'hanbon', 'weqwe', '2016-06-02', '1', '湖南长沙', '13874873550');
INSERT INTO `stockout` VALUES ('ck2016060200003', '1', 'hanbon', 'EMS', '2016-06-02', '1', '湖南长沙', '13874873550');
INSERT INTO `stockout` VALUES ('ck2016060200004', '1', 'hanbon', '请卖家快点发货！', '2016-06-02', '1', '湖南长沙', '13874873550');
INSERT INTO `stockout` VALUES ('ck2016060200005', '1', 'hanbon', '免邮', '2016-06-02', '1', '湖南长沙', '15200857955');
INSERT INTO `stockout` VALUES ('ck2016060200006', '1', 'hanbon', '24小时发货', '2016-06-02', '1', '湖南长沙', '15200857955');
INSERT INTO `stockout` VALUES ('ck2016060200007', '1', 'hanbon', '啦啦啦', '2016-06-02', '1', '广东云浮', '15574873550');
INSERT INTO `stockout` VALUES ('ck2016060200008', '1', 'hanbon', 'weqwe', '2016-06-02', '1', '广东云浮', '15200857955');
INSERT INTO `stockout` VALUES ('ck2016060600003', '2', 'hanbon', '请卖家发送顺丰快递，谢谢', '2016-06-06', '1', '四川成都', '15200857955');
INSERT INTO `stockout` VALUES ('ck2016060700001', '1', 'hanbon', '小狗', '2016-06-07', '1', '湖南益阳', '15574873550');
INSERT INTO `stockout` VALUES ('ck2016060700002', '1', 'hanbon', '株洲', '2016-06-07', '1', '湖南株洲', '15574873550');
INSERT INTO `stockout` VALUES ('ck2016060800001', '1', '王五', '乌鲁木齐', '2016-06-08', '1', '乌鲁木齐', '15598754632');
INSERT INTO `stockout` VALUES ('ck2016060800002', '1', 'hanbon', '广州长隆', '2016-06-08', '1', '广州', '12345678901');
INSERT INTO `stockout` VALUES ('ck2016060800003', '1', 'hanbon', '南宁', '2016-06-08', '1', '南宁', '12345678901');
INSERT INTO `stockout` VALUES ('ck2016060800004', '2', '老王', '湖南衡阳湖南衡阳', '2016-06-08', '1', '湖南衡阳', '15598754632');

-- ----------------------------
-- Table structure for `stockoutitem`
-- ----------------------------
DROP TABLE IF EXISTS `stockoutitem`;
CREATE TABLE `stockoutitem` (
  `soiid` int(11) NOT NULL auto_increment,
  `soid` varchar(25) default NULL,
  `cid` int(11) default NULL,
  `sonumber` int(11) default NULL,
  PRIMARY KEY  (`soiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockoutitem
-- ----------------------------
INSERT INTO `stockoutitem` VALUES ('1', 'ck2016060600003', '1', '10');
INSERT INTO `stockoutitem` VALUES ('3', 'ck2016060600003', '1', '2');
INSERT INTO `stockoutitem` VALUES ('4', 'ck2016060600003', '1', '5');
INSERT INTO `stockoutitem` VALUES ('5', 'ck2016060200001', '1', '10');
INSERT INTO `stockoutitem` VALUES ('9', 'ck2016060700001', '1', '4');
INSERT INTO `stockoutitem` VALUES ('10', 'ck2016060600003', '2', '3');
INSERT INTO `stockoutitem` VALUES ('11', 'ck2016060600003', '2', '8');
INSERT INTO `stockoutitem` VALUES ('12', 'ck2016060200002', '1', '5');
INSERT INTO `stockoutitem` VALUES ('15', 'ck2016060200003', '2', '15');
INSERT INTO `stockoutitem` VALUES ('17', 'ck2016060200005', '3', '1');
INSERT INTO `stockoutitem` VALUES ('18', 'ck2016060200005', '2', '4');
INSERT INTO `stockoutitem` VALUES ('19', 'ck2016060200006', '2', '1');
INSERT INTO `stockoutitem` VALUES ('21', 'ck2016060200007', '3', '1');
INSERT INTO `stockoutitem` VALUES ('22', 'ck2016060200007', '1', '2');
INSERT INTO `stockoutitem` VALUES ('23', 'ck2016060200008', '3', '3');
INSERT INTO `stockoutitem` VALUES ('27', 'ck2016060200003', '1', '1');
INSERT INTO `stockoutitem` VALUES ('28', 'ck2016060200001', '3', '3');
INSERT INTO `stockoutitem` VALUES ('31', 'ck2016060800001', '2', '1');
INSERT INTO `stockoutitem` VALUES ('32', 'ck2016060800001', '1', '2');
INSERT INTO `stockoutitem` VALUES ('33', 'ck2016060800004', '2', '2');
INSERT INTO `stockoutitem` VALUES ('37', 'ck2016060800003', '3', '1');
INSERT INTO `stockoutitem` VALUES ('38', 'ck2016060800004', '1', '1');
INSERT INTO `stockoutitem` VALUES ('39', 'ck2016060800002', '2', '1');
INSERT INTO `stockoutitem` VALUES ('40', 'ck2016060700002', '3', '2');
INSERT INTO `stockoutitem` VALUES ('41', 'ck2016060800004', '1', '10');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL auto_increment,
  `loginName` varchar(10) default NULL,
  `password` varchar(10) default NULL,
  `realName` varchar(10) default NULL,
  `phone` char(11) default NULL,
  `flag` int(11) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'xiaoyou', '123', '游昌劲', '15200857955', '0');
INSERT INTO `users` VALUES ('2', 'hanbon', '123456', '唐睿', '15574863447', '0');
INSERT INTO `users` VALUES ('3', 'yuji', '123', '梁宇棋', '15556894699', '0');
INSERT INTO `users` VALUES ('6', 'dd', '123', '谢金定', '13874873550', '0');
INSERT INTO `users` VALUES ('7', '小青年', '123', '谢金定', '13874873550', '0');
INSERT INTO `users` VALUES ('9', 'yuxing', '123', '余星', '15574869863', '0');

-- ----------------------------
-- Table structure for `warehouse`
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `wid` int(11) NOT NULL auto_increment,
  `wname` varchar(20) default NULL,
  `wuser` varchar(20) default NULL,
  `wphone` char(11) default NULL,
  `wnumber` int(11) default NULL,
  `flag` int(11) default NULL,
  PRIMARY KEY  (`wid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES ('1', '1号仓库', '张三', '15574865442', '100000');
INSERT INTO `warehouse` VALUES ('2', '2号仓库', '唐睿', '15574863447', '5000');
INSERT INTO `warehouse` VALUES ('3', '3号仓库', '王五', '13089763534', '9000');
INSERT INTO `warehouse` VALUES ('4', '4号仓库', '赵六', '15088173903', '20000');

-- ----------------------------
-- Procedure structure for `generate_orderNo`
-- ----------------------------
DROP PROCEDURE IF EXISTS `generate_orderNo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_orderNo`()
BEGIN
  DECLARE currentDate VARCHAR(15);
  DECLARE maxNo INT DEFAULT 0; 
  DECLARE oldOrderNo VARCHAR(25)  DEFAULT '';
  DECLARE newOrderNo VARCHAR(25)  DEFAULT '';   
    
  /*if num = 8 then   */
    SELECT DATE_FORMAT(NOW(), '%Y%m%d') INTO currentDate ;-- 订单编号形式:前缀+年月日+流水号，如：SH2013011000002   
  /*elseif num = 14 then -- 根据年月日时分秒生成订单编号   
    SELECT DATE_FORMAT(NOW(), '%Y%m%d%H%i%s') INTO currentDate ; -- 订单编号形式：前缀+年月日时分秒+流水号，如：SH2013011010050700001,个人不推荐使用这种方法生成流水号   
  else -- 根据年月日时分生成订单编号   
    SELECT DATE_FORMAT(NOW(), '%Y%m%d%H%i') INTO currentDate ;-- 订单形式：前缀+年月日时分+流水号,如：SH20130110100900005   
  end if ;  */
    
  SELECT IFNULL(sid, '') INTO oldOrderNo   
  FROM stockin   
  WHERE SUBSTRING(sid, 3, 8) = currentDate   
    AND SUBSTRING(sid, 1, 2) = 'rk'   
    and length(sid) = 7 + 8 
  ORDER BY sid DESC LIMIT 1 ; -- 有多条时只显示离现在最近的一条   
    
  IF oldOrderNo != '' THEN   
    SET maxNo = CONVERT(SUBSTRING(oldOrderNo, -5), DECIMAL) ;-- SUBSTRING(oldOrderNo, -5)：订单编号如果不为‘‘截取订单的最后5位   
  END IF ;  
  SELECT   
    CONCAT('rk', currentDate,  LPAD((maxNo + 1), 5, '0')) INTO newOrderNo ; -- LPAD((maxNo + 1), 5, '0')：如果不足5位，将用0填充左边   
    
  INSERT INTO stockin (sid,wid,loginName,stime,sremark,sstute ) VALUES (newOrderNo, '1','hanbon',currentDate,'weqwe','1' ) ; -- 向订单表中插入数据   
--    set newOrderNo = l_orderNo;   
 /* SELECT   
    newOrderNo ;  */

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `generate_orderNo1`
-- ----------------------------
DROP PROCEDURE IF EXISTS `generate_orderNo1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_orderNo1`()
BEGIN
  DECLARE currentDate VARCHAR(15);
  DECLARE maxNo INT DEFAULT 0; 
  DECLARE oldOrderNo VARCHAR(25)  DEFAULT '';   
  DECLARE newOrderNo VARCHAR(25)  DEFAULT '';  
  
    SELECT DATE_FORMAT(NOW(), '%Y%m%d') INTO currentDate ;-- 订单编号形式:前缀+年月日+流水号，如：SH2013011000002   
 
    
  SELECT IFNULL(soid, '') INTO oldOrderNo   
  FROM stockout   
  WHERE SUBSTRING(soid, 3, 8) = currentDate   
    AND SUBSTRING(soid, 1, 2) = 'ck'   
    and length(soid) = 7 + 8  
  ORDER BY soid DESC LIMIT 1 ; -- 有多条时只显示离现在最近的一条   
    
  IF oldOrderNo != '' THEN   
    SET maxNo = CONVERT(SUBSTRING(oldOrderNo, -5), DECIMAL) ;-- SUBSTRING(oldOrderNo, -5)：订单编号如果不为‘‘截取订单的最后5位   
  END IF ;  
  SELECT   
    CONCAT('ck', currentDate,  LPAD((maxNo + 1), 5, '0')) INTO newOrderNo ; -- LPAD((maxNo + 1), 5, '0')：如果不足5位，将用0填充左边   
    
  INSERT INTO stockout (soid,loginName,sotime,sostute ) VALUES (newOrderNo,'hanbon',currentDate,'1' ) ; -- 向订单表中插入数据   
--    set newOrderNo = l_orderNo;   
    

END
;;
DELIMITER ;
