create database whatsapp;
use whatsapp;
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone_number VARCHAR(15) UNIQUE,
    status_message VARCHAR(255),
    last_seen DATETIME
);
INSERT INTO Users (user_id, name, phone_number, status_message, last_seen) VALUES
(1, 'Arun', '9876543210', 'Hey there! I am using WhatsApp.', '2024-08-13 10:30:00'),
(2, 'Lakshmi', '9912345678', 'Busy', '2024-08-13 11:00:00'),
(3, 'Vishnu', '9876123456', 'Available', '2024-08-13 09:45:00'),
(4, 'Priya', '9876987654', 'At work', '2024-08-13 10:00:00'),
(5, 'Karthik', '9812346789', 'In a meeting', '2024-08-13 10:15:00');
CREATE TABLE Chats (
    chat_id INT PRIMARY KEY,
    user1_id INT,
    user2_id INT,
    last_message TEXT,
    last_message_time DATETIME,
    FOREIGN KEY (user1_id) REFERENCES Users(user_id),
    FOREIGN KEY (user2_id) REFERENCES Users(user_id)
);
INSERT INTO Chats (chat_id, user1_id, user2_id, last_message, last_message_time) VALUES
(1, 1, 2, 'See you at the meeting.', '2024-08-13 10:15:00'),
(2, 1, 3, 'Good morning!', '2024-08-13 09:30:00'),
(3, 2, 4, 'Where are you?', '2024-08-13 10:05:00'),
(4, 3, 5, ' catch up later', '2024-08-13 09:50:00'),
(5, 4, 1, 'Can you send the files?', '2024-08-13 10:00:00');
CREATE TABLE Messages (
    message_id INT PRIMARY KEY,
    chat_id INT,
    sender_id INT,
    message_text TEXT,
    sent_time DATETIME,
    FOREIGN KEY (chat_id) REFERENCES Chats(chat_id),
    FOREIGN KEY (sender_id) REFERENCES Users(user_id)
);
INSERT INTO Messages (message_id, chat_id, sender_id, message_text, sent_time) VALUES
(1, 1, 1, 'Are you coming to the meeting?', '2024-08-13 10:00:00'),
(2, 1, 2, 'Yes, I am on my way.', '2024-08-13 10:05:00'),
(3, 2, 1, 'Good morning', '2024-08-13 09:30:00'),
(4, 2, 3, 'Good morning', '2024-08-13 09:35:00'),
(5, 3, 2, 'Where are you?', '2024-08-13 10:05:00'),
(6, 3, 4, 'On my way to the office.', '2024-08-13 10:07:00'),
(7, 4, 3, 'Let catch up later today.', '2024-08-13 09:50:00'),
(8, 4, 5, 'Sure, talk to you later.', '2024-08-13 09:55:00'),
(9, 5, 4, 'Can you send the files I requested?', '2024-08-13 10:00:00'),
(10, 5, 1, 'I will send them right away', '2024-08-13 10:05:00');
CREATE TABLE whatsappgroup (
    group_id INT PRIMARY KEY,
    group_name VARCHAR(50),
    created_by INT,
    created_at DATETIME,
    FOREIGN KEY (created_by) REFERENCES Users(user_id)
);
INSERT INTO whatsappgroup(group_id, group_name, created_by, created_at) VALUES
(1, 'Friends', 1, '2024-08-01 12:00:00'),
(2, 'Work', 2, '2024-08-05 15:00:00');
CREATE TABLE Group_Messages (
    message_id INT PRIMARY KEY,
    group_id INT,
    sender_id INT,
    message_text TEXT,
    sent_time DATETIME,
    FOREIGN KEY (group_id) REFERENCES whatsappgroup(group_id),
    FOREIGN KEY (sender_id) REFERENCES Users(user_id)
);
INSERT INTO Group_Messages (message_id, group_id, sender_id, message_text, sent_time) 
VALUES
(1, 1, 1, 'Hello everyone!', '2024-08-01 12:10:00'),
(2, 1, 2, 'Hi', '2024-08-01 12:15:00'),
(3, 1, 3, 'Good to see you all here.', '2024-08-01 12:20:00'),
(4, 2, 2, 'Let have a meeting tomorrow.', '2024-08-05 15:20:00'),
(5, 2, 4, 'I am available.', '2024-08-05 15:25:00');
