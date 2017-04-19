/* Contains details of every experience */
CREATE TABLE experiences (
  pk_id INT PRIMARY KEY AUTO_INCREMENT,
  fk_provider_id INT NOT NULL,
  fk_type_id SMALLINT NOT NULL,
  slogan VARCHAR(64) NOT NULL,
  description VARCHAR(2000) NOT NULL,
  short_description VARCHAR (200),
  keywords VARCHAR(256) NOT NULL,
  languages_spoken1 VARCHAR(30),
  languages_spoken2 VARCHAR(30),
  languages_spoken3 VARCHAR(30),
  languages_spoken4 VARCHAR(30),
  image_path_1 VARCHAR(30) NOT NULL,
  image_path_2 VARCHAR(30),
  image_path_3 VARCHAR(30),
  image_path_4 VARCHAR(30),
  image_path_5 VARCHAR(30),
  video_path_1 VARCHAR(30),
  video_path_2 VARCHAR(30),
  reg_date TIMESTAMP,
  FOREIGN KEY(fk_provider_id) REFERENCES providers(pk_id)
   ON DELETE CASCADE,

  FOREIGN KEY (fk_type_id) REFERENCES experience_types(pk_id)
   ON DELETE CASCADE
) ENGINE=INNODB;

CREATE TABLE experience_types (
  pk_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(40)
) ENGINE=INNODB;


/* Providers are the users who provide experiences */
CREATE TABLE providers (
  pk_id INT PRIMARY KEY AUTO_INCREMENT,
  login VARCHAR(30) NOT NULL,
  pass VARCHAR(256) NOT NULL,
  firstname VARCHAR(30) NOT NULL,
  lastname VARCHAR(30) NOT NULL,
  address VARCHAR(30) NOT NULL,
  city VARCHAR(30) NOT NULL,
  island VARCHAR(30) NOT NULL,
  state VARCHAR(30) NOT NULL,
  zip VARCHAR(30) NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone VARCHAR(30),
  insta_login VARCHAR(30),
  profile_image_path_1 VARCHAR(30) NOT NULL,
  insta_pass VARCHAR(30),
  whatsap VARCHAR(30),
  reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  active ENUM('yes','no')
) ENGINE=INNODB;

/* Seekers are users who wish to engage in an experience */
CREATE TABLE seekers (
  pk_id INT PRIMARY KEY AUTO_INCREMENT,
  login VARCHAR(30) NOT NULL,
  pass VARCHAR(256) NOT NULL,
  firstname VARCHAR(30),
  lastname VARCHAR(30),
  address VARCHAR(30),
  city VARCHAR(30),
  state VARCHAR(30),
  zip VARCHAR(30),
  email VARCHAR(50) NOT NULL,
  phone VARCHAR(30),
  insta_login VARCHAR(30),
  insta_pass VARCHAR(30),
  dob VARCHAR(30),
  gender VARCHAR(30),
  reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  whatsap VARCHAR(30),
  active ENUM('yes','no')
) ENGINE=INNODB;

/* Seekers are users who wish to engage in an experience */
CREATE TABLE transactions (
  pk_id INT PRIMARY KEY AUTO_INCREMENT,
  reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  fk_experience_id INT NOT NULL,
  fk_seeker_id INT NOT NULL,
  rating ENUM('1','2','3','4','5'),
  comments VARCHAR(200),
  FOREIGN KEY(fk_experience_id) REFERENCES experiences(pk_id)
   ON DELETE CASCADE,
  FOREIGN KEY(fk_seeker_id) REFERENCES seekers(pk_id)
   ON DELETE CASCADE
) ENGINE=INNODB;





