CREATE TABLE tbl_118_role (
    id INT NOT NULL AUTO_INCREMENT,
    role_name VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO tbl_118_role (role_name)
VALUES ("Doctor");
INSERT INTO tbl_118_role (role_name)
VALUES ("Patient");
INSERT INTO tbl_118_role (role_name)
VALUES ("Parent");


CREATE TABLE tbl_118_user (
    id INT NOT NULL AUTO_INCREMENT,
    login VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    telephone VARCHAR(255),
    email VARCHAR(255),
    role_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id)
        REFERENCES tbl_118_role (id)
);

INSERT INTO tbl_118_user (login, password, first_name, last_name, telephone, email, role_id)
VALUES ("123456789", "123456789", "Sarah", "Mitchell", "052-142-8444", "doctor@gmail.com", 1);
INSERT INTO tbl_118_user (login, password, first_name, last_name, telephone, email, role_id)
VALUES ("987654321", "987654321", "Jessica", "Rodriguez", "053-711-2772", "mother@gmail.com", 3);
INSERT INTO tbl_118_user (login, password, first_name, last_name, telephone, email, role_id)
VALUES ("321654987", "321654987", "Morris", "Johnson", "050-312-1616", "patient1@gmail.com", 2);
INSERT INTO tbl_118_user (login, password, first_name, last_name, telephone, email, role_id)
VALUES ("546372819", "546372819", "Alex", "Rodriguez", "053-841-3125", "patient2@gmail.com", 2);
INSERT INTO tbl_118_user (login, password, first_name, last_name, telephone, email, role_id)
VALUES ("192837460", "192837460", "Margaret", "Williams", "054-252-6470", "example0@gmail.com", 2);
INSERT INTO tbl_118_user (login, password, first_name, last_name, telephone, email, role_id)
VALUES ("192837461", "192837461", "David", "Miller", "054-252-6471", "example1@gmail.com", 2);
INSERT INTO tbl_118_user (login, password, first_name, last_name, telephone, email, role_id)
VALUES ("192837462", "192837462", "Fred", "Baker", "054-252-6472", "example2@gmail.com", 2);
INSERT INTO tbl_118_user (login, password, first_name, last_name, telephone, email, role_id)
VALUES ("192837463", "192837463", "Lee", "Robinson", "054-252-6473", "example3@gmail.com", 2);
INSERT INTO tbl_118_user (login, password, first_name, last_name, telephone, email, role_id)
VALUES ("192837464", "192837464", "Ned", "Flanders", "054-252-6474", "example4@gmail.com", 2);
INSERT INTO tbl_118_user (login, password, first_name, last_name, telephone, email, role_id)
VALUES ("192837465", "192837465", "Cody", "Willson", "054-252-6475", "example5@gmail.com", 2);
INSERT INTO tbl_118_user (login, password, first_name, last_name, telephone, email, role_id)
VALUES ("192837466", "192837466", "Philip", "Jhones", "054-252-6476", "example6@gmail.com", 2);
INSERT INTO tbl_118_user (login, password, first_name, last_name, telephone, email, role_id)
VALUES ("976431852", "976431852", "Jennifer", "Johnson", "053-123-4567", "mother@gmail.com", 3);
INSERT INTO tbl_118_user (login, password, first_name, last_name, telephone, email, role_id)
VALUES ("842675391", "842675391", "Alfred", "Johnson", "052-765-4321", "father@gmail.com", 3);

CREATE TABLE tbl_118_patient (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT,
    birthday DATE,
    age FLOAT,
    hmo VARCHAR(255),
    medical_condition VARCHAR(255),
    hospital_duration INT,
    description VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)
        REFERENCES tbl_118_user (id)
);

INSERT INTO tbl_118_patient (user_id, birthday, age, hmo, medical_condition, hospital_duration, description)
VALUES (3, "2014-07-22", TIMESTAMPDIFF(YEAR, '2014-07-22', CURDATE()), "Maccabi", "Cerebral Palsy", 17, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
INSERT INTO tbl_118_patient (user_id, birthday, age, hmo, medical_condition, hospital_duration, description)
VALUES (4, "2016-07-22", TIMESTAMPDIFF(YEAR, '2016-07-22', CURDATE()), "Clalit", "ASC", 22, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."); 
INSERT INTO tbl_118_patient (user_id, birthday, age, hmo, medical_condition, hospital_duration, description)
VALUES (5, "2018-07-22", TIMESTAMPDIFF(YEAR, '2018-07-22', CURDATE()), "Clalit", "Cerebral Palsy", 36, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
INSERT INTO tbl_118_patient (user_id, birthday, age, hmo, medical_condition, hospital_duration, description)
VALUES (6, "2020-07-22", TIMESTAMPDIFF(YEAR, '2020-07-22', CURDATE()), "Maccabi", "Osteoporosis", 42, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
INSERT INTO tbl_118_patient (user_id, birthday, age, hmo, medical_condition, hospital_duration, description)
VALUES (7, "2012-07-22", TIMESTAMPDIFF(YEAR, '2012-07-22', CURDATE()), "Maccabi", "Spinal Fusion", 51, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
INSERT INTO tbl_118_patient (user_id, birthday, age, hmo, medical_condition, hospital_duration, description)
VALUES (8, "2012-07-22", TIMESTAMPDIFF(YEAR, '2012-07-22', CURDATE()), "Maccabi", "Dystrophy", 78, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
INSERT INTO tbl_118_patient (user_id, birthday, age, hmo, medical_condition, hospital_duration, description)
VALUES (9, "2015-07-22", TIMESTAMPDIFF(YEAR, '2015-07-22', CURDATE()), "Clalit", "Mitochondrial Disease", 84, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
INSERT INTO tbl_118_patient (user_id, birthday, age, hmo, medical_condition, hospital_duration, description)
VALUES (10, "2011-07-22", TIMESTAMPDIFF(YEAR, '2011-07-22', CURDATE()), "Meuhedet", "Cerebral Palsy", 91, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
INSERT INTO tbl_118_patient (user_id, birthday, age, hmo, medical_condition, hospital_duration, description)
VALUES (11, "2017-07-22", TIMESTAMPDIFF(YEAR, '2017-07-22', CURDATE()), "Meuhedet", "Cerebral Palsy", 97, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");

CREATE TABLE tbl_118_parent (
    id INT NOT NULL AUTO_INCREMENT,
    parent_id INT,
    child_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id)
        REFERENCES tbl_118_user (id),
    FOREIGN KEY (child_id)
        REFERENCES tbl_118_patient (id)
);

INSERT INTO tbl_118_parent (parent_id, child_id)
VALUES (2, 2);
INSERT INTO tbl_118_parent (parent_id, child_id)
VALUES (12, 1);
INSERT INTO tbl_118_parent (parent_id, child_id)
VALUES (13, 1);

CREATE TABLE tbl_118_hobby (
    id INT NOT NULL AUTO_INCREMENT,
    hobby_name VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO tbl_118_hobby (hobby_name)
VALUES ("Sport");
INSERT INTO tbl_118_hobby (hobby_name)
VALUES ("Books");
INSERT INTO tbl_118_hobby (hobby_name)
VALUES ("Movies / Series");
INSERT INTO tbl_118_hobby (hobby_name)
VALUES ("Video Games");
INSERT INTO tbl_118_hobby (hobby_name)
VALUES ("Board Games");
INSERT INTO tbl_118_hobby (hobby_name)
VALUES ("Card Games");

CREATE TABLE tbl_118_hobby_list (
    id INT NOT NULL AUTO_INCREMENT,
    patient_id INT,
    hobby_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (hobby_id)
        REFERENCES tbl_118_hobby (id),
    FOREIGN KEY (patient_id)
        REFERENCES tbl_118_patient (id)
);

INSERT INTO tbl_118_hobby_list (patient_id, hobby_id)
VALUES (1, 4);
INSERT INTO tbl_118_hobby_list (patient_id, hobby_id)
VALUES (1, 5);
INSERT INTO tbl_118_hobby_list (patient_id, hobby_id)
VALUES (1, 6);
INSERT INTO tbl_118_hobby_list (patient_id, hobby_id)
VALUES (2, 1);
INSERT INTO tbl_118_hobby_list (patient_id, hobby_id)
VALUES (2, 4);

CREATE TABLE tbl_118_hmo (
    id INT NOT NULL AUTO_INCREMENT,
    hmo_name VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO tbl_118_hmo (hmo_name)
VALUES ("Clalit");
INSERT INTO tbl_118_hmo (hmo_name)
VALUES ("Maccabi");
INSERT INTO tbl_118_hmo (hmo_name)
VALUES ("Meuhedet");
INSERT INTO tbl_118_hmo (hmo_name)
VALUES ("Leumit");

CREATE TABLE tbl_118_medical_condition (
    id INT NOT NULL AUTO_INCREMENT,
    diagnosis VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO tbl_118_medical_condition (diagnosis)
VALUES ("Cerebral Palsy");
INSERT INTO tbl_118_medical_condition (diagnosis)
VALUES ("ASC");
INSERT INTO tbl_118_medical_condition (diagnosis)
VALUES ("Osteoporosis");
INSERT INTO tbl_118_medical_condition (diagnosis)
VALUES ("Spinal Fusion");
INSERT INTO tbl_118_medical_condition (diagnosis)
VALUES ("Dystrophy");
INSERT INTO tbl_118_medical_condition (diagnosis)
VALUES ("Mitochondrial Disease");

CREATE TABLE tbl_118_therapy (
    id INT NOT NULL AUTO_INCREMENT,
    doctor_id INT,
    patient_id INT,
    therapy_type VARCHAR(255),
    session_counter INT,
    session_max_number INT,
    PRIMARY KEY (id),
    FOREIGN KEY (doctor_id)
        REFERENCES tbl_118_user (id),
    FOREIGN KEY (patient_id)
        REFERENCES tbl_118_patient (id)
);

INSERT INTO tbl_118_therapy (doctor_id, patient_id, therapy_type, session_counter, session_max_number)
VALUES (1, 1, "Physical Therapy", 2, 8);
INSERT INTO tbl_118_therapy (doctor_id, patient_id, therapy_type, session_counter, session_max_number)
VALUES (1, 1, "Psychological Therapy", 3, 7);
INSERT INTO tbl_118_therapy (doctor_id, patient_id, therapy_type, session_counter, session_max_number)
VALUES (1, 1, "Communicational Therapy", 1, 10);
INSERT INTO tbl_118_therapy (doctor_id, patient_id, therapy_type, session_counter, session_max_number)
VALUES (1, 1, "Occipital Therapy", 2, 9);
INSERT INTO tbl_118_therapy (doctor_id, patient_id, therapy_type, session_counter, session_max_number)
VALUES (1, 2, "Physical Therapy", 5, 10);
INSERT INTO tbl_118_therapy (doctor_id, patient_id, therapy_type, session_counter, session_max_number)
VALUES (1, 2, "Psychological Therapy", 5, 12);
INSERT INTO tbl_118_therapy (doctor_id, patient_id, therapy_type, session_counter, session_max_number)
VALUES (1, 2, "Communicational Therapy", 5, 12);
INSERT INTO tbl_118_therapy (doctor_id, patient_id, therapy_type, session_counter, session_max_number)
VALUES (1, 2, "Occipital Therapy", 5, 12);
INSERT INTO tbl_118_therapy (doctor_id, patient_id, therapy_type, session_counter, session_max_number)
VALUES (1, 3, "Physical Therapy", 4, 7);
INSERT INTO tbl_118_therapy (doctor_id, patient_id, therapy_type, session_counter, session_max_number)
VALUES (1, 4, "Physical Therapy", 2, 5);
INSERT INTO tbl_118_therapy (doctor_id, patient_id, therapy_type, session_counter, session_max_number)
VALUES (1, 5, "Physical Therapy", 2, 9);
INSERT INTO tbl_118_therapy (doctor_id, patient_id, therapy_type, session_counter, session_max_number)
VALUES (1, 6, "Physical Therapy", 3, 9);
INSERT INTO tbl_118_therapy (doctor_id, patient_id, therapy_type, session_counter, session_max_number)
VALUES (1, 7, "Physical Therapy", 3, 8);
INSERT INTO tbl_118_therapy (doctor_id, patient_id, therapy_type, session_counter, session_max_number)
VALUES (1, 8, "Physical Therapy", 3, 7);
INSERT INTO tbl_118_therapy (doctor_id, patient_id, therapy_type, session_counter, session_max_number)
VALUES (1, 9, "Physical Therapy", 5, 12);


CREATE TABLE tbl_118_therapy_progress (
    id INT NOT NULL AUTO_INCREMENT,
    therapy_id INT,
    total_progress FLOAT,
    attendance INT,
    total_attendance INT,
    finished_games INT,
    total_games INT,
    personal_result FLOAT,
    average_result FLOAT,
    PRIMARY KEY (id),
    FOREIGN KEY (therapy_id)
        REFERENCES tbl_118_therapy (id)
);

INSERT INTO tbl_118_therapy_progress (therapy_id, total_progress, attendance, total_attendance, finished_games, total_games, personal_result, average_result)
VALUES (1, 0.17, 2, 2, 1, 5, 172.5, 163.1);
INSERT INTO tbl_118_therapy_progress (therapy_id, total_progress, attendance, total_attendance, finished_games, total_games, personal_result, average_result)
VALUES (5, 0.39, 4, 4, 3, 7, 172.5, 163.1);

CREATE TABLE tbl_118_game (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) UNIQUE,
    description VARCHAR(255),
    pegi INT,
    achievements_number INT,
    average_score FLOAT,
    PRIMARY KEY (id)
);

INSERT INTO tbl_118_game (title, description, pegi, achievements_number, average_score)
VALUES ("Celeste", "Help Madeline survive her inner demons on her journey to the top of Celeste Mountain", 7, 32, 163.1);
INSERT INTO tbl_118_game (title, description, pegi, achievements_number, average_score)
VALUES ("Slime Rancher", "Slime Rancher is the tale of Beatrix LeBeau, tries her hand at making a living wrangling slimes", 3, 57, 163.1);
INSERT INTO tbl_118_game (title, description, pegi, achievements_number, average_score)
VALUES ("Ori and the Blind Forest", "Tale of a young orphan destined for heroics", 3, 50, 163.1);
INSERT INTO tbl_118_game (title, description, pegi, achievements_number, average_score)
VALUES ("Beat Saber", "Beat Saber is an immersive rhythm experience", 3, 26, 121.4);
INSERT INTO tbl_118_game (title, description, pegi, achievements_number, average_score)
VALUES ("Journey", "Explore the ancient, mysterious world of Journey", 7, 14, 173.8);

CREATE TABLE tbl_118_session (
    id INT NOT NULL AUTO_INCREMENT,
    therapy_id INT,
    session_number INT,
    date DATE,
    start_time TIME,
    end_time TIME,
    gameplay VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (therapy_id)
        REFERENCES tbl_118_therapy (id)
);

INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (1, 1, "2024-07-24", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (1, 2, "2024-08-06", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (1, 3, "2024-08-07", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (1, 4, "2024-08-08", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (1, 5, "2024-08-09", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (1, 6, "2024-08-10", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (1, 7, "2024-08-11", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (5, 1, "2024-08-11", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (5, 2, "2024-08-12", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (5, 3, "2024-08-13", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (5, 4, "2024-08-14", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (5, 5, "2024-08-15", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (5, 6, "2024-08-16", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (5, 7, "2024-08-17", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (5, 8, "2024-08-18", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (5, 9, "2024-08-19", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (5, 10, "2024-08-20", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (5, 11, "2024-08-21", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (5, 12, "2024-08-22", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (5, 13, "2024-08-23", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");
INSERT INTO tbl_118_session (therapy_id, session_number, date, start_time, end_time, gameplay)
VALUES (5, 14, "2024-08-24", "10:00", "11:30", "https://www.youtube.com/embed/MJ3G8x-OLRs?si=ma1q76arNN3oAOPc");


CREATE TABLE tbl_118_game_progress (
    id INT NOT NULL AUTO_INCREMENT,
    game_id INT,
    session_id INT,
    game_progress FLOAT,
    achievement_progress FLOAT,
    personal_result FLOAT,
    total_progress FLOAT,
    total_achievements FLOAT,
    total_result FLOAT,
    PRIMARY KEY (id),
    FOREIGN KEY (game_id)
        REFERENCES tbl_118_game (id),
    FOREIGN KEY (session_id)
        REFERENCES tbl_118_session (id)
);

INSERT INTO tbl_118_game_progress (game_id, session_id, game_progress, achievement_progress, personal_result, total_progress, total_achievements, total_result)
VALUES (1, 1, 0.57, 0.14, 102.4, 0.57, 0.14, 102.4);
INSERT INTO tbl_118_game_progress (game_id, session_id, game_progress, achievement_progress, personal_result, total_progress, total_achievements, total_result)
VALUES (1, 2, 0.43, 0.08, 82.3, 1.00, 0.22, 184.7);
INSERT INTO tbl_118_game_progress (game_id, session_id, game_progress, achievement_progress, personal_result, total_progress, total_achievements, total_result)
VALUES (2, 2, 0.15, 0.05, 160.3, 0.15, 0.05, 160.3);
INSERT INTO tbl_118_game_progress (game_id, session_id, game_progress, achievement_progress, personal_result, total_progress, total_achievements, total_result)
VALUES (1, 5, 0.15, 0.05, 154.3, 0.15, 0.05, 160.3);
INSERT INTO tbl_118_game_progress (game_id, session_id, game_progress, achievement_progress, personal_result, total_progress, total_achievements, total_result)
VALUES (2, 5, 0.15, 0.05, 178.5, 0.15, 0.05, 160.3);
INSERT INTO tbl_118_game_progress (game_id, session_id, game_progress, achievement_progress, personal_result, total_progress, total_achievements, total_result)
VALUES (3, 5, 0.15, 0.05, 134.9, 0.15, 0.05, 160.3);

CREATE TABLE tbl_118_p_characteristic (
    id INT NOT NULL AUTO_INCREMENT,
    session_id INT,
    height FLOAT,
    weight FLOAT,
    blood VARCHAR(255),
    heart_rate INT,
    temperature FLOAT,
    sys INT,
    dia INT,
    PRIMARY KEY (id),
    FOREIGN KEY (session_id)
        REFERENCES tbl_118_session (id)
);

INSERT INTO tbl_118_p_characteristic (session_id, height, weight, blood, heart_rate, temperature, sys, dia)
VALUES (1, 1.3, 56.0, "B Rh-", 72, 36.5, 123, 81);
INSERT INTO tbl_118_p_characteristic (session_id, height, weight, blood, heart_rate, temperature, sys, dia)
VALUES (2, 1.3, 56.0, "B Rh-", 68, 36.8, 132, 78);
INSERT INTO tbl_118_p_characteristic (session_id, height, weight, blood, heart_rate, temperature, sys, dia)
VALUES (5, 1.3, 56.0, "B Rh-", 68, 36.8, 132, 78);
INSERT INTO tbl_118_p_characteristic (session_id, height, weight, blood, heart_rate, temperature, sys, dia)
VALUES (12, 1.3, 56.0, "B Rh-", 68, 36.8, 132, 78);

CREATE TABLE tbl_118_request (
    id INT NOT NULL AUTO_INCREMENT,
    therapy_id INT,
    sender_id INT,
    recipient_id INT,
    game_id INT,
    status VARCHAR(255),
    reply VARCHAR(255),
    title VARCHAR(255),
    content VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (therapy_id)
        REFERENCES tbl_118_therapy (id),
    FOREIGN KEY (sender_id)
        REFERENCES tbl_118_user (id),
    FOREIGN KEY (recipient_id)
        REFERENCES tbl_118_user (id)
);

INSERT INTO tbl_118_request (therapy_id, sender_id, recipient_id, game_id, status, title, content)
VALUES (1, 3, 1, 4, "No Reply", "Game Access Request", "Beat Saber");
INSERT INTO tbl_118_request (therapy_id, sender_id, recipient_id, game_id, status, title, content)
VALUES (1, 3, 1, 5, "No Reply", "Game Access Request", "Journey");
INSERT INTO tbl_118_request (therapy_id, sender_id, recipient_id, game_id, status, title, content)
VALUES (5, 1, 2, 0, "No Reply", "You have received a request for a personal meeting on:", "01.08.2024");
INSERT INTO tbl_118_request (therapy_id, sender_id, recipient_id, game_id, status, title, content)
VALUES (5, 1, 2, 0, "No Reply", "You have received an offer to allow your child to play:", "Hollow Knight");
INSERT INTO tbl_118_request (therapy_id, sender_id, recipient_id, game_id, status, title, content)
VALUES (5, 1, 2, 0, "No Reply", "You have received a request for a personal meeting on:", "01.08.2024");
INSERT INTO tbl_118_request (therapy_id, sender_id, recipient_id, game_id, status, title, content)
VALUES (5, 1, 2, 0, "No Reply", "You have received an offer to allow your child to play:", "Hollow Knight");