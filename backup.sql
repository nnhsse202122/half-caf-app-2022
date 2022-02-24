LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (1,1,'admin','pbkdf2:sha256:150000$amotRAQe$f90a9568ac168a8724c1db38e35c4af184062032e908823ba43f934b96183692','Admin',DEFAULT,'nnhshalfcafapp+1@gmail.com'),(2,1,'teacher','pbkdf2:sha256:150000$dEOnrXy7$2c4ab8e07c38cdc36452769354b8cf6c131f7397121f4ad0a0566f46a8ef3d2b','Teacher',DEFAULT,'nnhshalfcafapp+2@gmail.com'),(3,1,'barista','pbkdf2:sha256:150000$eNcME3qp$a9d0276a3a179ec59c55bd06913479ad2a7a677d88a4fa730b23e9faea0e9544','Barista',DEFAULT,'nnhshalfcafapp+3@gmail.com');
UNLOCK TABLES;

LOCK TABLES `order` WRITE;
INSERT INTO `order` VALUES (1,1,DEFAULT,DEFAULT,0),(2,2,DEFAULT,DEFAULT,0),(3,3,DEFAULT,DEFAULT,0);
UNLOCK TABLES;

LOCK TABLES `user` WRITE;
UPDATE `user` SET `current_order_id`=1 WHERE `id`=1;
UPDATE `user` SET `current_order_id`=2 WHERE `id`=2;
UPDATE `user` SET `current_order_id`=3 WHERE `id`=3;
UNLOCK TABLES;


LOCK TABLES `temp` WRITE;
INSERT INTO `temp` VALUES (1,'Hot'),(2,'Cold');
UNLOCK TABLES;


LOCK TABLES `flavor` WRITE;
INSERT INTO `flavor` VALUES (10,'Blue Raspberry'),(2,'Caramel'),(1,'None'),(11,'Cherry'),(5,'Chocolate'),(3,'Cinnamon bun'),(4,'Cocconut'),(12,'Cranberry'),(6,'French Vanilla'),(13,'Fruit Punch'),(7,'Hazelnut'),(8,'Peppermint'),(14,'Raspberry'),(15,'Raspberry Kiwi'),(16,'Strawberry'),(9,'Vanilla'),(17,'Watermelon');
UNLOCK TABLES;


LOCK TABLES `menuItem` WRITE;
INSERT INTO `menuItem` VALUES (1,'Black Coffee','Hot or iced, available in decaf',2,0),(2,'Cafe Mocha','Half coffee, half hot chocolate, all good',3,0),(3,'The Huskalatte','A velvety smooth, flavored drink',3,0),(4,'Spiced Apple Cider','A drink to warm your heart',2,0),(5,'The Huskaccino','Cool, icy, coffee slushy-what more could you want?',3,0),(6,'Hot Chocolate','Add a flavor and make it yours!',2,0),(7,'Chai Latte','A spicy, smooth, and soothing drink',3,0),(9,'Iced Tea','Sweet lemon tea served over ice',2,0),(10,'Huskie Palmer','A sweet blend of lemonade and iced tea over ice',2,0),(11,'Lemonade','Sweet and summery',2,0),(12,'Frozen Strawberry Lemonade','Frozen Lemonade with a twist',3,1),(13,'Polar Palmer','Frozen Huskie Palmer, with a sweet twist',3,0),(14,'Strawberry smoothie','',3,0),(15,'Wild berry Smoothie','',3,0),(16,'Mango Smoothie','',3,0),(17,'Chai Tea','A spicy, smooth, and soothing drink',3,0),(18,'Chamomile','A wonderful tea to calm down after a long day',2,0),(19,'Earl Grey Tea','The Mr. Schmit special',2,1),(20,'Green Tea','A nice cup of tasty tea',2,0),(21,'Black Tea','',2,0),(22,'Wild Berry Tea',' A fruity, warm delight',2,0),(23,'Peppermint Tea','Often called pepperminTEA',2,0),(24,'Orange Tea','',2,0),(25,'Raspberry Tea','A raspberry leaf tea',2,0);
UNLOCK TABLES;

LOCK TABLES `roomnum` WRITE;
INSERT INTO `roomnum` VALUES (1, '100'), (2, '101'), (3, '102'), (4, '103'), (5, '104'), (6, '105'), (7, '106'), (8, '107'), (9, '108'), (10, '109'), (11, '110'), (12, '111'), (13, '112'), (14, '113'), (15, '114'), (16, '115'), (17, '116'), (18, '117'),(19, '118'), (20, '119'),(21,'120'), (22,'121'), (23,'122'), (24,'123'), (25,'124'), (26,'125'),  (27,'126'), (28,'127'), (29,'128'), (30,'129'), (31,'130'), (32,'131'), (33,'132'), (34,'133'), (35,'134'), (36,'135'), (37,'136'), (38,'137'), (39,'138'), (40,'139'), (41,'140'), (42,'141'), (43,'142'), (44,'143'), (45,'144'), (46,'145'), (47,'146'), (48,'147'), (49,'148'), (50,'149'), (51,'150'), (52,'151'), (53,'152'), (54,'153'), (55,'154'), (56,'155'), (57,'156'), (58,'157'), (59,'158'), (60,'159'), (61,'160'), (62,'161'), (63,'162'), (64,'163'), (65,'164'), (66,'165'), (67,'166'), (68,'167'), (69,'168'), (70,'169'), (71,'170'), (72,'171'), (73,'172'), (74,'173'), (75,'174'), (76,'175'), (77,'176'), (78,'177'), (79,'178'), (80,'179'), (81,'180'), (82,'181'), (83,'182'), (84,'183'), (85,'184'), (86,'185'), (87,'186'), (88,'187'), (89,'188'), (90,'189'), (91,'190'), (92,'191'), (93,'192'), (94,'193'), (95,'194'), (96,'195'), (97,'196'), (98,'197'), (99,'198'), (100,'199');
UNLOCK TABLES; 

LOCK TABLES `drinksToFlavor` WRITE;
INSERT INTO `drinksToFlavor` VALUES (26,'Cafe Mocha',2,'None',1),(27,'Cafe Mocha',2,'Caramel',2),(28,'Cafe Mocha',2,'Cinnamon bun',3),(29,'Cafe Mocha',2,'Chocolate',5),(30,'Cafe Mocha',2,'French Vanilla',6),(31,'Cafe Mocha',2,'Hazelnut',7),(32,'Cafe Mocha',2,'Peppermint',8),(33,'Cafe Mocha',2,'Vanilla',9),(34,'The Huskalatte',3,'None',1),(35,'The Huskalatte',3,'Caramel',2),(36,'The Huskalatte',3,'Cinnamon bun',3),(37,'The Huskalatte',3,'Chocolate',5),(38,'The Huskalatte',3,'French Vanilla',6),(39,'The Huskalatte',3,'Hazelnut',7),(40,'The Huskalatte',3,'Peppermint',8),(41,'The Huskalatte',3,'Vanilla',9),(42,'Spiced Apple Cider',4,'None',1),(49,'The Huskaccino',5,'None',1),(50,'The Huskaccino',5,'Caramel',2),(51,'The Huskaccino',5,'Cinnamon bun',3),(52,'The Huskaccino',5,'Chocolate',5),(53,'The Huskaccino',5,'French Vanilla',6),(54,'The Huskaccino',5,'Hazelnut',7),(55,'The Huskaccino',5,'Vanilla',9),(56,'Hot Chocolate',6,'None',1),(57,'Hot Chocolate',6,'Caramel',2),(58,'Hot Chocolate',6,'Cinnamon bun',3),(59,'Hot Chocolate',6,'French Vanilla',6),(60,'Hot Chocolate',6,'Hazelnut',7),(61,'Hot Chocolate',6,'Peppermint',8),(62,'Hot Chocolate',6,'Vanilla',9),(63,'Chai Latte',7,'None',1),(64,'Iced Tea',9,'None',1),(65,'Huskie Palmer',10,'None',1),(67,'Lemonade',11,'None',1),(68,'Polar Palmer',13,'None',1),(69,'Strawberry smoothie',14,'None',1),(70,'Wild berry Smoothie',15,'None',1),(71,'Mango Smoothie',16,'None',1),(72,'Chai Tea',17,'None',1),(73,'Chamomile',18,'None',1),(74,'Earl Grey Tea',19,'None',1),(75,'Green Tea',20,'None',1),(77,'Black Tea',21,'None',1),(78,'Wild Berry Tea',22,'None',1),(79,'Peppermint Tea',23,'None',1),(80,'Orange Tea',24,'None',1),(81,'Raspberry Tea',25,'None',1),(82,'Black Coffee',1,'None',1),(83,'Black Coffee',1,'Caramel',2),(84,'Black Coffee',1,'Chocolate',5),(85,'Black Coffee',1,'French Vanilla',6),(86,'Black Coffee',1,'Hazelnut',7),(87,'Black Coffee',1,'Peppermint',8),(88,'Black Coffee',1,'Vanilla',9);
UNLOCK TABLES;
