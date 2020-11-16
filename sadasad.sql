-- --------------------------------------------------------
-- Host:                         192.168.123.34
-- Server version:               10.5.4-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for open4um
CREATE DATABASE IF NOT EXISTS `open4um` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `open4um`;

-- Dumping structure for table open4um.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `cartid` int(11) NOT NULL AUTO_INCREMENT,
  `proid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`cartid`),
  KEY `FK_cart_proid_product_proid` (`proid`),
  KEY `FK_cart_userid_user_userid` (`userid`),
  CONSTRAINT `FK_cart_proid_product_proid` FOREIGN KEY (`proid`) REFERENCES `product` (`proid`),
  CONSTRAINT `FK_cart_userid_user_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table open4um.cart: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- Dumping structure for table open4um.category
CREATE TABLE IF NOT EXISTS `category` (
  `ctgid` int(11) NOT NULL AUTO_INCREMENT,
  `ctgname` varchar(45) DEFAULT NULL,
  `ctgdate` varchar(45) DEFAULT NULL,
  `parentid` int(11) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ctgid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Dumping data for table open4um.category: ~13 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
REPLACE INTO `category` (`ctgid`, `ctgname`, `ctgdate`, `parentid`, `url`) VALUES
	(1, 'Thảo Luận Chung', '03/09/2020', 0, NULL),
	(2, 'Kiến Thức cần biết', '03/09/2020', 0, NULL),
	(3, 'Tin Tức CNTT', '03/09/2020', 1, '/open4um/forum/thaoluanchung/news/'),
	(4, 'Nghề Nghiệp\r\n', '03/09/2020', 1, '/open4um/forum/thaoluanchung/jobs/'),
	(6, 'Nhập Môn Lập Trình\r\n', '03/09/2020', 2, '/open4um/forum/kienthuc/nmlt/'),
	(7, 'Kĩ Thuật Lập trình\r\n', '03/09/2020', 2, '/open4um/forum/kienthuc/ktlt/'),
	(26, 'Source Web', '03/09/2020', 33, NULL),
	(27, 'Source Game', '03/09/2020', 34, NULL),
	(28, 'C#', '03/09/2020', 26, NULL),
	(29, 'Java', '03/09/2020', 26, NULL),
	(30, 'PHP', '03/09/2020', 26, NULL),
	(31, 'Unity', '03/09/2020', 27, NULL),
	(32, 'Cocos', '03/09/2020', 27, NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table open4um.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `cmtid` int(11) NOT NULL AUTO_INCREMENT,
  `cmtname` varchar(45) DEFAULT NULL,
  `datecmt` timestamp NULL DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `like` int(11) DEFAULT NULL,
  `dislikes` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `sourceid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmtid`),
  KEY `FK_comment_userid_user_userid` (`userid`),
  KEY `FK_comment_productid_product_proid` (`productid`),
  KEY `FK_comment_sourceid_source_sourceid` (`sourceid`),
  CONSTRAINT `FK_comment_productid_product_proid` FOREIGN KEY (`productid`) REFERENCES `product` (`proid`),
  CONSTRAINT `FK_comment_sourceid_source_sourceid` FOREIGN KEY (`sourceid`) REFERENCES `source` (`sourceid`),
  CONSTRAINT `FK_comment_userid_user_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='FK_comment_sourceid_source_sourceid';

-- Dumping data for table open4um.comment: ~38 rows (approximately)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
REPLACE INTO `comment` (`cmtid`, `cmtname`, `datecmt`, `userid`, `like`, `dislikes`, `parent`, `productid`, `sourceid`) VALUES
	(1, 'OK', '2020-09-10 08:58:51', 1, NULL, NULL, NULL, 1, 2),
	(2, 'Test', '2020-09-10 09:00:35', 2, NULL, NULL, 1, 1, NULL),
	(3, 'OK OK', '2020-09-10 09:03:17', 3, NULL, NULL, NULL, 1, NULL),
	(4, 'Hahaha', '2020-09-11 18:42:53', 154, NULL, NULL, 1, 1, NULL),
	(6, 'Good', '2020-09-15 10:35:30', 160, NULL, NULL, 1, 1, NULL),
	(7, 'Hay', '2020-09-15 10:35:49', 160, NULL, NULL, 3, 1, NULL),
	(8, 'Oh', '2020-09-15 10:44:55', 160, NULL, NULL, NULL, 1, NULL),
	(9, 'Test', '2020-09-15 11:06:30', 160, NULL, NULL, 3, 1, NULL),
	(10, 'Hay', '2020-09-15 11:06:45', 160, NULL, NULL, NULL, 1, NULL),
	(11, 'Okokok', '2020-09-15 11:52:20', 160, NULL, NULL, 1, 1, NULL),
	(12, 'OK', '2020-09-15 17:48:54', 160, NULL, NULL, 10, 1, NULL),
	(13, 'AAA', '2020-09-15 18:01:55', 160, NULL, NULL, 1, 1, NULL),
	(14, 'A', '2020-09-15 18:02:39', 160, NULL, NULL, 8, 1, NULL),
	(15, 'ok', '2020-09-15 18:02:45', 160, NULL, NULL, NULL, 1, NULL),
	(16, 'ok', '2020-09-15 18:09:45', 196, NULL, NULL, 1, 1, NULL),
	(17, 'a', '2020-09-16 08:58:09', 196, NULL, NULL, NULL, 1, NULL),
	(18, 'Hahaha', '2020-09-16 09:35:51', 160, NULL, NULL, NULL, 2, NULL),
	(19, 'hi', '2020-09-16 09:38:15', 196, NULL, NULL, NULL, 7, NULL),
	(20, 'dsfsd', '2020-09-16 14:03:08', 160, NULL, NULL, NULL, 1, NULL),
	(21, 'd', '2020-09-16 14:03:34', 160, NULL, NULL, NULL, 14, NULL),
	(22, 'a', '2020-09-16 14:43:37', 160, NULL, NULL, NULL, 14, NULL),
	(23, 'b', '2020-09-16 14:45:43', 160, NULL, NULL, NULL, 14, NULL),
	(24, 'alo', '2020-09-16 14:49:00', 160, NULL, NULL, 21, 14, NULL),
	(25, 'ki\n', '2020-09-16 14:49:07', 160, NULL, NULL, 21, 14, NULL),
	(26, 'alle\n', '2020-09-16 14:59:12', 160, NULL, NULL, 22, 14, NULL),
	(27, 'asd\n', '2020-09-16 15:02:20', 160, NULL, NULL, NULL, 14, NULL),
	(28, 's', '2020-09-16 15:02:23', 160, NULL, NULL, NULL, 14, NULL),
	(29, 's', '2020-09-16 15:02:24', 160, NULL, NULL, NULL, 14, NULL),
	(30, 's', '2020-09-16 15:02:26', 160, NULL, NULL, NULL, 14, NULL),
	(31, 'd', '2020-09-16 15:02:28', 160, NULL, NULL, NULL, 14, NULL),
	(32, 'f', '2020-09-16 15:02:30', 160, NULL, NULL, NULL, 14, NULL),
	(33, 'k', '2020-09-16 15:02:33', 160, NULL, NULL, NULL, 14, NULL),
	(34, 'r', '2020-09-16 15:02:36', 160, NULL, NULL, NULL, 14, NULL),
	(35, 'kisd', '2020-09-16 15:02:48', 160, NULL, NULL, NULL, 14, NULL),
	(36, 'aaaaaa', '2020-09-16 15:58:09', 160, NULL, NULL, NULL, 14, NULL),
	(37, 'aaaaa', '2020-09-16 15:58:14', 160, NULL, NULL, 36, 14, NULL),
	(38, 'aaaaa', '2020-09-16 15:58:28', 160, NULL, NULL, 36, 14, NULL),
	(39, 'chdgjfhjgkj', '2020-09-17 14:29:58', 196, NULL, NULL, NULL, 14, NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- Dumping structure for table open4um.historymoney
CREATE TABLE IF NOT EXISTS `historymoney` (
  `hismid` int(11) NOT NULL AUTO_INCREMENT,
  `money` double DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `discription` varchar(200) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`hismid`),
  KEY `FK_historymoney_userid_user_userid` (`userid`),
  CONSTRAINT `FK_historymoney_userid_user_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Dumping data for table open4um.historymoney: ~14 rows (approximately)
/*!40000 ALTER TABLE `historymoney` DISABLE KEYS */;
REPLACE INTO `historymoney` (`hismid`, `money`, `date`, `discription`, `userid`) VALUES
	(1, 25000, '2020-09-04 15:51:30', 'bigcity boiz', 1),
	(2, 50000, '2020-09-04 15:52:24', 'deep sea', 1),
	(3, 10000, '2020-09-04 15:52:38', 'alo', 2),
	(5, 20000, '2020-09-04 15:51:30', 'NAP TIEN', 160),
	(6, 10000, '2020-09-16 16:32:17', '1600248660658 NAP TIEN', 160),
	(7, 10000, '2020-09-16 18:41:17', '1600256452102 NAP TIEN', 160),
	(8, 10000, '2020-09-16 18:44:21', '1600256638440 NAP TIEN', 160),
	(9, 10000, '2020-09-16 18:46:26', '1600256769323 NAP TIEN', 160),
	(10, 10000, '2020-09-16 18:47:47', '1600256856748 NAP TIEN', 160),
	(11, 10000, '2020-09-16 18:47:47', '1600256856748 NAP TIEN', 160),
	(14, 15054564, '2020-09-17 14:31:53', '1600327816711 NAP TIEN', 196),
	(15, 50000, '2020-09-17 17:31:06', '1600338066324 NAP TIEN', 160),
	(16, 50000, '2020-09-18 16:24:01', '1600420933053 NAP TIEN', 160),
	(17, 50000, '2020-09-18 19:40:31', '1600432808709 NAP TIEN', 160);
/*!40000 ALTER TABLE `historymoney` ENABLE KEYS */;

-- Dumping structure for table open4um.message
CREATE TABLE IF NOT EXISTS `message` (
  `messid` int(11) NOT NULL AUTO_INCREMENT,
  `senduserid` int(11) DEFAULT NULL,
  `receiveuserid` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `datemsg` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`messid`),
  KEY `FK_message_senduserid_user_userid` (`senduserid`),
  KEY `FK_message_receiveuserid_user_userid` (`receiveuserid`),
  CONSTRAINT `FK_message_receiveuserid_user_userid` FOREIGN KEY (`receiveuserid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_message_senduserid_user_userid` FOREIGN KEY (`senduserid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table open4um.message: ~12 rows (approximately)
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
REPLACE INTO `message` (`messid`, `senduserid`, `receiveuserid`, `content`, `datemsg`) VALUES
	(1, 1, 149, 'sadsadsadadasd', '2020-09-07 17:03:04'),
	(2, 149, 1, 'hello cau', '2020-09-07 17:03:39'),
	(3, 3, 1, 'asdd', '2020-09-07 17:04:34'),
	(4, 1, 2, 'boop boop', '2020-09-08 13:25:34'),
	(5, 1, 2, 'merong merong', '2020-09-08 16:08:24'),
	(6, 1, 149, 'bankai', '2020-09-09 13:48:48'),
	(7, 160, 1, 'welcome to my life', '2020-09-15 14:44:50'),
	(8, 1, 160, 'so sad', '2020-09-15 14:45:12'),
	(9, 160, 3, 'GOOD MORNING', '2020-09-18 08:35:54'),
	(10, 160, 1, 'Thinh', '2020-09-18 19:42:31'),
	(11, 1, 160, 'hello', '2020-09-18 19:42:51'),
	(12, 1, 160, 'uida', '2020-09-18 19:43:05');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;

-- Dumping structure for table open4um.orderhistory
CREATE TABLE IF NOT EXISTS `orderhistory` (
  `orid` int(11) NOT NULL AUTO_INCREMENT,
  `orderdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `userid` int(11) NOT NULL,
  `sourceid` int(11) DEFAULT NULL,
  PRIMARY KEY (`orid`),
  KEY `FK_orderhistory_userid_user_userid` (`userid`),
  KEY `FK_orderhistory_sourceid_source_sourceid` (`sourceid`),
  CONSTRAINT `FK_orderhistory_sourceid_source_sourceid` FOREIGN KEY (`sourceid`) REFERENCES `source` (`sourceid`),
  CONSTRAINT `FK_orderhistory_userid_user_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table open4um.orderhistory: ~5 rows (approximately)
/*!40000 ALTER TABLE `orderhistory` DISABLE KEYS */;
REPLACE INTO `orderhistory` (`orid`, `orderdate`, `userid`, `sourceid`) VALUES
	(1, '2020-09-07 18:44:55', 3, 1),
	(2, '2020-09-07 18:45:19', 3, 4),
	(3, '2020-09-07 18:45:39', 8, 2),
	(4, '2020-09-07 18:45:59', 3, 2),
	(5, '2020-09-07 18:46:05', 2, 2);
/*!40000 ALTER TABLE `orderhistory` ENABLE KEYS */;

-- Dumping structure for table open4um.product
CREATE TABLE IF NOT EXISTS `product` (
  `proid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `ctgid` int(11) NOT NULL,
  `like` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `datepost` varchar(50) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `stateid` int(11) NOT NULL,
  `reason` text DEFAULT NULL,
  `dislikes` int(11) DEFAULT NULL,
  PRIMARY KEY (`proid`),
  KEY `FK_product_stateid_stateProduct_stateid` (`stateid`),
  KEY `FK_product_category` (`ctgid`),
  KEY `FK_product_user` (`userid`),
  CONSTRAINT `FK_product_category` FOREIGN KEY (`ctgid`) REFERENCES `category` (`ctgid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_product_stateid_stateProduct_stateid` FOREIGN KEY (`stateid`) REFERENCES `stateproduct` (`stateid`),
  CONSTRAINT `FK_product_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='(cmtid)';

-- Dumping data for table open4um.product: ~12 rows (approximately)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
REPLACE INTO `product` (`proid`, `title`, `ctgid`, `like`, `views`, `datepost`, `content`, `image`, `userid`, `stateid`, `reason`, `dislikes`) VALUES
	(1, 'Nâng cấp màn hình Full HD cho laptop hihi', 2, 13, 20, '2020-09-03 14:54:06', 'Chào các bạn, mình thấy có khá nhiều bạn hỏi về vấn đề nâng cấp màn hình Full HD cho laptop mà các bạn đang sử dụng. Mình xin chia sẻ một số kinh nghiệm như sau:', '4454564_og.jpg', 8, 1, NULL, 1),
	(2, 'Làm thế nào để xây dựng phong cách làm việc chuyên nghiệp?', 4, 9, 23, '2020-09-03 14:55:09', 'Có nhiều tiêu chuẩn khác nhau để đánh giá tính chuyên nghiệp của một cá nhân, tóm gọn lại có 10 tiêu chuẩn cơ bản sau giúp bạn xây dựng và hoàn thiện tính chuyên nghiệp trong phong cách làm việc tại công ty:', 'newscntt1.png', 159, 2, NULL, 2),
	(3, 'Samsung ra mắt máy chiếu tầm gần 130 inch 4K HDR10+', 6, 3, 22, '2020-09-03 14:56:44', 'Samsung vừa giới thiệu The Premiere, dòng máy chiếu tầm gần của họ thuộc dải sản phẩm Lifestyle, gồm 2 mẫu máy chiếu hỗ trợ độ phân giải 4K và kích thước màn chiếu rộng 130 inch. The Premiere sẽ được bán ra cuối năm nay, tuy nhiên chưa có giá cụ thể.', 'newscntt1.png', 197, 2, NULL, 1),
	(4, 'Phần mềm quản lý group facebook – Ninja Group', 7, 12, 333, '2020-09-03 14:57:57', 'Phần mềm quản lý group sẽ giúp các Admin quản lý hệ thống Group, tự động chăm sóc, nuôi group facebook của mình một cách dễ dàng, hiệu quả và chính xác với các chức năng cực kỳ tuyệt vời mà ngay cả chính các Admin, Mod cũng không thể làm tốt hơn được.', 'newscntt1.png', 161, 2, NULL, 1),
	(5, 'CEO của HTC từ chức', 3, 4, 234, '2020-09-03 16:38:03', 'Chưa đầy một năm sau khi được bổ nhiệm chủ tịch và CEO của HTC, Yves Maitre hôm nay đã từ chức và nhường lại vị trí CEO cho người đồng sáng lập HTC là Cher Wang. Tình hình dịch bệnh khiến Yves Maitre phải ở lại châu Âu là lý do được đưa ra nhưng kết quả kinh doanh có tác động nhất định đến quyết định này.', 'newscntt1.png', 164, 2, NULL, 2),
	(6, 'Công việc của quản trị tuyển dụng', 4, 2, 432, '2020-09-07 19:14:39', 'Trong vô số các công việc liên quan của phòng nhân sự, tuyển dụng là nhiệm vụ chiếm tỷ trọng cao cả về số lượng và mức độ quan trọng. Đa phần nhiệm vụ này sẽ do trưởng phòng hoặc giám đốc nhân sự trực tiếp điều phối. Thuật ngữ chuyên ngành gọi riêng đây là công tác quản trị tuyển dụng với hàng loạt công việc gắn kết chặt chẽ với nhau. Chi tiết cụ thể TalentBold sẽ thể hiện qua bài viết dưới đây.\r\n\r\nNhững doanh nghiệp có lượng nhân sự lớn, biến động thường xuyên còn có thể lập riêng một phòng ban chuyên về quản trị tuyển dụng nhằm đảm bảo nhu cầu nhân lực luôn được lấp đầy nhanh chóng và hiệu quả.\r\n\r\nI. Khái quát về quản trị tuyển dụng\r\nQuản trị tuyển dụng là việc tìm kiếm, chiêu mộ nhân viên phù hợp nhất với vị trí đang trống tại một phòng ban nào đó trong doanh nghiệp.\r\n\r\n\r\nCông việc này đặt nặng về chất lượng và sự sáng tạo trong cách làm việc, bởi lẽ, cùng một lúc người quản trị tuyển dụng có thể tuyển hàng trăm nhân sự cho nhiều phòng ban khác nhau mà vẫn phải đảm bảo chất lượng ứng viên như yêu cầu.\r\n\r\nII. Những công việc cần làm tại vị trí quản trị tuyển dụng\r\n1. Tiếp nhận thông tin bổ sung nhân lực từ phòng ban cụ thể\r\nNhững phòng ban trong doanh nghiệp khi thiếu hụt nhân sự đều sẽ liên hệ và gửi yêu cầu bổ sung nhân lực đến phòng nhân sự, cụ thể là người quản trị tuyển dụng.\r\n\r\n2. Trình ban giám đốc phê duyệt yêu cầu tuyển dụng\r\nTừ yêu cầu nhận được, phòng nhân sự sẽ báo cáo cấp trên để xin chỉ thị về việc lập kế hoạch tuyển dụng thêm nhân lực hay không.\r\n\r\n3. Viết bài và đăng tin tuyển dụng\r\nKhi đã được phê duyệt, đăng thông tin tìm kiếm ứng viên sẽ là công việc tiếp theo của quản trị tuyển dụng.\r\n\r\nSoạn thảo bài viết tuyển dụng với đầy đủ thông tin về vị trí công việc, yêu cầu, mô tả công việc cụ thể…, đồng thời phải chọn lựa kênh tuyển dụng trực tuyến thích hợp để đăng tin.\r\n\r\n4. Tiếp nhận hồ sơ ứng viên\r\nDoanh nghiệp có thể tiếp nhận hồ sơ trực tiếp tại văn phòng, nhận hồ sơ qua email trực tiếp hoặc qua email liên kết với kênh tuyển dụng trực tiếp.\r\n\r\nMỗi ngày đều phải tổng hợp lại hồ sơ và lên kế hoạch sàng lọc ứng viên phù hợp để tránh quá tải.\r\n\r\n5. Chuyển danh sách ứng viên dự kiến qua phòng ban nơi cần bổ sung nhân lực\r\nTrực tiếp người quản trị tuyển dụng sẽ sàng lọc danh sách ứng viên phù hợp và gửi cho trưởng phòng nơi cần nhân lực kiểm tra, phê duyệt lại lần nữa.\r\n\r\nQuy trình này khá quan trọng vì trưởng phòng là người nắm rõ yêu cầu công việc đang thiếu nhân sự, và ứng viên cần sở hữu tố chất quan trọng nào nhất.\r\n\r\nBên cạnh đó, những yêu cầu đặc biệt khi phỏng vấn ứng viên cũng có thể được trưởng phòng ghi chú cụ thể, tạo thuận lợi cho người phỏng vấn.\r\n\r\n6. Lên lịch hẹn phỏng vấn ứng viên\r\nTừ danh sách ứng viên đã phê duyệt, phòng nhân sự sẽ lên lịch hẹn phỏng vấn dựa trên khung thời gian làm việc của người phỏng vấn và của ứng viên.\r\n\r\nThông thường thông báo lịch hẹn phỏng vấn sẽ gửi qua email, nếu người quản trị tuyển dụng muốn phỏng vấn sơ bộ thì có thể thông báo bằng điện thoại.\r\n\r\n7. Báo cáo cấp trên về kết quả phỏng vấn\r\nSau khi hoàn tất phỏng vấn tất cả ứng viên, người quản trị tuyển dụng sẽ lập báo cáo trình lên cấp trên.\r\n\r\nCấp trên và trưởng phòng nơi cần nhân lực sẽ trực tiếp thảo luận cùng nhau, cân nhắc lựa chọn ứng viên và gửi danh sách ứng viên trúng tuyển về phòng nhân sự.\r\n\r\n8. Liên lạc ứng viên trúng tuyển và sắp xếp thời gian nhận việc\r\nLiên lạc trực tiếp với ứng viên trúng tuyển để thỏa thuận thời gian bắt đầu thời gian thử việc. Sau đó, gửi một email xác nhận với thời gian đã thống nhất là quy trình thông báo được đánh giá chuyên nghiệp.\r\n\r\nNếu có thay đổi gì từ 01 trong 02 bên, việc trao đổi nên diễn ra trên email để các cấp quản lý có đính kèm trong email có thể cập nhật tình hình thường xuyên.\r\n\r\n9. Đánh giá kết quả ứng viên sau thời gian thử việc\r\nCông việc quản trị tuyển dụng vẫn phải tiếp tục với việc theo dõi kết quả báo cáo thử việc từ quản lý trực tiếp của ứng viên.\r\n\r\nThậm chí, trong quá trình thử việc có thể người quản trị tuyển dụng phải đổi ứng viên mới nếu ứng viên thử việc hoặc người quản lý trực tiếp cảm thấy bên còn lại không phù hợp với mong muốn và sự kỳ vọng, khó gắn bó lâu dài.\r\n\r\n10. Báo cáo ban lãnh đạo, hoàn tất hồ sơ tuyển dụng chính thức\r\nNếu kết quả thử việc được đánh giá tốt, phù hợp yêu cầu doanh nghiệp, người quản trị sẽ lập báo cáo lên ban lãnh đạo và tiến hành hồ sơ ký kết hợp đồng lao động chính thức.\r\n\r\nIII. Ứng dụng công nghệ trong công tác quản trị tuyển dụng\r\nNhững doanh nghiệp, tập đoàn lớn, lượng công việc quản trị tuyển dụng rất lớn, để tiết kiệm thời gian, nâng cao năng suất hiệu quả làm việc của người quản trị tuyển dụng, trang bị phần mềm quản trị tuyển dụng đang là xu hướng hiện nay.\r\n\r\nThông qua phần mềm này, mọi công việc liên quan đến quản trị tuyển dụng đều sẽ được tự động hóa theo tiêu chí lựa chọn, ví dụ:\r\n\r\nTạo mẫu CV riêng cho doanh nghiệp\r\n\r\nTổng hợp thông tin nhanh chóng theo từng tiêu chí trong mẫu CV\r\n\r\nTự động sàng lọc danh sách ứng viên theo một hoặc một số tiêu chí, tùy người quản trị tuyển dụng chọn\r\n\r\nTổng hợp danh sách báo cáo, đánh giá mức độ phù hợp của ứng viên, đánh giá hiệu quả các kênh tuyển dụng… đều được tính toán tự động và thể hiện bằng những con số cụ thể\r\n\r\nPhỏng vấn trực tuyến ứng viên ở xa hoặc khi người trực tiếp phỏng vấn đang đi công tác…\r\nNhân tài là rường cột chủ chốt, có được nhân viên giỏi chính là nền tảng ban đầu cho mọi thành công của doanh nghiệp. Vì vậy, quản trị tuyển dụng luôn là tuyến đầu với trọng trách nặng nề khi là nơi tiếp nhận và sàng lọc nhân tài.\r\n\r\nTheo dõi xu hướng quản trị tuyển dụng từ nhiều năm nay, TalenBold nhận thấy từ khi phần mềm quản trị tuyển dụng hiện hữu tại các doanh nghiệp, người quản trị tuyển dụng tối giản nhiều công đoạn tạo nguồn ứng viên, thời gian tập trung cho chất lượng ứng viên nhiều hơn, nhờ vậy, kết quả hoạt động của hàng loạt doanh nghiệp được cải thiện đáng kể.', '5150611_cover_PiP_Windows_tinhte.jpg', 160, 2, NULL, 2),
	(7, 'HP làm smartphone màn hình gập hihi?', 7, 5, 400, '2020-09-10 16:18:46', 'Theo LetsGoDigital, vào tháng trước HP đã nhận được bằng sáng chế về smartphone màn hình gập giống thiết kế Samsung Galaxy Z Flip, Motorola Razr 2019. Liệu trong tương lai thiết bị này có được hãng chính thức ra mắt?', '4454564_og.jpg', 3, 1, NULL, 4),
	(8, 'OPPO ra mắt ColorOS 11: nhiều tính năng hấp dẫn, cải thiện hiệu năng', 29, 3, 400, '2020-09-10 16:20:18', 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 'hinh-nen-may-tinh-11.jpg', 160, 1, NULL, 5),
	(10, 'Apple đang đóng website bán hàng, chuẩn bị cho sự kiện đang đến rất gần', 28, 3, 3, '2020-09-10 16:24:08', 'cccccccccccccccccccccccccccccccccccccc', 'newscntt1.png', 151, 1, NULL, 10),
	(13, 'Đồng nhất thức Euler và sự quyến rũ của toán học hihi', 29, 3, 3, '2020-09-10 16:26:21', 'rrrrrrrrrrrrrrrrrrrrr', '4454564_og.jpg', 160, 1, NULL, 12),
	(14, 'Apple Watch SE chính thức: Sử dụng chip S5, giá 279 đô', 3, 18, 514, '2020-09-16 08:50:43', 'Apple ra mắt thêm phiên bản giá rẻ của Apple Watch có tên gọi là Apple Watch SE. Mẫu đồng hồ mới sử dụng con chip Apple S5 tương tự như dòng Series 5 và tất nhiên mức giá khởi điểm 279 USD sẽ dễ tiếp cận hơn với nhiều người dùng.', 'newscntt1.png', 165, 2, NULL, NULL),
	(20, 'Vách ngăn ...', 3, 0, 1, '2020-09-18 15:34:38.0572', 'Vách ngăn vệ sinh giá rẻ là thương hiệu phân phối vách ngăn, thi công vách ngăn nhà vệ sinh compact hpl giá rẻ chất lượng cao tại Hà Nội, Đà Nẵng, HCM', 'aaaa.png', 164, 1, NULL, 0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table open4um.rating
CREATE TABLE IF NOT EXISTS `rating` (
  `rateid` int(11) NOT NULL AUTO_INCREMENT,
  `ratevalue` int(11) DEFAULT NULL,
  `ratename` varchar(45) DEFAULT NULL,
  `sourceid` int(11) DEFAULT NULL,
  PRIMARY KEY (`rateid`),
  KEY `FK_rating_sourceid_source_sourceid` (`sourceid`),
  CONSTRAINT `FK_rating_sourceid_source_sourceid` FOREIGN KEY (`sourceid`) REFERENCES `source` (`sourceid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table open4um.rating: ~1 rows (approximately)
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
REPLACE INTO `rating` (`rateid`, `ratevalue`, `ratename`, `sourceid`) VALUES
	(1, 5, 'tot', 6);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;

-- Dumping structure for table open4um.report
CREATE TABLE IF NOT EXISTS `report` (
  `reportid` int(11) NOT NULL AUTO_INCREMENT,
  `reportname` text NOT NULL,
  `userid` int(11) NOT NULL,
  `productid` int(11) DEFAULT NULL,
  `reportdate` timestamp NULL DEFAULT NULL,
  `cmtid` int(11) DEFAULT NULL,
  PRIMARY KEY (`reportid`),
  KEY `FK_report_userid_user_userid` (`userid`),
  KEY `FK_report_productid_product_proid` (`productid`),
  KEY `FK_report_cmtid_comment_cmtid` (`cmtid`),
  CONSTRAINT `FK_report_cmtid_comment_cmtid` FOREIGN KEY (`cmtid`) REFERENCES `comment` (`cmtid`),
  CONSTRAINT `FK_report_productid_product_proid` FOREIGN KEY (`productid`) REFERENCES `product` (`proid`),
  CONSTRAINT `FK_report_userid_user_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='(cmtid)';

-- Dumping data for table open4um.report: ~8 rows (approximately)
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
REPLACE INTO `report` (`reportid`, `reportname`, `userid`, `productid`, `reportdate`, `cmtid`) VALUES
	(2, 'Spam', 160, 1, '2020-09-15 14:32:01', 1),
	(3, 'Spam', 160, NULL, '2020-09-15 14:37:28', 1),
	(7, 'Spam', 160, 1, '2020-09-15 15:27:56', 1),
	(8, 'Spam spam!', 160, NULL, '2020-09-15 15:33:44', 1),
	(11, 'a', 160, NULL, '2020-09-15 16:03:37', 1),
	(14, 'Spamm', 160, 1, '2020-09-15 16:09:59', NULL),
	(15, 'Spammmm', 160, NULL, '2020-09-15 16:10:13', 1),
	(16, 'ABC', 160, 1, '2020-09-15 17:48:28', NULL);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;

-- Dumping structure for table open4um.role
CREATE TABLE IF NOT EXISTS `role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `roleaccount_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table open4um.role: ~3 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
REPLACE INTO `role` (`roleid`, `roleaccount_name`) VALUES
	(1, 'user'),
	(2, 'censor'),
	(3, 'admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table open4um.roleaccount
CREATE TABLE IF NOT EXISTS `roleaccount` (
  `roleaccount_id` int(11) NOT NULL AUTO_INCREMENT,
  `roleaccount_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roleaccount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table open4um.roleaccount: ~0 rows (approximately)
/*!40000 ALTER TABLE `roleaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `roleaccount` ENABLE KEYS */;

-- Dumping structure for table open4um.role_user
CREATE TABLE IF NOT EXISTS `role_user` (
  `role_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`role_user_id`),
  KEY `FK_role_user_user` (`userid`),
  KEY `FK_role_user_role` (`roleid`),
  CONSTRAINT `FK_role_user_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`),
  CONSTRAINT `FK_role_user_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- Dumping data for table open4um.role_user: ~32 rows (approximately)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
REPLACE INTO `role_user` (`role_user_id`, `userid`, `roleid`) VALUES
	(1, 163, 3),
	(2, 147, 2),
	(3, 8, 1),
	(4, 197, 3),
	(5, 151, 1),
	(6, 198, 1),
	(7, 3, 1),
	(10, 159, 3),
	(11, 160, 3),
	(12, 155, 3),
	(14, 173, 1),
	(15, 2, 1),
	(18, 157, 1),
	(19, 196, 1),
	(20, 162, 1),
	(21, 1, 1),
	(22, 160, 1),
	(23, 156, 1),
	(24, 154, 1),
	(25, 174, 3),
	(26, 149, 1),
	(27, 161, 1),
	(28, 152, 1),
	(29, 164, 3),
	(30, 165, 1),
	(31, 173, 3),
	(34, 201, 1),
	(40, 210, 1),
	(41, 211, 1),
	(42, 212, 1),
	(43, 213, 1),
	(44, 215, 1);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

-- Dumping structure for table open4um.source
CREATE TABLE IF NOT EXISTS `source` (
  `sourceid` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `sourcename` varchar(500) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `contentdetails` varchar(1000) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `ctgid` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `stateid` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `dowloads` int(11) DEFAULT NULL,
  PRIMARY KEY (`sourceid`),
  KEY `FK_source_stateid_stateProduct_stateid` (`stateid`),
  KEY `FK_source_ctgid_category_ctgid` (`ctgid`),
  KEY `FK_source_userid_user_userid` (`userid`),
  CONSTRAINT `FK_source_ctgid_category_ctgid` FOREIGN KEY (`ctgid`) REFERENCES `category` (`ctgid`),
  CONSTRAINT `FK_source_stateid_stateProduct_stateid` FOREIGN KEY (`stateid`) REFERENCES `stateproduct` (`stateid`),
  CONSTRAINT `FK_source_userid_user_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- Dumping data for table open4um.source: ~30 rows (approximately)
/*!40000 ALTER TABLE `source` DISABLE KEYS */;
REPLACE INTO `source` (`sourceid`, `date`, `sourcename`, `size`, `contentdetails`, `title`, `userid`, `ctgid`, `price`, `avatar`, `stateid`, `views`, `dowloads`) VALUES
	(1, '2020-09-03 18:50:50', 'Giải Sudoku bằng Java Swing', NULL, NULL, NULL, 1, 29, 10000, 'giai-sudoku-bang-java-swing-91548.jpg', 2, 123, 100),
	(2, '2020-09-04 08:07:38', 'Lập trình game sudoku java full source code giao diện đẹp', NULL, NULL, '2', 2, 29, 50000, 'lap-trinh-game-sudoku-java-full-source-code-giao-dien-dep-162417.jpg', 2, 114, 50),
	(3, '2020-09-04 08:12:14', 'Assignment Quản lý nhân viên java 2 fpt polytechnic, java swing', NULL, NULL, NULL, 1, 28, 30000, 'assignment-quan-ly-nhan-vien-java-2-fpt-polytechnic-java-swing-183848.jpg', 1, 632, 20),
	(4, '2020-09-07 16:28:11', '"Ball game" code thuần với Python vừa chơi vừa học, bổ mắt', NULL, NULL, NULL, 2, 30, 2000, 'hero.png', 2, NULL, 10),
	(5, '2020-09-03 21:50:50', 'Quản Lý Phòng Trọ có kết nối SQL server', NULL, NULL, NULL, NULL, 29, NULL, 'full-code-website-tin-tuc-asp.net-mvc5-reponsive-database-121744.jpg', NULL, NULL, NULL),
	(6, '2020-09-09 09:55:06', 'Website quản lý học phí cho trường mầm non', NULL, 'sssssssssssssss sssssssssssssssssssssssss\r\nssssssssssssssssssss  ssssssssssssssssssss\r\nssssssssssssssssssssssssssssssssssssssssssssssssssss\r\nsssssssssssssssssa aaaaaaaaaaaaaaaaaaa\r\n aaaaaaaaaaaaaa', NULL, NULL, 31, NULL, 'website-quan-ly-hoc-phi-cho-truong-mam-non-112832.jpg', NULL, NULL, NULL),
	(7, '2020-09-09 09:55:19', 'Code scam phising vòng quay pubg mobile', NULL, NULL, NULL, NULL, 28, NULL, 'code-scam-phising-vong-quay-pubg-mobile-82449.jpg', NULL, NULL, NULL),
	(8, '2020-09-09 09:55:23', 'Source Code Math Game React Native React Hook + React Navigation v5 + ES2020', NULL, NULL, NULL, NULL, 30, NULL, 'source-code-math-game-react-native-react-hook-react-navigation-v5-es2020-16255.jpg', NULL, NULL, NULL),
	(9, '2020-09-09 09:55:32', 'Full Code Web Suất ăn Công Nghiệp Chuẩn SEO', NULL, NULL, NULL, NULL, 28, NULL, 'full-code-web-suat-an-cong-nghiep-chuan-seo-16330.jpg', NULL, NULL, NULL),
	(10, '2020-09-09 09:55:38', 'Full Code(PHP) Web Điện Năng Lượng Mặt Trời Chuẩn SEO', NULL, 'Tải về và giải nén ra (các bạn sẽ nhận được 5 file)', NULL, NULL, 32, NULL, 'full-code-web-dien-nang-luong-mat-troi-chuan-seo-164927.jpg', NULL, NULL, NULL),
	(21, '2019-09-16 11:26:09', 'Code Web Cửa Hàng Camera Quan Sát Đẹp - Đầy Đủ - Chuẩn SEO', '111', NULL, NULL, NULL, 29, NULL, 'code-web-cua-hang-camera-quan-sat-dep---day-du---chuan-seo-92120.jpg', NULL, NULL, NULL),
	(22, '2019-08-16 11:26:11', 'Full Code Web Công Ty Kiến Trúc - Xây Dựng Đẹp Chuẩn SEO', '111', '111', NULL, NULL, 29, NULL, 'full-code-web-cong-ty-kien-truc---xay-dung-dep-chuan-seo-14117.jpg', NULL, NULL, NULL),
	(23, '2018-09-16 11:26:12', 'Source code + Full báo cáo đồ án, bài tập lớn website bán sách bằng Asp.Net', '111', '111', '111', NULL, 31, NULL, 'source-code-bao-cao-do-an-bai-tap-lon-website-ban-sach-bang-asp.net-13571.jpg', NULL, NULL, NULL),
	(24, '2017-09-16 11:26:13', 'Script tạo video player cho 20 host như Google Drive , Youtube , Facebook , Tiktok , Video ... Player Script', '111', '111', '111', 1, 28, NULL, 'script-tao-video-player-cho-20-host-nhu-google-drive-youtube-facebook-tiktok-video-...-player-script-81821.jpg', NULL, NULL, NULL),
	(25, '2017-09-16 11:26:14', 'Template Website bán hàng', '111', '111', '111', 1, 30, NULL, 'template-website-ban-hang-104745.jpg', NULL, NULL, NULL),
	(26, '2018-09-16 11:26:15', 'Full code + báo cáo đồ án hệ thống website cho thuê xe máy ASP.NET', '111', '111', '111', 1, 30, 100000, 'full-code-bao-cao-do-an-he-thong-website-cho-thue-xe-may-asp.net-114118.jpg', NULL, NULL, NULL),
	(27, '2019-09-09 09:55:38', 'Phising Facebook nhận quà vòng quay', '111', '111', '111', 1, 30, 100000, 'phising-facebook-nhan-qua-vong-quay-115117.jpg', 1, NULL, NULL),
	(51, '2020-09-14 08:23:54', 'SuperS_Siêu thị sạch (ionic) - Ứng dụng giao hàng thực phẩm, hàng tạp', '22.txt', 'ccccccccc', 'ccccccccccccc', 1, 29, 7, 'supers_sieu-thi-sach-ionic---ung-dung-giao-hang-thuc-pham-hang-tap-hoa-danh-cho-android-ios-voi-bang-dieu-khien-quan-tri-hoan-chinh-23101.jpg', NULL, NULL, NULL),
	(52, '2020-09-14 08:37:14', 'Web bán điện thoại html và css', 'controller.txt', 'dddddddd', 'dddddddddd', 1, 31, 6, 'web-ban-dien-thoai-html-va-css-14055.jpg', NULL, NULL, NULL),
	(53, '2020-09-14 16:43:18', 'Full Code Web Bất Động Sản Đẹp - Mượt - Chuẩn SEO', 'phoot.txt', 'fff', '				gg						', 1, 32, 6, 'full-code-web-bat-dong-san-dep---muot---chuan-seo-92538.jpg', NULL, NULL, NULL),
	(54, '2020-09-14 16:48:57', 'Full Source Code Đồ Án Xây dựng giao thức Oauth 2.0 trên website Localhost', 'phoot.txt', 'fff', '				gg						', 1, 30, 6, 'full-source-code-do-an-xay-dung-giao-thuc-oauth-2.0-tren-website-localhost-83425.jpg', NULL, NULL, NULL),
	(55, '2020-09-14 16:50:09', 'Phần mềm quản lý nhà hàng + báo cáo phân tích thiết kế hệ thống, cơ sở dữ', 'phoot.txt', 'fff', '				gg						', 1, 31, 6, 'phan-mem-quan-ly-nha-hang-bao-cao-phan-tich-thiet-ke-he-thong-co-so-du-lieu-82451.jpg', NULL, NULL, NULL),
	(56, '2020-09-14 16:50:40', 'Source web wordpress shop bán hàng thời trang', 'sql3.sql', 'vvvvvvvv', '		vvvvvvvv								', 1, 28, 4, 'source-web-wordpress-shop-ban-hang-thoi-trang-13571.jpg', NULL, NULL, NULL),
	(57, '2020-09-14 16:52:59', 'Đồ Án Lập Trình Windows - Quản Lý Nhà Hàng Full', 'sql3.sql', 'vvvvvvvv', '		vvvvvvvv								', 1, 32, 4, 'do-an-lap-trinh-windows---quan-ly-nha-hang-full-225222.jpg', NULL, NULL, NULL),
	(59, '2020-09-16 11:26:11', 'Công cụ SEO & Phân tích khách truy cập hoàn chỉnh nhất', 'sql3.sql', 'SDS', '				DSDAS						', 1, 31, 3, 'cong-cu-seo-phan-tich-khach-truy-cap-hoan-chinh-nhat-11385.jpg', NULL, 5, 4),
	(60, '2020-09-16 11:26:12', 'Full code dự án web bán hàng hạt điều & giới thiệu công ty hamy.com.cn', 'query4.sql', 'dss', '	dasda									', 1, 30, 3, 'full-code-du-an-web-ban-hang-hat-dieu-gioi-thieu-cong-ty-hamy.com.cn-84017.jpg', NULL, 2, 1),
	(61, '2020-09-16 11:26:14', 'Template Blogspot Website bán hàng phù hợp với nhiều lĩnh vực', 'sql3.sql', 'asd', '		dfsdf								', 1, 32, 3, 'template-blogspot-website-ban-hang-phu-hop-voi-nhieu-linh-vuc-145026.jpg', NULL, 2341, 0),
	(62, '2020-09-16 11:26:15', 'Full Code Website Tin Tức ASP.NET MVC5 (Reponsive) + Database', 'query4.sql', 'assadad', '		sdf								', 1, 28, 3, 'full-code-website-tin-tuc-asp.net-mvc5-reponsive-database-121744.jpg', NULL, 23, 2),
	(100, '2020-09-16 09:55:38', 'Phần mềm bán hàng tích hợp email marketing', '111', '11', '111', 160, 28, 20000, 'phan-mem-ban-hang-tich-hop-email-marketing-153745.jpg', 2, 123, 21),
	(101, '2020-09-16 19:00:35', 'Assignment Android cơ bản FPT Polytechnic Quản lý sinh viên', 'sourceview.txt', '<p><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR-dP8LAnBZWVN9bUqaF_gfpLy8EcylPyOxkQ&amp;usqp=CAU" alt="" width="284" height="177" /></p>\r\n<p>hihi</p>\r\n<p>hdhdhdhdhdhdh</p>\r\n<p>dhdhdhdh</p>\r\n<p>dhhdhđh</p>', '					hjhjhj					', 1, 32, 4, 'assignment-android-co-ban-fpt-polytechnic-quan-ly-sinh-vien-91721.jpg', NULL, NULL, NULL);
/*!40000 ALTER TABLE `source` ENABLE KEYS */;

-- Dumping structure for table open4um.stateproduct
CREATE TABLE IF NOT EXISTS `stateproduct` (
  `stateid` int(11) NOT NULL AUTO_INCREMENT,
  `statename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stateid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table open4um.stateproduct: ~2 rows (approximately)
/*!40000 ALTER TABLE `stateproduct` DISABLE KEYS */;
REPLACE INTO `stateproduct` (`stateid`, `statename`) VALUES
	(1, 'Chưa duyệt'),
	(2, 'Đã Duyệt');
/*!40000 ALTER TABLE `stateproduct` ENABLE KEYS */;

-- Dumping structure for table open4um.tag
CREATE TABLE IF NOT EXISTS `tag` (
  `tagid` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table open4um.tag: ~0 rows (approximately)
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;

-- Dumping structure for table open4um.tag_product
CREATE TABLE IF NOT EXISTS `tag_product` (
  `tag_productid` int(11) NOT NULL AUTO_INCREMENT,
  `tagid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  PRIMARY KEY (`tag_productid`),
  KEY `FK_tag_product_productid_product_proid` (`productid`),
  KEY `FK_tag_product_tagid_tag_tagid` (`tagid`),
  CONSTRAINT `FK_tag_product_productid_product_proid` FOREIGN KEY (`productid`) REFERENCES `product` (`proid`),
  CONSTRAINT `FK_tag_product_tagid_tag_tagid` FOREIGN KEY (`tagid`) REFERENCES `tag` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table open4um.tag_product: ~0 rows (approximately)
/*!40000 ALTER TABLE `tag_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_product` ENABLE KEYS */;

-- Dumping structure for table open4um.user
CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `fbid` varchar(50) DEFAULT NULL,
  `emailid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;

-- Dumping data for table open4um.user: ~33 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`userid`, `username`, `password`, `phone`, `email`, `status`, `avatar`, `money`, `fbid`, `emailid`) VALUES
	(1, 'Bew', '123', '090908869', 'nguyenthai1701@gmail.com', NULL, '/resources/images/tu-vi-12-con-giap-thu-bay-27-10-2018-1-640x471-1.jpg', 10000, NULL, NULL),
	(2, 'nguyenthai', '123', '0929133880', 'nguyenthai4920138@gmail.com', 'active', '/resources/images/tu-vi-12-con-giap-thu-bay-27-10-2018-1-640x471-1.jpg', NULL, NULL, NULL),
	(3, 'hihi', '123', '0000', 'nguyenthai1701@gmail.com', 'active', '/resources/images/anh-dai-dien-cute-cho-zalo_104205429.jpg', NULL, NULL, NULL),
	(8, 'aspen', '123', '0929133803', 'huunghia.thnvtv@gmail.com', 'active', '/resources/images/tu-vi-12-con-giap-thu-bay-27-10-2018-1-640x471-1.jpg', NULL, NULL, NULL),
	(147, 'binzz', '$2a$12$CFo.twqke9uTdceYy2Vw0OKBMG95ykuYhQ7q7NEZYOF7G2GXLb0Pq', '092933', 'nguyenthai492017@gmail.com', 'active', '/resources/images/anh-dai-dien-cute-cho-zalo_104205429.jpg', 10000, NULL, NULL),
	(149, 'thaicc', '$2a$12$ONVtAblU3tsW2BcA4bXb6OfF6SuW6BY/2slEH8HUepWQ9IPYu4hU2', '092923360', 'nguyenthai492017@gmail.com', 'active', '/resources/images/tu-vi-12-con-giap-thu-bay-27-10-2018-1-640x471-1.jpg', NULL, '', NULL),
	(151, 'chicc', '$2a$12$nRatyk5NVVXWEXtaylxaAeKB4.IGKdJ.lH8Ee5NI4koriYHXZ2LjW', '0911', 'nguyenthai492017@gmail.com', 'active', '/resources/images/anh-dai-dien-cute-cho-zalo_104205429.jpg', NULL, NULL, NULL),
	(152, 'thongcc', '$2a$12$AsxDWonIC5k.yHjiICDfuOsL.NQZ8lE2xi7M3ZV.ljTq6Vpkb/rFW', '0929133', 'nguyenthai492017@gmail.com', 'active', '/resources/images/anh-dai-dien-cute-cho-zalo_104205429.jpg', NULL, NULL, NULL),
	(153, 'totoan1995', 'T@an1995', NULL, NULL, NULL, '/resources/images/tu-vi-12-con-giap-thu-bay-27-10-2018-1-640x471-1.jpg', NULL, NULL, NULL),
	(154, 'minhanh.nguyen6688', 'minhanh123', NULL, NULL, NULL, '/resources/images/tu-vi-12-con-giap-thu-bay-27-10-2018-1-640x471-1.jpg', NULL, NULL, NULL),
	(155, 'lenym30051997', 'lien123', '', '', 'inactive', '/resources/images/tu-vi-12-con-giap-thu-bay-27-10-2018-1-640x471-1.jpg', NULL, NULL, NULL),
	(156, 'huenhi.bui', 'nhi123', NULL, NULL, NULL, '/resources/images/tu-vi-12-con-giap-thu-bay-27-10-2018-1-640x471-1.jpg', NULL, NULL, NULL),
	(157, 'NguyenThai492017', 'thai123', NULL, NULL, NULL, '/resources/images/tu-vi-12-con-giap-thu-bay-27-10-2018-1-640x471-1.jpg', NULL, NULL, NULL),
	(158, 'huynhnhu.tran.98096', 'nhu123', NULL, NULL, NULL, '/resources/images/tu-vi-12-con-giap-thu-bay-27-10-2018-1-640x471-1.jpg', NULL, NULL, NULL),
	(159, 'kiki', '$2a$12$wQZpLWCbDvsApF.I6EeLTOIIFZk3gu7IcUsggYvoCkj/kFABuJIpG', NULL, NULL, NULL, '/resources/images/tu-vi-12-con-giap-thu-bay-27-10-2018-1-640x471-1.jpg', NULL, NULL, NULL),
	(160, 'chigogo', '$2a$12$wQZpLWCbDvsApF.I6EeLTOIIFZk3gu7IcUsggYvoCkj/kFABuJIpG', '0929133801', 'chigogo@gmail.com', 'active', '/resources/images/1079916.jpg', 400000, '', NULL),
	(161, 'thaigogo', '$2a$12$2YxYazv5slH5w2Mw7/3WqutvAcfatgLf5NfgEzHyjbk2RATnW96jy', '0929133803', 'nguyenthai4920118@gmail.com', 'active', NULL, NULL, NULL, NULL),
	(162, 'olala', '$2a$12$jqFw7H5wZZNcIojeDKN4/.a5ytzoyp88QyvS4GZKtImz9Mw2Ewx8S', '0929133803', 'nguyenth1ai492018@gmail.com', 'active', NULL, NULL, NULL, NULL),
	(163, 'ccc', '$2a$12$7oqAhb0we41bd1kLyevTmeghU82hlkoOLYKpLOny.Bhr0AMPjzybG', '01122525', 'nguyenthai492017@gmail.com', 'active', NULL, NULL, NULL, NULL),
	(164, 'toan123', '$2a$12$CNusbfHQ3YmHkNyyKEgDte1GfkLTBycf5m31DkmZ5sVQ9MnB80QkW', '0898987536', 'robocon87@gmail.com', 'active', NULL, NULL, NULL, NULL),
	(165, 'toan123456', '$2a$12$YMMa4RadKI.Y4TZyQiYhRuQsLfUAlJtucc/IQoPkHt0miCnQq2PPu', '0898987536', 'robocon87@gmail.com', 'active', NULL, NULL, NULL, NULL),
	(173, 'Nguyễn Thái', NULL, NULL, 'nguyenthai492017@gmail.com', 'active', NULL, 10000, '2714059182168622', ''),
	(174, 'thai1', '$2a$12$wPHfpYk4/NtUFQJWFWTcgepW.7aT66nYKBDrrZbNiJB7eYYGJSCk6', '0929133803', 'nguyenthai49201318@gmail.com', 'active', NULL, NULL, NULL, NULL),
	(196, 'nguyenthai492017', NULL, NULL, 'nguyenthai492017@gmail.com', 'active', NULL, 15064564, NULL, '111385582975344558720'),
	(197, 'huunghia.thnvtv', NULL, NULL, 'huunghia.thnvtv@gmail.com', 'active', NULL, NULL, NULL, '107197933769129700891'),
	(198, 'ctxd.297', NULL, NULL, 'ctxd.297@gmail.com', 'active', NULL, NULL, NULL, '115216304485862510263'),
	(201, 'test', '$2a$12$s7LEBmgD.NkAVJ7eJOkniuMVqKoaTLb7gp5U6xLuVxoHhSVeF3a2i', '0929133803', 'nguyenthai4920d18@gmail.com', 'active', NULL, NULL, NULL, NULL),
	(202, 'validate', '$2a$12$nRoXeF81FfxpxpmnSZk9COOJls.0JQ.t0De7BOP8aXL4uyJpWOsXe', '0929133803', 'nguyenthai492a018@gmail.com', 'active', NULL, NULL, NULL, NULL),
	(210, 'e1e1', '$2a$12$KfB3AUdiC52L.R.I/vS4ven1foPfGWoIR8SzT6wG2/otHQJuBPCb6', '0929133803', 'nguyenthai492018@gmail.com', 'active', NULL, NULL, NULL, NULL),
	(211, 'nguyenthai492018', NULL, NULL, 'nguyenthai492018@gmail.com', 'active', NULL, NULL, NULL, '113087991938205990309'),
	(212, 'testlaine', '$2a$12$kIEYBJQHC036anXjM0qUBOEv6KmL2mYcDdit0AKY1dZumXn1Gn.8e', '0929133803', 'nguyenthai492018@gmail.com', 'active', NULL, NULL, NULL, NULL),
	(213, 'ngthai123', '$2a$12$JdTLvDT/1AzXQEcbkeTW7OK3iVn3eQHi3kIPQAr6UfSPFT.NGwtTa', '0929133803', 'nguyenthai492018@gmail.com', 'active', NULL, NULL, NULL, NULL),
	(215, 'nguyenthai123123', '$2a$12$XpYaF0qR9RGv9B0M04AqiOXZNFo7ZfNO0G928CRlT8vvb4fy/mr66', '0929133803', 'nguyenthai492018@gmail.com', 'active', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
