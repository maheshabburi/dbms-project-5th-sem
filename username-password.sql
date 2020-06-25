CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  ;

insert into `users` values
	(1,"mahesh","amc@gmail.com","mahesh","mahi"),
	(2,"surya","skv@gmail.com","surya","suki"),
	(3,"gopi","gc@gmail.com","gopi","dgopi");