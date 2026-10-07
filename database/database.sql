CREATE DATABASE IF NOT EXISTS greaseguard CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE greaseguard;
DROP TABLE IF EXISTS cleaning_records;
DROP TABLE IF EXISTS grease_traps;
CREATE TABLE grease_traps(
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 trap_code VARCHAR(30) NOT NULL UNIQUE,
 location VARCHAR(120) NOT NULL,
 last_cleaned_date DATE NOT NULL,
 cleaning_interval INT UNSIGNED NOT NULL DEFAULT 30,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
CREATE TABLE cleaning_records(
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 grease_trap_id INT UNSIGNED NOT NULL,
 cleaning_date DATE NOT NULL,
 cleaned_by VARCHAR(120) NOT NULL,
 remarks VARCHAR(255) NULL,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 CONSTRAINT fk_cleaning_trap FOREIGN KEY(grease_trap_id) REFERENCES grease_traps(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
INSERT INTO grease_traps(trap_code,location,last_cleaned_date,cleaning_interval) VALUES
('GT-001','Main Kitchen',DATE_SUB(CURDATE(),INTERVAL 47 DAY),30),
('GT-002','Bakery Kitchen',DATE_SUB(CURDATE(),INTERVAL 26 DAY),30),
('GT-003','Food Court Kitchen',DATE_SUB(CURDATE(),INTERVAL 11 DAY),30),
('GT-004','Hotel Kitchen',DATE_SUB(CURDATE(),INTERVAL 7 DAY),30),
('GT-005','Restaurant Kitchen',DATE_SUB(CURDATE(),INTERVAL 35 DAY),30);
INSERT INTO cleaning_records(grease_trap_id,cleaning_date,cleaned_by,remarks) VALUES
(1,DATE_SUB(CURDATE(),INTERVAL 47 DAY),'GreenLeaf Maintenance Team','Routine grease trap cleaning'),
(2,DATE_SUB(CURDATE(),INTERVAL 26 DAY),'GreenLeaf Maintenance Team','Routine grease trap cleaning'),
(3,DATE_SUB(CURDATE(),INTERVAL 11 DAY),'GreenLeaf Maintenance Team','Routine grease trap cleaning'),
(4,DATE_SUB(CURDATE(),INTERVAL 7 DAY),'GreenLeaf Maintenance Team','Routine grease trap cleaning'),
(5,DATE_SUB(CURDATE(),INTERVAL 35 DAY),'GreenLeaf Maintenance Team','Routine grease trap cleaning');
