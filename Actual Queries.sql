
CREATE TABLE  `tournament`(
`tournament_id` INT(10) NOT NULL AUTO_INCREMENT ,
`tournament_name` VARCHAR(30) NOT NULL,
`tournament_location` VARCHAR(30) NOT NULL,
`tournament_startdate` DATE,
`tournament_enddate` DATE,
PRIMARY KEY (`tournament_id`)
);

INSERT INTO tournament 
  (tournament_name, tournament_location, tournament_startdate, tournament_enddate) 
  VALUES ('T20 World Cup','England', '2013-10-05','2013-10-20'),  
        ('ICC Champions Trophy', 'Australia','2015-06-01','2015-06-15'),   
        ('Indian Premier League','India', '2016-04-05','2016-04-20');


CREATE TABLE `coach`(
`coach_id` INT(10) NOT NULL AUTO_INCREMENT,
`coach_name` VARCHAR(250) NOT NULL,
`coach_country` VARCHAR(250) NOT NULL,

 PRIMARY KEY (`coach_id`)
);


INSERT INTO coach
(coach_name,coach_country)
VALUES
   ('Ravi Shastri','India'),
   ('Darren Lehmann','Australia'),
   ('Mickey Arthur','SouthAfrica'),
   ('Trevor Bayliss','Australia'),
   ('Stephen Fleming','New Zealand'),
   ('Daniel Vettori','New Zealand'),
   ('Mahela Jayawardene','SriLanka'),
   ('Jacques Kallis','SouthAfrica');



CREATE TABLE `venue`(
`venue_id` INT(10) NOT NULL AUTO_INCREMENT,
`venue_capacity` INT(250) NOT NULL,
`venue_name` VARCHAR(250) NOT NULL,
 `venue_country` VARCHAR(250) NOT NULL,
  `venue_city` VARCHAR(250) NOT NULL,
 PRIMARY KEY (`venue_id`)
);


INSERT INTO venue
(venue_capacity, venue_name, venue_country, venue_city)
values
('55000', 'Feroz Shah Kotla Ground', 'India', 'Delhi'),
('28000', 'Saurashtra Cricket Association Stadium', 'India', 'Rajkot'),
('25000', 'K. D. Singh Babu Stadium', 'India', 'Lucknow'),
('18000', 'Roop Singh Stadium', 'India', 'Gwalior'),
('38000', 'MA Chidambaram Stadium', 'India', 'Chennai'),
('24500', 'WACA Ground', 'Australia', 'Perth'),
('20000', 'Bellerive Oval', 'Australia', 'Bellerive'),
('100024','Melbourne Cricket Ground', 'Australia', 'Melbourne'),
('48000', 'Sydney Cricket Ground', 'Australia', 'Sydney'),
('25000', 'The Oval', 'England' ,'London'),
('25000', 'Rose Bowl', 'England', 'Southampton'),
('22000', 'Old Trafford', 'England', 'Manchester'),
('67000', 'Gaddafi Stadium', 'Pakistan', 'Lahore'),
('34228', 'Karachi National Stadium', 'Pakistan', 'Karachi');




CREATE TABLE `umpire`(
`umpire_id` INT(10) NOT NULL AUTO_INCREMENT,
`umpire_name` VARCHAR(250) NOT NULL,
`umpire_country` VARCHAR(250) NOT NULL,
`matches_controlled`  INT(10) NOT NULL,
 PRIMARY KEY (`umpire_id`)
);

INSERT INTO umpire
(umpire_name,umpire_country,matches_controlled)
VALUES
('John Hampshire','England','20'),
('Jack Collins','Australia','25'),
('Simon Taufel','Australia','174'),
('Suresh Shastri','India','19'),
('Chris Brown','New Zealand','16'),
('Shakoor Rana','Pakistan','28'),
('Shaun George','South Africa','24'),
('Gamini Silva','Sri Lanka','22'),
('David Archer','West Indies','20'),
('Simon Fry','Australia','124'),
('Shaun George','South Africa','187'),
('Joel Wilson','West Indies','87'),
('Devinder Sharma','India','34'),
('Wayne Knights','New Zealand','84'),
('Saleem Badar','Pakistan','29'),
('Masroor Ali','Pakistan','56'),
('Ian Howell','South Africa','66'),
('Paul Reiffel','Australia','32'),
('Charles Bannerman',' Australia','12'),
('Ram Babu Gupta','India','20'),
('Harry Butt','England','6'),
('George Cooper','Australia','2'),
('Nitin Menon','India','29'),
('Steve Davis','Australia','7'),
('Russell Tiffin','Zimbabwe','30'),
('Kumar Dharmasena','Sri Lanka','87'),
('Johan Cloete','South Africa','17');

CREATE TABLE `team`(
`team_id` INT(10) NOT NULL AUTO_INCREMENT,
`team_name` VARCHAR(250) NOT NULL,
`team_country` VARCHAR(250) NOT NULL,
`team_type` VARCHAR(250) NOT NULL,

`coach_id` INT(10)  NOT NULL,
CONSTRAINT FK_coachteam FOREIGN KEY (coach_id)
    REFERENCES coach(coach_id),
 PRIMARY KEY (`team_id`)
);

INSERT INTO team 
(team_name,team_country,team_type,coach_id)
VALUES
('India','India','International',1),
  ('Australia','Australia','International',2),
  ('England','England','International',3),
  ('Pakistan','Pakistan','International',4),
  ('Chennai Super Kings','India','Domestic',5),
  ('Royal Challengers Bangalore','India','Domestic',6),
  ('Mumbai Indians','India','Domestic',7),
  ('Kolkata Knight Riders','India','Domestic',8);



CREATE TABLE `matches`(
`match_id` INT(10) NOT NULL AUTO_INCREMENT,
`match_date` DATE,

`tournament_id` INT(10) NOT NULL,
CONSTRAINT FK_tournamentmatch FOREIGN KEY (tournament_id)
    REFERENCES tournament(tournament_id),
`venue_id` INT(10) NOT NULL,
CONSTRAINT FK_venuematch FOREIGN KEY (venue_id)
    REFERENCES venue(venue_id),
`umpire_id` INT(10) NOT NULL,
CONSTRAINT FK_umpirematch FOREIGN KEY (umpire_id)
    REFERENCES umpire(umpire_id),
`team1_id` INT(10) NOT NULL,
CONSTRAINT FK_team1match FOREIGN KEY (team1_id)
    REFERENCES team(team_id),
`team2_id` INT(10) NOT NULL,
CONSTRAINT FK_team2match FOREIGN KEY (team2_id)
    REFERENCES team(team_id),
 PRIMARY KEY (`match_id`)

);


INSERT INTO matches
(match_date,tournament_id,venue_id,umpire_id,team1_id,team2_id)
VALUES
('2013-10-05',1,10,7,1,4),
('2013-10-11',1,12,18,2,3),
('2013-10-20',1,11,5,1,2),
 
('2015-06-01',2,6,13,1,2),
('2015-06-10',2,7,10,3,4),
('2015-06-15',2,8,16,2,3),
 
('2016-04-05',3,3,1,5,7),
('2016-04-10',3,4,24,6,8),
('2016-04-20',3,5,8,5,6);





CREATE table `players`(
`players_id` INT(10) NOT null auto_increment,
`players_name` VARCHAR(40) NOT NULL,
`players_age` INT(10) NOT NULL,
`players_type` VARCHAR(50) NOT NULL,

PRIMARY KEY (`players_id`)
);



INSERT INTO players
(players_name, players_age, players_type)
values
('Mahendra Singh Dhoni','31','Domestic, International'), 
('Shikhar Dhawan','37','International'), 
('Bhuvneshwar Kumar','23','International'), 
('Rohit Sharma','26','Domestic, International'), 
('Virat Kohli','24','Domestic, International'), 
('Ravindra Jadeja','24','Domestic, International'), 
('Ravichandran Ashwin','27','Domestic, International'), 
('Umesh Yadav','25','International'), 
('Yuvraj Singh','35','Domestic, International'), 
('Hardik Pandya','23','International'), 
('Jasprit Bumrah','24','Domestic, International'), 
('James Pattinson','26','International'), 
('Marcus Stoinis','27','International'), 
('Steven Smith','37','International'), 
('Adam Zampa','25','International'), 
('David Warner','30','International'), 
('Aaron Finch','27','International'), 
('Josh Hazlewood','26','Domestic, International'), 
('Glenn Maxwell','28','International'), 
('Mitchell Starc','27','Domestic, International'), 
('Moises Henriques','30','International'), 
('Matthew Wade','29','International'), 
('Eoin Morgan','30','International'), 
('Jonny Bairstow','27','International'), 
('Moeen Ali','29','International'), 
('Jos Buttler','26','Domestic, International'), 
('Alex Hales','28','International'), 
('Joe Root','26','International'), 
('Ben Stokes','25','International'), 
('Liam Plunkett','32','International'), 
('Jake Ball','26','International'), 
('David Willey','27','International'), 
('Chris Woakes','28','International'), 
('Sarfraz Ahmed','29','International'), 
('Azhar Ali','32','International'), 
('Fakhar Zaman','27','International'), 
('Babar Azam','22','International'), 
('Imad Wasim','28','International'), 
('Junaid Khan','27','International'), 
('Mohammad Hafeez','36','International'), 
('Shadab Khan','18','International'), 
('Rumman Raees','25','International'), 
('Shoaib Malik','35','International'), 
('Umar Akmal','26','International'), 
('Dwayne Bravo','30','Domestic'), 
('David Hussey','36','Domestic'), 
('Suresh Raina','27','Domestic'), 
('Mohit Sharma','25','Domestic'), 
('Dwayne Smith','31','Domestic'), 
('Brendon McCullum','32','Domestic'), 
('Ashish Nehra','35','Domestic'), 
('Faf du Plessis','29','Domestic'), 
('AB de Villiers','30','Domestic'), 
('Chris Gayle','34','Domestic'), 
('Albie Morkel','32','Domestic'), 
('Ashok Dinda','30','Domestic'), 
('Varun Aaron','24','Domestic'), 
('Parthiv Patel','29','Domestic'), 
('Manoj Tiwary','27','Domestic'), 
('Harshal Patel','24','Domestic'), 
('Harbhajan Singh','33','Domestic'), 
('Michael Hussey','38','Domestic'), 
('Lasith Malinga','30','Domestic'), 
('Ambati Rayudu','28','Domestic'), 
('Zaheer Khan','35','Domestic' ), 
('Ben Dunk','27','Domestic'), 
('Martin Guptill','29','Domestic'), 
('Gautam Gambhir','34','Domestic'), 
('Brad Hogg','45','Domestic'), 
('Morne Morkel','31','Domestic'), 
('Manish Pandey','27','Domestic'), 
('Sunil Narine','27','Domestic'), 
('Yusuf Pathan','33','Domestic'), 
('Andre Russell','27','Domestic'), 
('Piyush Chawla','27','Domestic'), 
('Kuldeep Yadav','21','Domestic'), 
('Jason Holder','24','Domestic'), 
('Chris Lynn','25','Domestic'), 
('Sheldon Jackson','29','Domestic'); 


CREATE TABLE `teammapping`
(`teammapping_id` INT(10) NOT NULL AUTO_INCREMENT,
`players_id` INT(10) NOT NULL,
constraint FK_playersteammapping foreign key(players_id)
references players(players_id),
`teammapping_domestic` INT(10) DEFAULT NULL,
CONSTRAINT FK_teamteammapping FOREIGN KEY (teammapping_domestic)
references team(team_id),

`teammapping_international` INT(10) DEFAULT NULL,
CONSTRAINT FK_team1teammapping FOREIGN KEY(teammapping_international)
REFERENCES team(team_id),

PRIMARY KEY(`teammapping_id`)
);


INSERT INTO teammapping
(players_id, teammapping_domestic, teammapping_international)
values
(1,5,1),
(2,NULL,1),
(3,NULL,1),
(4,7,1),
(5,6,1),
(6,5,1),
(7,5,1),
(8,NULL,1),
(9,6,1),
(10, NULL,1),
(11,7,1),
(12,NULL,2),
(13,NULL,2),
(14,NULL,2),
(15,NULL,2),
(16,NULL,2),
(17,NULL,2),
(18,7,2),
(19,NULL,2),
(20,6,2),
(21,NULL,2),
(22,NULL,2),
(23,NULL,3),
(24,NULL,3),
(25,NULL,3),
(26,7,3),
(27,NULL,3),
(28,NULL,3),
(29,NULL,3),
(30,NULL,3),
(31,NULL,3),
(32,NULL,3),
(33,NULL,3),
(34,NULL,4),
(35,NULL,4),
(36,NULL,4),
(37,NULL,4),
(38,NULL,4),
(39,NULL,4),
(40,NULL,4),
(41,NULL,4),
(42,NULL,4),
(43,NULL,4),
(44,NULL,4),
(45,5,NULL),
(46,5,NULL),
(47,5,NULL),
(48,5,NULL),
(49,5,NULL),
(50,5,NULL),
(51,5,NULL),
(52,5,NULL),
(53,6,NULL),
(54,6,NULL),
(55,6,NULL),
(56,6,NULL),
(57,6,NULL),
(58,6,NULL),
(59,6,NULL),
(60,6,NULL),
(61,7,NULL),
(62,7,NULL),
(63,7,NULL),
(64,7,NULL),
(65,7,NULL),
(66,7,NULL),
(67,7,NULL),
(68,8,NULL),
(69,8,NULL),
(70,8,NULL),
(71,8,NULL),
(72,8,NULL),
(73,8,NULL),
(74,8,NULL),
(75,8,NULL),
(76,8,NULL),
(77,8,NULL),
(78,8,NULL),
(79,8,NULL);


CREATE TABLE `scorecard`(
`scorecard_id` INT(10) NOT NULL AUTO_INCREMENT,
`match_id`  INT(10) NOT NULL,
CONSTRAINT FK_scorematch FOREIGN KEY (match_id)
    REFERENCES matches(match_id),
`team_id`  INT(10) NOT NULL,
CONSTRAINT FK_scorecardteam FOREIGN KEY (team_id)
    REFERENCES team(team_id),
`players_id`  INT(10) NOT NULL,
CONSTRAINT FK_scoreplayers FOREIGN KEY (players_id)
    REFERENCES players(players_id),
`scorecard_runsscored` INT(10) DEFAULT NULL,
`scorecard_noofballsfaced` INT(10) DEFAULT NULL,
`scorecard_isout` TINYINT(1) DEFAULT NULL,
`scorecard_batsmanorder` INT(10) NOT NULL,
PRIMARY KEY (`scorecard_id`)
);


INSERT INTO scorecard
(match_id,team_id,players_id,scorecard_runsscored,scorecard_noofballsfaced,scorecard_isout,scorecard_batsmanorder)

values
-- Match1
(1, 1 , 2 ,'50','65','0','1'),
(1, 1 , 4 ,'10','12','0','2'),
(1, 1 , 5 ,'88','30','1','3'),
(1, 1 , 1 ,'5','13','1','4'),
-- 2nd Innings
(1, 4 , 34 ,'20','10','0','1'),
(1, 4 , 35 ,'10','12','0','2'),
(1, 4 , 36 ,'20','30','0','3'),
(1, 4 , 37 ,'5','13','0','4'),
(1, 4 , 38 ,'11','20','0','5'),
(1, 4 , 39 ,'40','16','0','6'),
(1, 4 , 40 ,'32','11','1','7'),
(1, 4 , 41 ,'11','8','1','8'),

-- Match2
(2, 2 , 12 ,'90','55','1','1'),
(2, 2 , 13 ,'30','12','0','2'),
(2, 2 , 14 ,'70','40','0','3'),
(2, 2 , 15 ,'25','13','1','4'),

-- 2nd Innings

(2, 3 , 23 ,'105','50','1','1'),
(2, 3 , 24 ,'70','40','0','2'),
(2, 3 , 25 ,'30','30','1','3'),


-- Match3

-- Aus 1st Innings
(3, 2 , 12 ,'50','50','0','1'),
(3, 2 , 13 ,'30','22','0','2'),
(3, 2 , 14 ,'60','35','1','3'),
(3, 2 , 15 ,'25','13','1','4'),

-- Ind 2nd Innings
(3, 1 , 1 ,'2','3','0','1'),
(3, 1 , 2 ,'4','3','0','2'),
(3, 1 , 3 ,'22','3','0','3'),
(3, 1 , 4 ,'30','3','0','4'),
(3, 1 , 5 ,'10','3','0','5'),
(3, 1 , 6 ,'20','3','1','6'),
(3, 1 , 7 ,'22','3','1','7'),



-- Match4

-- Aus 1st Innings
(4, 2 , 12 ,'110','100','0','1'),
(4, 2 , 13 ,'30','22','0','2'),
(4, 2 , 14 ,'30','35','0','3'),
(4, 2 , 15 ,'20','10','0','4'),
(4, 2 , 16 ,'50','40','0','5'),
(4, 2 , 17 ,'60','50','1','6'),
(4, 2 , 18 ,'21','30','0','7'),
(4, 2 , 19 ,'10','13','1','8'),


-- Ind 2nd Innings

(4, 1 , 1 ,'181','120','1','1'),
(4, 1 , 2 ,'100','80','0','2'),
(4, 1 , 3 ,'30','100','1','3'),


-- Match5

-- Pak 1st Innings

(5, 4 , 34 ,'50','60','0','1'),
(5, 4 , 35 ,'20','50','0','2'),
(5, 4 , 36 ,'10','15','0','3'),
(5, 4 , 37 ,'22','33','0','4'),
(5, 4 , 38 ,'33','44','0','5'),
(5, 4 , 39 ,'12','30','0','6'),
(5, 4 , 40 ,'7','10','0','7'),
(5, 4 , 41 ,'8','10','0','8'),
(5, 4 , 42 ,'45','26','0','9'),
(5, 4 , 43 ,'11','10','0','10'),
(5, 4 , 44 ,'0','4','1','11'),

-- Eng 2nd Innings


(5, 3 , 23 ,'50','80','0','1'),
(5, 3 , 24 ,'60','65','0','2'),
(5, 3 , 25 ,'55','72','0','3'),
(5, 3 , 26 ,'25','20','1','4'),
(5, 3 , 27 ,'20','30','1','5'),

-- Match6

-- Eng 1st Innings
(6, 3 , 23 ,'100','80','0','1'),
(6, 3 , 24 ,'50','65','0','2'),
(6, 3 , 25 ,'50','72','0','3'),
(6, 3 , 26 ,'50','20','1','4'),
(6, 3 , 27 ,'50','63','1','5'),

-- Aus 2nd Innings

(6, 2 , 12 ,'110','100','0','1'),
(6, 2 , 13 ,'30','50','0','2'),
(6, 2 , 14 ,'30','55','0','3'),
(6, 2 , 15 ,'20','45','1','4'),  
(6, 2 , 16 ,'50','50','1','5'), 


-- IPL tournament

-- Match7

-- CSK 1st Innings

(7, 5 , 1 ,'60','50','0','1'), 
(7, 5 , 7 ,'20','30','0','2'), 
(7, 5 , 6 ,'50','22','1','3'), 
(7, 5 , 45 ,'30','18','1','4'), 


-- MI 2nd Innings

(7, 7 , 4 ,'10','5','0','1'), 
(7, 7 , 61 ,'3','10','0','2'), 
(7, 7 , 62,'5','4','0','3'), 
(7, 7 , 63,'11','30','0','4'), 
(7, 7 , 64,'27','24','0','5'), 
(7, 7 , 65,'23','20','0','6'), 
(7, 7 , 11,'22','12','0','7'), 
(7, 7 , 66,'8','2','0','8'), 
(7, 7 , 18,'0','4','0','9'), 
(7, 7 , 26,'8','4','1','10'), 
(7, 7 , 67,'21','5','0','11'), 

-- Match8

-- KKR 1st Innings

(8, 8 , 68 ,'70','50','1','1'), 
(8, 8 , 69 ,'30','30','0','2'), 
(8, 8 , 70 ,'60','40','1','3'), 


-- RCB 2nd Innings

(8, 6 , 5 ,'100','70','1','1'), 
(8, 6 , 53 ,'62','45','1','2'), 

-- Match9

-- CSK 1st Innings

(9, 5 , 1 ,'3','4','0','1'), 
(9, 5 , 7 ,'100','80','1','2'), 
(9, 5 , 6 ,'80','36','1','3'), 


-- RCB 2nd Innings


(9, 6 , 5 ,'5','10','0','1'), 
(9, 6 , 53 ,'6','10','0','2'), 
(9, 6 , 54 ,'10','16','0','3'), 
(9, 6 , 55 ,'15','20','0','4'), 
(9, 6 , 20,'24','10','0','5'), 
(9, 6 , 9 ,'40','15','0','6'), 
(9, 6 , 56 ,'4','5','0','7'), 
(9, 6 , 57 ,'5','10','0','8'), 
(9, 6 , 58 ,'3','5','0','9'), 
(9, 6 , 59 ,'23','10','1','10'), 
(9, 6 , 60 ,'10','9','1','11');



CREATE TABLE `wicket`(
`wicket_id` INT(10) NOT NULL AUTO_INCREMENT,
`match_id`  INT(10) NOT NULL,
CONSTRAINT FK_wicketmatch FOREIGN KEY (match_id)
    REFERENCES matches(match_id),
`players_id`  INT(10) NOT NULL,
CONSTRAINT FK_wicketplayers FOREIGN KEY (players_id)
    REFERENCES players(players_id),
`team_id`  INT(10) NOT NULL,
CONSTRAINT FK_wicketteam FOREIGN KEY (team_id)
    REFERENCES team(team_id),
`wicket_overbowled` INT(10) DEFAULT NULL,
`wicket_taken` INT(10) DEFAULT NULL,
PRIMARY KEY (`wicket_id`)
);



INSERT INTO wicket
(match_id, players_id, team_id, wicket_overbowled, wicket_taken)
values
-- Match1
(1, 40, 4, '4', '0'),
(1, 41, 4, '4', '0'),
(1, 42, 4, '4', '1'),
(1, 43, 4, '4', '1'),
(1, 44, 4, '4', '0'),

(1, 7, 1, '4', '2'),
(1, 8, 1, '4', '2'),
(1, 9, 1, '4', '2'),
(1, 10, 1, '4', '0'),
(1, 11, 1, '4', '0'),

-- Match2
(2, 29, 3, '4', '0'),
(2, 30, 3, '4', '0'),
(2, 31, 3, '4', '1'),
(2, 32, 3, '4', '1'),
(2, 33, 3, '4', '0'),

(2, 18, 2, '4', '0'),
(2, 19, 2, '4', '0'),
(2, 20, 2, '4', '1'),
(2, 21, 2, '4', '0'),
(2, 22, 2, '4', '0'),

-- Match3

-- Ind Bowling
(3, 7, 1, '4', '1'),
(3, 8, 1, '4', '1'),
(3, 9, 1, '4', '0'),
(3, 10, 1, '4', '0'),
(3, 11, 1, '4', '0'),
-- Aus Bowling
(3, 18, 2, '4', '3'),
(3, 19, 2, '4', '0'),
(3, 20, 2, '4', '1'),
(3, 21, 2, '4', '0'),
(3, 22, 2, '4', '0'),


-- Match4
-- Ind Bowling
(4, 7, 1, '10', '1'),
(4, 8, 1, '10', '1'),
(4, 9, 1, '10', '0'),
(4, 10, 1, '10', '0'),
(4, 11, 1, '10', '4'),
-- Aus Bowling

(4, 18, 2, '10', '0'),
(4, 19, 2, '10', '0'),
(4, 20, 2, '10', '0'),   
(4, 21, 2, '10', '0'),
(4, 22, 2, '10', '0'),


-- Match5
-- Eng Bowling
(5, 26, 3, '10', '1'),
(5, 27, 3, '6', '1'),
(5, 28, 3, '6', '1'),
(5, 29, 3, '5', '2'),
(5, 30, 3, '8', '3'),
(5, 31, 3, '5', '0'),
(5, 32, 3, '4', '0'),
(5, 33, 3, '4.4', '2'),


-- Pak Bowling
(5, 39, 4, '10', '2'),
(5, 40, 4, '5', '1'),
(5, 41, 4, '7', '0'),
(5, 42, 4, '8', '0'),
(5, 43, 4, '4.3','0'),
(5, 44, 4, '10', '0'),

-- Match6
-- Aus Bowling

(6, 17, 2, '10', '0'),
(6, 18, 2, '10', '0'),
(6, 19, 2, '5', '0'),
(6, 20, 2, '5', '2'),
(6, 21, 2, '10', '0'),
(6, 22, 2, '10', '0'),


-- Eng Bowling
(6, 26, 3, '10', '1'),
(6, 27, 3, '6', '1'),
(6, 28, 3, '6', '1'),
(6, 29, 3, '5', '0'),
(6, 30, 3, '8', '0'),
(6, 31, 3, '5', '0'),
(6, 32, 3, '4', '0'),
(6, 33, 3, '6', '0'),


-- IPL tournament

-- Match7

-- MI Bowling

(7, 11, 7, '4', '1'),
(7, 66, 7, '4', '1'),
(7, 18, 7, '4', '0'),
(7, 26, 7, '4', '0'),
(7, 67, 7, '4', '0'),


-- CSK Bowling
(7, 47, 5, '4', '2'),
(7, 48, 5, '4', '2'),
(7, 49, 5, '4', '1'),
(7, 50, 5, '2', '3'),
(7, 51, 5, '2', '2'),
(7, 52, 5, '4', '0'),


-- Match8

-- RCB Bowling

(8, 56, 6, '4', '1'),
(8, 57, 6, '4', '0'),
(8, 58, 6, '4', '0'),
(8, 59, 6, '4', '0'),
(8, 60, 6, '4', '0'),


-- KKR Bowling

(8, 75, 8, '4', '0'),
(8, 76, 8, '4', '0'),
(8, 77, 8, '4', '0'),
(8, 78, 8, '4', '0'),
(8, 79, 8, '3.1', '0'),


-- Match9

-- RCB Bowling

(9, 56, 6, '4', '0'),
(9, 57, 6, '4', '0'),
(9, 58, 6, '4', '0'),
(9, 59, 6, '4', '1'),
(9, 60, 6, '4', '0'),


-- CSK Bowling

(9, 7, 5, '2', '3'),
(9, 6, 5, '2', '1'),
(9, 45, 5, '4', '2'),
(9, 46, 5, '2', '1'),
(9, 47, 5, '1', '1'),
(9, 48, 5, '2', '1'),
(9, 49, 5, '3', '0'),
(9, 50, 5, '4', '0');


CREATE TABLE `matchsummary`(

`match_id`  INT(10) NOT NULL,
CONSTRAINT FK_matchsummarymatch FOREIGN KEY (match_id)
    REFERENCES matches(match_id),
`matchsummary_battingfirst` INT(10) NOT NULL,
CONSTRAINT FK_matchsummaryteam FOREIGN KEY (matchsummary_battingfirst)
    REFERENCES team(team_id),
`matchsummary_firstInnings` INT(10) NOT NULL,
`matchsummary_secondInnings` INT(10) NOT NULL,
`matchsummary_winningteam` INT(10) NOT NULL,
CONSTRAINT FK_matchsummarywinningteam FOREIGN KEY (matchsummary_winningteam)
    REFERENCES team(team_id),
`matchsummary_playerofthematch` INT(10),
 CONSTRAINT FK_matchsummaryplayers FOREIGN KEY (matchsummary_playerofthematch)
    REFERENCES players(players_id)
);


INSERT INTO matchsummary
(match_id, matchsummary_battingfirst, matchsummary_firstInnings, matchsummary_secondInnings, 
  matchsummary_winningteam, matchsummary_playerofthematch)

values

(1,1,'160','150',1,2),
(2,2,'215','205',2,12),
(3,2,'160','110',2,18),
(4,2,'331','320',2,1),
(5,4,'220','221',3,30),
(6,3,'305','250',3,23),
(7,5,'160','150',5,50),
(8,8,'170','174',6,5),
(9,5,'183','145',5,7);