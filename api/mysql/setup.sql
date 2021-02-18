CREATE DATABASE IF NOT EXISTS food_app;
USE food_app;

CREATE TABLE IF NOT EXISTS Users (
  `id`        INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username`  VARCHAR(30) NOT NULL,
  `password`  VARCHAR(72) NOT NULL,
  `sign`      VARCHAR(256) NOT NULL,
  `created`   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS UserSessions (
  `id`         INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user`       INT UNSIGNED NOT NULL,
  `token`      VARCHAR(256) NOT NULL,
  `validUntil` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user`) REFERENCES Users (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE UserFood (
  `id`            INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user`          INT UNSIGNED NOT NULL,
  `name`          TINYTEXT NOT NULL,
  `quantity`      DECIMAL (16, 14) NOT NULL,
  `quantityType`  VARCHAR(15) NOT NULL,
  `expiryDate`    DATE NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user`) REFERENCES Users (`id`)
    ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Recipes (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title`       TINYTEXT NOT NULL,
  `time`        TINYTEXT NOT NULL,
  `ingredients` JSON NOT NULL,
  `image_url`   TINYTEXT NULL,
  `time`        INT NOT NULL,
  `url`         TINYTEXT NOT NULL,
  PRIMARY KEY(`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Favourites (
  `id`      INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user`    INT UNSIGNED NOT NULL,
  `recipe`  INT UNSIGNED NOT NULL,
  PRIMARY KEY(`id`),
  FOREIGN KEY (`user`) REFERENCES Users(`id`)
    ON DELETE CASCADE,
  FOREIGN KEY (`recipe`) REFERENCES Recipes(`id`)
    ON DELETE CASCADE
) ENGINE = InnoDB;