-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema band_website
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema band_website
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `band_website` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `band_website` ;

-- -----------------------------------------------------
-- Table `band_website`.`albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `band_website`.`albums` (
  `albumsID` VARCHAR(12) NOT NULL,
  `album_name` VARCHAR(45) NOT NULL,
  `album_release_date` DATE NOT NULL,
  PRIMARY KEY (`albumsID`),
  UNIQUE INDEX `albumsID_UNIQUE` (`albumsID` ASC) VISIBLE,
  UNIQUE INDEX `album_name_UNIQUE` (`album_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `band_website`.`band_members`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `band_website`.`band_members` (
  `band_membersID` VARCHAR(12) NOT NULL,
  `band_members_last_name` VARCHAR(45) NOT NULL,
  `band_members_first_name` VARCHAR(45) NOT NULL,
  `band_members_address` VARCHAR(45) NOT NULL,
  `band_members_role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`band_membersID`),
  UNIQUE INDEX `idband_members_UNIQUE` (`band_membersID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `band_website`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `band_website`.`customers` (
  `customersID` VARCHAR(12) NOT NULL,
  `customers_last_name` VARCHAR(45) NOT NULL,
  `customers_first_name` VARCHAR(45) NOT NULL,
  `customers_email` VARCHAR(45) NOT NULL,
  `customers_phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `customers_address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customersID`),
  UNIQUE INDEX `customerID_UNIQUE` (`customersID` ASC) VISIBLE,
  UNIQUE INDEX `customers_email_UNIQUE` (`customers_email` ASC) VISIBLE,
  UNIQUE INDEX `customers_phone_number_UNIQUE` (`customers_phone_number` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `band_website`.`merchandise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `band_website`.`merchandise` (
  `merchID` VARCHAR(12) NOT NULL,
  `merch_name` VARCHAR(45) NOT NULL,
  `merch_type` VARCHAR(45) NULL DEFAULT NULL,
  `merch_stock` INT NOT NULL,
  PRIMARY KEY (`merchID`),
  UNIQUE INDEX `merchID_UNIQUE` (`merchID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `band_website`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `band_website`.`orders` (
  `ordersID` VARCHAR(12) NOT NULL,
  `customersID` VARCHAR(12) NOT NULL,
  `merchID` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`ordersID`),
  UNIQUE INDEX `ordersID_UNIQUE` (`ordersID` ASC) VISIBLE,
  INDEX `customersID_idx` (`customersID` ASC) VISIBLE,
  CONSTRAINT `customersID`
    FOREIGN KEY (`customersID`)
    REFERENCES `band_website`.`customers` (`customersID`),
  CONSTRAINT `merchID`
    FOREIGN KEY (`merchID`)
    REFERENCES `band_website`.`merchandise` (`merchID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `band_website`.`performances`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `band_website`.`performances` (
  `performanceID` VARCHAR(12) NOT NULL,
  `venue` VARCHAR(45) NOT NULL,
  `performances_date` DATE NOT NULL,
  `profit_performance` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`performanceID`),
  UNIQUE INDEX `performanceID_UNIQUE` (`performanceID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `band_website`.`songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `band_website`.`songs` (
  `songsID` VARCHAR(12) NOT NULL,
  `songs_name` VARCHAR(45) NOT NULL,
  `albumsID` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`songsID`),
  UNIQUE INDEX `songsID_UNIQUE` (`songsID` ASC) VISIBLE,
  UNIQUE INDEX `songs_name_UNIQUE` (`songs_name` ASC) VISIBLE,
  INDEX `fk_songs_albums` (`albumsID` ASC) VISIBLE,
  CONSTRAINT `fk_songs_albums`
    FOREIGN KEY (`albumsID`)
    REFERENCES `band_website`.`albums` (`albumsID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO band_members
VALUES  ('0001', 'Martin', 'Chris', '15303 Ventura Blvd. Suite 900', 'Piano'),
			  ('0002', 'Berryman', 'Guy', '88-90 Baker Street, London, W1U 6TQ', 'Bass'),
			   ('0003', 'Champion', 'Will', '610 S Queen St Martinsburg WV 25401', 'Drums'),
				('0004', 'Buckland', 'Jonny', 'Londons Belsize Park area', 'Guitar');

INSERT INTO customers
VALUES  ('102351', 'Valdez', 'Zane', 'augue.porttitor@google.ca', '(867) 857-0541', '296-9269 Odio Ave'), 
                 ('731707','Donaldson','Joseph','tempus.lorem.fringilla@protonmail.ca','1-382-741-2227','436-8950 Mi Road'),
                 ('538901','Contreras','Keaton','dolor.nonummy@aol.net','(885) 944-6269','Ap #628-5820 Enim. St'),
                 ('292872','Elliott','Kenneth','orci.ut.semper@protonmail.ca','(889) 622-1943','Ap #997-729 Mauris Av'),
                 ('260726','Barlow','Autumn','dignissim.pharetra@icloud.ca','1-906-416-1323','P.O. Box 978, 2965 Mauris Av');
        
INSERT INTO albums
VALUES  ('1001', 'Parachutes', '2000-07-10'),
                  ('1002', 'Viva la Vida or Death and All His Friends', '2008-06-12'),
                  ('1003', 'Love in Tokyo', '2018-12-07');

INSERT INTO merchandise
VALUES  ('12001','EVERYONE IS AN ALIEN SOMEWHERE TEE', 'Shirt', 568),
			  ('12002','MUSIC OF THE SPHERES PLANET HOODIE','Sweater', 233),
			  ('12003', 'MOON MUSIC BRACELETS', 'Bracelet', 780),
			   ('12004', 'MOON MUSIC HAT', 'Hat', 200),
			   ('12005', 'VOLTIK TEE', 'Shirt', 427);

INSERT INTO orders
VALUES  ('34215', '102351', '12001'),
			  ('03945', '731707', '12002'),
			  ('73950', '538901', '12003'),
			  ('48678', '292872', '12004'),
			   ('99003', '260726', '12005');

INSERT INTO performances
VALUES   ('6543', 'Wembley Stadium, United Kingdom', '2025-09-12', 124900),
			   ('3456','Rogers Stadium, Canada','2025-07-11', 80200),
			   ('8008','Sun Bowl Stadium, USA','2025-06-14', 205000),
				('3932','Goyang Stadium, South Korea','2025-04-16', 160000);

INSERT INTO songs 
VALUES     ('75614','Sparks','1001'),
				('51039','The Scientist','1003'),
				('86836','Yellow','1001'),
				('23949','Parachutes','1001'),
				('42181','Viva la Vida','1002'),
				('82212','Paradise','1003'),
				('27311','Yes','1002'),
                ('39543','Death and All His Friends','1002');
