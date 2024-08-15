CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(50)
);

INSERT INTO users (username, email) VALUES ('admin', 'admin@example.com');
INSERT INTO users (username, email) VALUES ('user1', 'user1@example.com');
INSERT INTO users (username, email) VALUES ('user2', 'user2@example.com');


CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    title VARCHAR(100),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO posts (user_id, title, content) VALUES
(1, 'Welcome to the Forum', 'This is the first post by the admin.'),
(2, 'My First Post', 'Hello everyone, this is user1''s first post.'),
(3, 'A Quick Update', 'Here is a quick update from user2.');


CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    sender_id INTEGER REFERENCES users(id),
    receiver_id INTEGER REFERENCES users(id),
    message TEXT,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO messages (sender_id, receiver_id, message) VALUES
(1, 2, 'Hello user1! Welcome to the platform.'),
(2, 1, 'Thank you, admin! Happy to be here.'),
(3, 2, 'Hi user1, nice to meet you!');


CREATE TABLE post_categories (
    post_id INTEGER REFERENCES posts(id),
    category_id INTEGER REFERENCES categories(id),
    PRIMARY KEY (post_id, category_id)
);

INSERT INTO post_categories (post_id, category_id) VALUES
(1, 2),
(2, 1),
(3, 3);


CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO categories (name) VALUES
('General Discussion'),
('Announcements'),
('Feedback'),
('Off-topic');


CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts(id),
    user_id INTEGER REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO likes (post_id, user_id) VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2);



CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts(id),
    user_id INTEGER REFERENCES users(id),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO comments (post_id, user_id, comment) VALUES
(1, 2, 'Great post, admin!'),
(1, 3, 'Looking forward to more content.'),
(2, 1, 'Thanks for sharing!');


