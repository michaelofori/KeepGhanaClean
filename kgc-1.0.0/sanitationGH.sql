
CREATE DATABASE sanitationGH;
USE sanitationGH; 

CREATE TABLE users (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(30) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE sanitation_data (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  userName VARCHAR(50) NOT NULL,
  distance_covered FLOAT NOT NULL,
  trash_disposed INT(6) NOT NULL,
  date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_username ON sanitation_data (username);

-- Insert users
INSERT INTO users (username, email, password) VALUES
  ('johndoe', 'johndoe@example.com', 'password123'),
  ('janedoe', 'janedoe@example.com', 'password456'),
  ('bobsmith', 'bobsmith@example.com', 'password789'),
  ('aliceli', 'aliceli@example.com', 'passwordabc');

-- Insert sanitation data
INSERT INTO sanitation_data (username, distance_covered, trash_disposed) VALUES
  ('johndoe', 10.5, 100),
  ('johndoe', 8.2, 75),
  ('janedoe', 12.6, 150),
  ('bobsmith', 5.3, 50),
  ('bobsmith', 6.7, 70),
  ('aliceli', 15.2, 200),
  ('aliceli', 9.8, 90);
