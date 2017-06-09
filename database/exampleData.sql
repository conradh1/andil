/* Insert experience types the pkey will auto increment so Outdoor would be 1*/

INSERT INTO experience_types(name) values ("Outdoor");
INSERT INTO experience_types(name) values ("Hobby");
INSERT INTO experience_types(name) values ("Culture");
INSERT INTO experience_types(name) values ("City");
INSERT INTO experience_types(name) values ("Game");
INSERT INTO experience_types(name) values ("Tour");

INSERT INTO providers(login,
                      pass,
                      firstname,
                      lastname,
                      address,
                      city,
                      island,
                      state,
                      zip,
                      email,
                      phone,
                      insta_login,
                      profile_image_path_1,
                      whatsap,active)
              values ('bobn',
                      PASSWORD('easypass'),
                      'Bob',
                      'Nobody',
                      '123 Nowhere Ave',
                      'Honolulu',
                      'Oahu',
                      'HI',
                      '96812',
                      'bob@nowhere.com',
                      '808-123-4567',
                      'bob_insta',
                      'bobn_profile_img_01.jpg',
                      'bobwhat','Y');

/* This would be pk 1 */
INSERT INTO providers(login,
                      pass,
                      firstname,
                      lastname,
                      address,
                      city,
                      island,
                      state,
                      zip,
                      email,
                      phone,
                      insta_login,
                      profile_image_path_1,
                      whatsap,active)
              values ('kellyk',
                      PASSWORD('kellypass'),
                      'Kelly',
                      'Kook',
                      '711 Surf Street',
                      'Honolulu',
                      'Oahu',
                      'HI',
                      '96877',
                      'kelly@girlswhosurf.com',
                      '808-711-1117',
                      'kelly_insta',
                      'kellyk_profile_img_01.jpg',
                      'kookgirl','Y');



INSERT INTO seekers ( login,
                      pass,
                      firstname,
                      lastname,
                      address,
                      city,
                      state,
                      zip,
                      email,
                      phone,
                      insta_login,
                      dob,
                      gender,
                      whatsap,
                      active)
	      values ('connie',
                      PASSWORD('conniepass'),
                      'Connie',
                      'Canuk',
                      '11 Maple AVe',
                      'Montreal',
                      'Quebec',
                      'We have postal codes!',
                      'connie@beaverton.com',
                      '604-604-1234',
                      'connie_insta',
                      '01-01-1900',
                      'F',
                      'connie_whatz',
                      'Y');


INSERT INTO experiences (fk_provider_id,
                         fk_type_id,
                         slogan,
                         description,
                         short_description,
                         keywords,
                         languages_spoken1,
                         languages_spoken2,
                         image_path_1,
                         image_path_2,
                         image_path_3,
                         video_path_1)
                  values ( 1,
                          1,
                          'Let''s go for a rip',
                          'I have a truck and a moutain bike and knowledge of all the local trails.',
                          'A mountain biking rave.',
                          'Mountain Bike, Downhill, Freeride, Trails',
                           'English',
                           'Pigine',
                           'bob_mountainbike_01.jpg',
                           'bob_mountainbike_02.jpg',
                           'bob_mountainbike_03.jpg',
                           'bob_mountainbike_01.mpg');