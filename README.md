1.SELECT Chats.chat_id, Users1.name AS user1_name, Users2.name AS user2_name, Chats.last_message, Chats.last_message_time
FROM Chats
JOIN Users AS Users1 ON Chats.user1_id = Users1.user_id
JOIN Users AS Users2 ON Chats.user2_id = Users2.user_id;
![SO 1](https://github.com/user-attachments/assets/c7ac0f72-ef8c-4641-8ea9-7c8308d62550)

2.SELECT Messages.message_id, Messages.message_text, Messages.sent_time, Chats.chat_id
FROM Messages
JOIN Chats ON Messages.chat_id = Chats.chat_id
WHERE Messages.sender_id = 3
ORDER BY Messages.sent_time;

![SO 2](https://github.com/user-attachments/assets/21971544-37c3-45c4-9a89-aa6a64c188d1)

