CREATE DATABASE Yt


CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    password_hash VARCHAR(255),
    created_at DATETIME2 DEFAULT GETDATE(),
    status VARCHAR(20)
);

CREATE TABLE UserProfiles (
    profile_id INT PRIMARY KEY,
    user_id INT,
    full_name VARCHAR(100),
    bio VARCHAR(MAX),
    profile_pic_url VARCHAR(255),
    country VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE LoginHistory (
    login_id INT PRIMARY KEY,
    user_id INT,
    login_time DATETIME2,
    device VARCHAR(100),
    ip_address VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Channels (
    channel_id INT PRIMARY KEY,
    user_id INT,
    channel_name VARCHAR(100),
    description VARCHAR(MAX),
    created_at DATETIME2 DEFAULT GETDATE(),
    subscribers_count INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE ChannelSettings (
    channel_id INT PRIMARY KEY,
    visibility VARCHAR(20),
    monetization_enabled BIT,
    FOREIGN KEY (channel_id) REFERENCES Channels(channel_id)
);

CREATE TABLE Videos (
    video_id INT PRIMARY KEY,
    channel_id INT,
    title VARCHAR(255),
    description VARCHAR(MAX),
    duration INT,
    upload_date DATETIME2 DEFAULT GETDATE(),
    visibility VARCHAR(20),
    FOREIGN KEY (channel_id) REFERENCES Channels(channel_id)
);

CREATE TABLE VideoFiles (
    file_id INT PRIMARY KEY,
    video_id INT,
    resolution VARCHAR(20),
    file_url VARCHAR(255),
    format VARCHAR(20),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE VideoTags (
    tag_id INT PRIMARY KEY,
    tag_name VARCHAR(50)
);

CREATE TABLE VideoTagMapping (
    video_id INT,
    tag_id INT,
    PRIMARY KEY (video_id, tag_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id),
    FOREIGN KEY (tag_id) REFERENCES VideoTags(tag_id)
);

CREATE TABLE Likes (
    like_id INT PRIMARY KEY,
    user_id INT,
    video_id INT,
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE Dislikes (
    dislike_id INT PRIMARY KEY,
    user_id INT,
    video_id INT,
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE Comments (
    comment_id INT PRIMARY KEY,
    user_id INT,
    video_id INT,
    comment_text VARCHAR(MAX),
    parent_comment_id INT NULL,
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE VideoViews (
    view_id INT PRIMARY KEY,
    user_id INT,
    video_id INT,
    watch_time INT,
    viewed_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE VideoAnalytics (
    video_id INT PRIMARY KEY,
    total_views INT,
    total_watch_time INT,
    likes_count INT,
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE Playlists (
    playlist_id INT PRIMARY KEY,
    user_id INT,
    title VARCHAR(100),
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE PlaylistVideos (
    playlist_id INT,
    video_id INT,
    added_at DATETIME2 DEFAULT GETDATE(),
    PRIMARY KEY (playlist_id, video_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE Subscriptions (
    subscription_id INT PRIMARY KEY,
    user_id INT,
    channel_id INT,
    subscribed_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (channel_id) REFERENCES Channels(channel_id)
);

CREATE TABLE Notifications (
    notification_id INT PRIMARY KEY,
    user_id INT,
    message VARCHAR(MAX),
    is_read BIT,
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE SearchHistory (
    search_id INT PRIMARY KEY,
    user_id INT,
    query VARCHAR(255),
    searched_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE WatchHistory (
    history_id INT PRIMARY KEY,
    user_id INT,
    video_id INT,
    watched_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE Ads (
    ad_id INT PRIMARY KEY,
    advertiser_name VARCHAR(100),
    budget DECIMAL(10,2)
);

CREATE TABLE VideoAds (
    video_id INT,
    ad_id INT,
    PRIMARY KEY (video_id, ad_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id),
    FOREIGN KEY (ad_id) REFERENCES Ads(ad_id)
);

CREATE TABLE Revenue (
    revenue_id INT PRIMARY KEY,
    video_id INT,
    earnings DECIMAL(10,2),
    date DATE,
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE Reports (
    report_id INT PRIMARY KEY,
    user_id INT,
    video_id INT,
    reason VARCHAR(255),
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

INSERT INTO Users VALUES
(1,'amith','amith@gmail.com','h1',GETDATE(),'active'),
(2,'rahul','rahul@gmail.com','h2',GETDATE(),'active'),
(3,'sneha','sneha@gmail.com','h3',GETDATE(),'active'),
(4,'kiran','kiran@gmail.com','h4',GETDATE(),'active'),
(5,'megha','megha@gmail.com','h5',GETDATE(),'active'),
(6,'arjun','arjun@gmail.com','h6',GETDATE(),'active'),
(7,'pooja','pooja@gmail.com','h7',GETDATE(),'active'),
(8,'vikram','vikram@gmail.com','h8',GETDATE(),'active'),
(9,'neha','neha@gmail.com','h9',GETDATE(),'active'),
(10,'rohit','rohit@gmail.com','h10',GETDATE(),'active');

INSERT INTO UserProfiles VALUES
(1,1,'Amith','Tech lover','img1','India'),
(2,2,'Rahul','Traveler','img2','India'),
(3,3,'Sneha','Cook','img3','India'),
(4,4,'Kiran','Developer','img4','India'),
(5,5,'Megha','Designer','img5','India'),
(6,6,'Arjun','Gamer','img6','India'),
(7,7,'Pooja','Vlogger','img7','India'),
(8,8,'Vikram','Musician','img8','India'),
(9,9,'Neha','Teacher','img9','India'),
(10,10,'Rohit','Trainer','img10','India');

INSERT INTO LoginHistory VALUES
(1,1,GETDATE(),'Mobile','192.168.1.1'),
(2,2,GETDATE(),'Laptop','192.168.1.2'),
(3,3,GETDATE(),'Tablet','192.168.1.3'),
(4,4,GETDATE(),'Mobile','192.168.1.4'),
(5,5,GETDATE(),'Laptop','192.168.1.5'),
(6,6,GETDATE(),'Mobile','192.168.1.6'),
(7,7,GETDATE(),'Tablet','192.168.1.7'),
(8,8,GETDATE(),'Mobile','192.168.1.8'),
(9,9,GETDATE(),'Laptop','192.168.1.9'),
(10,10,GETDATE(),'Mobile','192.168.1.10');


INSERT INTO Channels VALUES
(101,1,'Tech','Tech videos',GETDATE(),1000),
(102,2,'Travel','Vlogs',GETDATE(),800),
(103,3,'Food','Cooking',GETDATE(),600),
(104,4,'Code','Programming',GETDATE(),900),
(105,5,'Design','UI',GETDATE(),400),
(106,6,'Gaming','Games',GETDATE(),700),
(107,7,'Daily','Life',GETDATE(),500),
(108,8,'Music','Songs',GETDATE(),650),
(109,9,'Study','Education',GETDATE(),300),
(110,10,'Fitness','Workout',GETDATE(),750);

INSERT INTO ChannelSettings VALUES
(101,'public',1),(102,'public',1),(103,'public',0),
(104,'public',1),(105,'private',0),(106,'public',1),
(107,'public',1),(108,'public',1),(109,'private',0),(110,'public',1);

INSERT INTO Videos VALUES
(201,101,'SQL','Learn SQL',600,GETDATE(),'public'),
(202,102,'Trip','Goa vlog',900,GETDATE(),'public'),
(203,103,'Recipe','Food',500,GETDATE(),'public'),
(204,104,'Java','Code',700,GETDATE(),'public'),
(205,105,'UI','Design',400,GETDATE(),'public'),
(206,106,'Game','Play',800,GETDATE(),'public'),
(207,107,'Day','Routine',300,GETDATE(),'public'),
(208,108,'Song','Music',450,GETDATE(),'public'),
(209,109,'Math','Study',350,GETDATE(),'public'),
(210,110,'Gym','Fitness',600,GETDATE(),'public');

INSERT INTO VideoFiles VALUES
(1,201,'1080p','url1','mp4'),
(2,202,'720p','url2','mp4'),
(3,203,'1080p','url3','mp4'),
(4,204,'480p','url4','mp4'),
(5,205,'1080p','url5','mp4'),
(6,206,'720p','url6','mp4'),
(7,207,'1080p','url7','mp4'),
(8,208,'480p','url8','mp4'),
(9,209,'1080p','url9','mp4'),
(10,210,'720p','url10','mp4');

INSERT INTO VideoTags VALUES
(1,'SQL'),(2,'Travel'),(3,'Food'),(4,'Coding'),
(5,'Design'),(6,'Gaming'),(7,'Vlog'),
(8,'Music'),(9,'Education'),(10,'Fitness');

INSERT INTO VideoTagMapping VALUES
(201,1),(202,2),(203,3),(204,4),(205,5),
(206,6),(207,7),(208,8),(209,9),(210,10);

INSERT INTO Likes VALUES
(1,2,201,GETDATE()),(2,3,202,GETDATE()),
(3,4,203,GETDATE()),(4,5,204,GETDATE()),
(5,6,205,GETDATE()),(6,7,206,GETDATE()),
(7,8,207,GETDATE()),(8,9,208,GETDATE()),
(9,10,209,GETDATE()),(10,1,210,GETDATE());

INSERT INTO Dislikes VALUES
(1,1,201,GETDATE()),(2,2,202,GETDATE()),
(3,3,203,GETDATE()),(4,4,204,GETDATE()),
(5,5,205,GETDATE()),(6,6,206,GETDATE()),
(7,7,207,GETDATE()),(8,8,208,GETDATE()),
(9,9,209,GETDATE()),(10,10,210,GETDATE());



INSERT INTO Comments VALUES
(1,2,201,'Nice',NULL,GETDATE()),
(2,3,202,'Good',NULL,GETDATE()),
(3,4,203,'Great',NULL,GETDATE()),
(4,5,204,'Cool',NULL,GETDATE()),
(5,6,205,'Super',NULL,GETDATE()),
(6,7,206,'Wow',NULL,GETDATE()),
(7,8,207,'Nice',NULL,GETDATE()),
(8,9,208,'Amazing',NULL,GETDATE()),
(9,10,209,'Helpful',NULL,GETDATE()),
(10,1,210,'Good',NULL,GETDATE());

INSERT INTO VideoViews VALUES
(1,1,201,300,GETDATE()),(2,2,202,500,GETDATE()),
(3,3,203,200,GETDATE()),(4,4,204,400,GETDATE()),
(5,5,205,150,GETDATE()),(6,6,206,600,GETDATE()),
(7,7,207,250,GETDATE()),(8,8,208,350,GETDATE()),
(9,9,209,180,GETDATE()),(10,10,210,450,GETDATE());

INSERT INTO VideoAnalytics VALUES
(201,1000,30000,200),(202,1500,45000,300),
(203,800,20000,150),(204,1200,35000,250),
(205,600,15000,100),(206,1800,50000,400),
(207,700,18000,120),(208,900,25000,180),
(209,500,12000,90),(210,1100,30000,220);

INSERT INTO Playlists VALUES
(1,1,'Tech',GETDATE()),(2,2,'Travel',GETDATE()),
(3,3,'Food',GETDATE()),(4,4,'Code',GETDATE()),
(5,5,'Design',GETDATE()),(6,6,'Gaming',GETDATE()),
(7,7,'Daily',GETDATE()),(8,8,'Music',GETDATE()),
(9,9,'Study',GETDATE()),(10,10,'Fitness',GETDATE());

INSERT INTO PlaylistVideos VALUES
(1,201,GETDATE()),(2,202,GETDATE()),(3,203,GETDATE()),
(4,204,GETDATE()),(5,205,GETDATE()),(6,206,GETDATE()),
(7,207,GETDATE()),(8,208,GETDATE()),(9,209,GETDATE()),
(10,210,GETDATE());

INSERT INTO Subscriptions VALUES
(1,2,101,GETDATE()),(2,3,102,GETDATE()),
(3,4,103,GETDATE()),(4,5,104,GETDATE()),
(5,6,105,GETDATE()),(6,7,106,GETDATE()),
(7,8,107,GETDATE()),(8,9,108,GETDATE()),
(9,10,109,GETDATE()),(10,1,110,GETDATE());

INSERT INTO Notifications VALUES
(1,1,'New video',0,GETDATE()),(2,2,'New sub',1,GETDATE()),
(3,3,'Comment',0,GETDATE()),(4,4,'Like',1,GETDATE()),
(5,5,'Follower',0,GETDATE()),(6,6,'Live',1,GETDATE()),
(7,7,'Playlist',0,GETDATE()),(8,8,'Trending',1,GETDATE()),
(9,9,'Message',0,GETDATE()),(10,10,'Update',1,GETDATE());

INSERT INTO SearchHistory VALUES
(1,1,'SQL',GETDATE()),(2,2,'Goa',GETDATE()),
(3,3,'Pasta',GETDATE()),(4,4,'Java',GETDATE()),
(5,5,'UI',GETDATE()),(6,6,'Game',GETDATE()),
(7,7,'Vlog',GETDATE()),(8,8,'Music',GETDATE()),
(9,9,'Math',GETDATE()),(10,10,'Gym',GETDATE());

INSERT INTO WatchHistory VALUES
(1,1,201,GETDATE()),(2,2,202,GETDATE()),
(3,3,203,GETDATE()),(4,4,204,GETDATE()),
(5,5,205,GETDATE()),(6,6,206,GETDATE()),
(7,7,207,GETDATE()),(8,8,208,GETDATE()),
(9,9,209,GETDATE()),(10,10,210,GETDATE());

INSERT INTO Ads VALUES
(1,'Amazon',10000),(2,'Flipkart',8000),(3,'Google',15000),
(4,'Nike',7000),(5,'Adidas',6000),(6,'Samsung',12000),
(7,'Apple',20000),(8,'OnePlus',9000),(9,'Coke',5000),(10,'Pepsi',4000);

INSERT INTO VideoAds VALUES
(201,1),(202,2),(203,3),(204,4),(205,5),
(206,6),(207,7),(208,8),(209,9),(210,10);

INSERT INTO Revenue VALUES
(1,201,500,'2025-03-01'),(2,202,700,'2025-03-02'),
(3,203,300,'2025-03-03'),(4,204,600,'2025-03-04'),
(5,205,200,'2025-03-05'),(6,206,800,'2025-03-06'),
(7,207,250,'2025-03-07'),(8,208,400,'2025-03-08'),
(9,209,150,'2025-03-09'),(10,210,550,'2025-03-10');

INSERT INTO Reports VALUES
(1,1,201,'Spam','pending'),
(2,2,202,'Abuse','resolved'),
(3,3,203,'Copyright','pending'),
(4,4,204,'Spam','resolved'),
(5,5,205,'Abuse','pending'),
(6,6,206,'Fake','pending'),
(7,7,207,'Spam','resolved'),
(8,8,208,'Copyright','pending'),
(9,9,209,'Abuse','resolved'),
(10,10,210,'Spam','pending');


SELECT * FROM Users;

SELECT c.channel_name, u.username
FROM Channels c
JOIN Users u ON c.user_id = u.user_id;

SELECT v.title, c.channel_name
FROM Videos v
JOIN Channels c ON v.channel_id = c.channel_id;

SELECT v.title, COUNT(l.like_id) AS total_likes
FROM Videos v
LEFT JOIN Likes l ON v.video_id = l.video_id
GROUP BY v.title;

SELECT v.title, COUNT(d.dislike_id) AS total_dislikes
FROM Videos v
LEFT JOIN Dislikes d ON v.video_id = d.video_id
GROUP BY v.title;

SELECT u.username, v.title, c.comment_text
FROM Comments c
JOIN Users u ON c.user_id = u.user_id
JOIN Videos v ON c.video_id = v.video_id;

SELECT v.title, COUNT(vv.view_id) AS total_views
FROM Videos v
JOIN VideoViews vv ON v.video_id = vv.video_id
GROUP BY v.title;

SELECT TOP 5 v.title, COUNT(vv.view_id) AS views
FROM Videos v
JOIN VideoViews vv ON v.video_id = vv.video_id
GROUP BY v.title
ORDER BY views DESC;

SELECT c.channel_name, COUNT(s.subscription_id) AS subscribers
FROM Channels c
LEFT JOIN Subscriptions s ON c.channel_id = s.channel_id
GROUP BY c.channel_name;

SELECT * FROM Notifications
WHERE is_read = 0;

SELECT p.title AS playlist, v.title AS video
FROM PlaylistVideos pv
JOIN Playlists p ON pv.playlist_id = p.playlist_id
JOIN Videos v ON pv.video_id = v.video_id;

SELECT v.title, t.tag_name
FROM Videos v
JOIN VideoTagMapping vt ON v.video_id = vt.video_id
JOIN VideoTags t ON vt.tag_id = t.tag_id;

SELECT u.username, v.title
FROM WatchHistory wh
JOIN Users u ON wh.user_id = u.user_id
JOIN Videos v ON wh.video_id = v.video_id
WHERE u.user_id = 1;

SELECT u.username, s.query
FROM SearchHistory s
JOIN Users u ON s.user_id = u.user_id;

SELECT v.title, SUM(r.earnings) AS total_revenue
FROM Revenue r
JOIN Videos v ON r.video_id = v.video_id
GROUP BY v.title;

SELECT c.channel_name, SUM(r.earnings) AS revenue
FROM Channels c
JOIN Videos v ON c.channel_id = v.channel_id
JOIN Revenue r ON v.video_id = r.video_id
GROUP BY c.channel_name;

SELECT v.title, r.reason, r.status
FROM Reports r
JOIN Videos v ON r.video_id = v.video_id;

SELECT u.username,
COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id) AS activity
FROM Users u
LEFT JOIN Likes l ON u.user_id = l.user_id
LEFT JOIN Comments c ON u.user_id = c.user_id
GROUP BY u.username
ORDER BY activity DESC;

SELECT c.channel_name, COUNT(v.video_id) AS total_videos
FROM Channels c
JOIN Videos v ON c.channel_id = v.channel_id
GROUP BY c.channel_name
ORDER BY total_videos DESC;

SELECT v.title, AVG(vv.watch_time) AS avg_watch_time
FROM VideoViews vv
JOIN Videos v ON vv.video_id = v.video_id
GROUP BY v.title;

SELECT c.channel_name
FROM Channels c
JOIN ChannelSettings cs ON c.channel_id = cs.channel_id
WHERE cs.monetization_enabled = 1;

SELECT v.title, a.advertiser_name
FROM VideoAds va
JOIN Videos v ON va.video_id = v.video_id
JOIN Ads a ON va.ad_id = a.ad_id;

SELECT u.username, v.title
FROM Users u
JOIN Channels c ON u.user_id = c.user_id
JOIN Videos v ON c.channel_id = v.channel_id
WHERE u.user_id = 1;



-- Stored procedures --

CREATE PROCEDURE GetAllUsers
AS
BEGIN
    SELECT * FROM Users;
END;

EXEC GetAllUsers;



CREATE PROCEDURE GetUserById
    @user_id INT
AS
BEGIN
    SELECT * FROM Users WHERE user_id = @user_id;
END;

EXEC GetUserById 1;
EXEC GetUserById 6;
EXEC GetUserById 11;



CREATE PROCEDURE AddUser
    @id INT,
    @username VARCHAR(50),
    @email VARCHAR(100),
    @password VARCHAR(255)
AS
BEGIN
    INSERT INTO Users VALUES (@id,@username,@email,@password,GETDATE(),'active');
END;

EXEC AddUser 
    @id = 11,
    @username = 'john',
    @email = 'john@gmail.com',
    @password = 'h11';



CREATE PROCEDURE UpdateUserStatus
    @user_id INT,
    @status VARCHAR(20)
AS
BEGIN
    UPDATE Users SET status = @status WHERE user_id = @user_id;
END;

EXEC UpdateUserStatus 1, 'inactive';



CREATE PROCEDURE DeleteUser
    @user_id INT
AS
BEGIN
    DELETE FROM Users WHERE user_id = @user_id;
END;

EXEC DeleteUser 11;



CREATE PROCEDURE GetAllChannels
AS
BEGIN
    SELECT * FROM Channels;
END;

EXEC GetAllChannels;



CREATE PROCEDURE GetVideosByChannel
    @channel_id INT
AS
BEGIN
    SELECT * FROM Videos WHERE channel_id = @channel_id;
END;

EXEC GetVideosByChannel 101;



CREATE PROCEDURE AddVideo
    @video_id INT,
    @channel_id INT,
    @title VARCHAR(255),
    @desc VARCHAR(MAX),
    @duration INT
AS
BEGIN
    INSERT INTO Videos VALUES (@video_id,@channel_id,@title,@desc,@duration,GETDATE(),'public');
END;

EXEC AddVideo 211, 101, 'New Video', 'Test desc', 500;


CREATE PROCEDURE LikeVideo
    @like_id INT,
    @user_id INT,
    @video_id INT
AS
BEGIN
    INSERT INTO Likes VALUES (@like_id,@user_id,@video_id,GETDATE());
END;

EXEC LikeVideo 11, 1, 201;



CREATE PROCEDURE DislikeVideo
    @id INT,
    @user INT,
    @video INT
AS
BEGIN
    INSERT INTO Dislikes VALUES (@id,@user,@video,GETDATE());
END;

EXEC DislikeVideo 11, 1, 201;



CREATE PROCEDURE AddComment
    @id INT,
    @user INT,
    @video INT,
    @text VARCHAR(MAX)
AS
BEGIN
    INSERT INTO Comments VALUES (@id,@user,@video,@text,NULL,GETDATE());
END;

EXEC AddComment 11, 1, 201, 'Nice video';



CREATE PROCEDURE GetCommentsByVideo
    @video_id INT
AS
BEGIN
    SELECT * FROM Comments WHERE video_id = @video_id;
END;

EXEC GetCommentsByVideo 201;



CREATE PROCEDURE GetLikesCount
    @video_id INT
AS
BEGIN
    SELECT COUNT(*) AS total_likes
    FROM Likes
    WHERE video_id = @video_id;
END;

EXEC GetLikesCount 201;



CREATE PROCEDURE GetDislikesCount
    @video_id INT
AS
BEGIN
    SELECT COUNT(*) AS total_dislikes
    FROM Dislikes
    WHERE video_id = @video_id;
END;

EXEC GetDislikesCount 201;



CREATE PROCEDURE GetVideoDetails
    @video_id INT
AS
BEGIN
    SELECT v.title, c.channel_name
    FROM Videos v
    JOIN Channels c ON v.channel_id = c.channel_id
    WHERE v.video_id = @video_id;
END;

EXEC GetVideoDetails 201;



CREATE PROCEDURE GetUserActivity
    @user_id INT
AS
BEGIN
    SELECT 
        COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id) AS activity
    FROM Users u
    LEFT JOIN Likes l ON u.user_id = l.user_id
    LEFT JOIN Comments c ON u.user_id = c.user_id
    WHERE u.user_id = @user_id
    GROUP BY u.user_id;
END;

EXEC GetUserActivity 1;
EXEC GetUserActivity 3;



CREATE PROCEDURE GetTopVideos
AS
BEGIN
    SELECT TOP 5 v.title, COUNT(vv.view_id) AS views
    FROM Videos v
    JOIN VideoViews vv ON v.video_id = vv.video_id
    GROUP BY v.title
    ORDER BY views DESC;
END;

EXEC GetTopVideos;



CREATE PROCEDURE SubscribeChannel
    @id INT,
    @user INT,
    @channel INT
AS
BEGIN
    INSERT INTO Subscriptions VALUES (@id,@user,@channel,GETDATE());
END;

EXEC SubscribeChannel 11, 1, 101;



CREATE PROCEDURE GetSubscribers
    @channel_id INT
AS
BEGIN
    SELECT COUNT(*) AS total_subscribers
    FROM Subscriptions
    WHERE channel_id = @channel_id;
END;

EXEC GetSubscribers 101;



CREATE PROCEDURE AddToPlaylist
    @playlist INT,
    @video INT
AS
BEGIN
    INSERT INTO PlaylistVideos VALUES (@playlist,@video,GETDATE());
END;

EXEC AddToPlaylist 1, 201;



CREATE PROCEDURE GetPlaylistVideos
    @playlist_id INT
AS
BEGIN
    SELECT v.title
    FROM PlaylistVideos pv
    JOIN Videos v ON pv.video_id = v.video_id
    WHERE pv.playlist_id = @playlist_id;
END;

EXEC GetPlaylistVideos 1;



CREATE PROCEDURE GetSearchHistory
    @user INT
AS
BEGIN
    SELECT query FROM SearchHistory WHERE user_id = @user;
END;

EXEC GetSearchHistory 1;



CREATE PROCEDURE GetUnreadNotifications
    @user INT
AS
BEGIN
    SELECT * FROM Notifications
    WHERE user_id = @user AND is_read = 0;
END;

EXEC GetUnreadNotifications 1;



CREATE PROCEDURE GetRevenue
    @video INT
AS
BEGIN
    SELECT SUM(earnings) AS total_revenue
    FROM Revenue
    WHERE video_id = @video;
END;

EXEC GetRevenue 201;



CREATE PROCEDURE GetVideosByTag
    @tag VARCHAR(50)
AS
BEGIN
    SELECT v.title
    FROM Videos v
    JOIN VideoTagMapping vt ON v.video_id = vt.video_id
    JOIN VideoTags t ON vt.tag_id = t.tag_id
    WHERE t.tag_name = @tag;
END;

EXEC GetVideosByTag 'SQL';



CREATE PROCEDURE GetTrendingVideos
AS
BEGIN
    SELECT v.title,
           COUNT(DISTINCT vv.view_id) + COUNT(DISTINCT l.like_id) AS score
    FROM Videos v
    LEFT JOIN VideoViews vv ON v.video_id = vv.video_id
    LEFT JOIN Likes l ON v.video_id = l.video_id
    GROUP BY v.title
    ORDER BY score DESC;
END;

EXEC GetTrendingVideos;



CREATE PROCEDURE GetWatchHistory
    @user INT
AS
BEGIN
    SELECT v.title, wh.watched_at
    FROM WatchHistory wh
    JOIN Videos v ON wh.video_id = v.video_id
    WHERE wh.user_id = @user;
END;

EXEC GetWatchHistory 1;



CREATE PROCEDURE ChannelRevenue
    @channel INT
AS
BEGIN
    SELECT SUM(r.earnings) AS total_revenue
    FROM Videos v
    JOIN Revenue r ON v.video_id = r.video_id
    WHERE v.channel_id = @channel;
END;

EXEC ChannelRevenue 101;



CREATE PROCEDURE GetMostActiveUsers
AS
BEGIN
    SELECT u.username,
           COUNT(l.like_id) + COUNT(c.comment_id) AS activity
    FROM Users u
    LEFT JOIN Likes l ON u.user_id = l.user_id
    LEFT JOIN Comments c ON u.user_id = c.user_id
    GROUP BY u.username
    ORDER BY activity DESC;
END;

EXEC GetMostActiveUsers;



CREATE PROCEDURE VideoPerformance
    @video INT
AS
BEGIN
    SELECT 
        v.title,
        COUNT(DISTINCT l.like_id) AS likes,
        COUNT(DISTINCT d.dislike_id) AS dislikes,
        COUNT(DISTINCT vv.view_id) AS views
    FROM Videos v
    LEFT JOIN Likes l ON v.video_id = l.video_id
    LEFT JOIN Dislikes d ON v.video_id = d.video_id
    LEFT JOIN VideoViews vv ON v.video_id = vv.video_id
    WHERE v.video_id = @video
    GROUP BY v.title;
END;

EXEC VideoPerformance 201;




CREATE PROCEDURE GetReportedVideos
AS
BEGIN
    SELECT v.title, r.reason, r.status
    FROM Reports r
    JOIN Videos v ON r.video_id = v.video_id;
END;

EXEC GetReportedVideos;



CREATE PROCEDURE GetMonetizedChannels
AS
BEGIN
    SELECT c.channel_name
    FROM Channels c
    JOIN ChannelSettings cs ON c.channel_id = cs.channel_id
    WHERE cs.monetization_enabled = 1;
END;

EXEC GetMonetizedChannels;



CREATE PROCEDURE AvgWatchTime
AS
BEGIN
    SELECT v.title, AVG(vv.watch_time) AS avg_time
    FROM VideoViews vv
    JOIN Videos v ON vv.video_id = v.video_id
    GROUP BY v.title;
END;

EXEC AvgWatchTime;



CREATE PROCEDURE GetVideoAds
AS
BEGIN
    SELECT v.title, a.advertiser_name
    FROM VideoAds va
    JOIN Videos v ON va.video_id = v.video_id
    JOIN Ads a ON va.ad_id = a.ad_id;
END;

EXEC GetVideoAds;



CREATE PROCEDURE UserDashboard
    @user INT
AS
BEGIN
    SELECT 
        u.username,
        COUNT(DISTINCT l.like_id) AS likes,
        COUNT(DISTINCT c.comment_id) AS comments,
        COUNT(DISTINCT wh.history_id) AS watched
    FROM Users u
    LEFT JOIN Likes l ON u.user_id = l.user_id
    LEFT JOIN Comments c ON u.user_id = c.user_id
    LEFT JOIN WatchHistory wh ON u.user_id = wh.user_id
    WHERE u.user_id = @user
    GROUP BY u.username;
END;

EXEC UserDashboard 1;




-- -- BULK INSERT PROCEDURES --

CREATE PROCEDURE BulkInsertUsers
AS
BEGIN
    INSERT INTO Users (user_id, username, email, password_hash, created_at, status)
    VALUES
    (11,'ajay','ajay@gmail.com','h11',GETDATE(),'active'),
    (12,'ravi','ravi@gmail.com','h12',GETDATE(),'active'),
    (13,'kavya','kavya@gmail.com','h13',GETDATE(),'active');
END;

EXEC BulkInsertUsers;




CREATE PROCEDURE BulkInsertVideos
AS
BEGIN
    INSERT INTO Videos
    VALUES
    (211,101,'AI','Intro',500,GETDATE(),'public'),
    (212,101,'ML','Intro ML',600,GETDATE(),'public');
END;


ALTER PROCEDURE BulkInsertVideos
AS
BEGIN
    INSERT INTO Videos (video_id, channel_id, title, description, duration, upload_date, visibility)
    SELECT *
    FROM (
        VALUES
        (211,101,'AI','Intro',500,GETDATE(),'public'),
        (212,101,'ML','Intro ML',600,GETDATE(),'public')
    ) AS v(video_id, channel_id, title, description, duration, upload_date, visibility)
    WHERE NOT EXISTS (
        SELECT 1 FROM Videos t WHERE t.video_id = v.video_id
    );
END;

EXEC BulkInsertVideos;


CREATE PROCEDURE BulkLikeVideo
    @video_id INT
AS
BEGIN
    INSERT INTO Likes (like_id, user_id, video_id, created_at)
    SELECT 
        ROW_NUMBER() OVER (ORDER BY user_id) + 100,
        user_id,
        @video_id,
        GETDATE()
    FROM Users;
END;

EXEC BulkLikeVideo 201;


CREATE PROCEDURE BulkCreatePlaylists
AS
BEGIN
    INSERT INTO Playlists (playlist_id, user_id, title, created_at)
    SELECT user_id+100, user_id, 'MyPlaylist', GETDATE()
    FROM Users;
END;

EXEC BulkCreatePlaylists;


CREATE PROCEDURE GetRevenueSummary
AS
BEGIN
    SELECT v.title, SUM(r.earnings) AS revenue
    FROM Revenue r
    JOIN Videos v ON r.video_id = v.video_id
    GROUP BY v.title;
END;

EXEC GetRevenueSummary;


-- BULK UPDATE PROCEDURES --

CREATE PROCEDURE BulkDeactivateUsers
AS
BEGIN
    UPDATE Users
    SET status = 'inactive'
    WHERE user_id > 8;
END;

EXEC BulkDeactivateUsers;



CREATE PROCEDURE IncreaseSubscribers
AS
BEGIN
    UPDATE Channels
    SET subscribers_count = subscribers_count + 100;
END;

EXEC IncreaseSubscribers;



CREATE PROCEDURE UpdateShortVideosPrivate
AS
BEGIN
    UPDATE Videos
    SET visibility = 'private'
    WHERE duration < 400;
END;

EXEC UpdateShortVideosPrivate;



-- BULK DELETE PROCEDURES --

CREATE PROCEDURE DeleteChannelVideos
    @channel_name VARCHAR(100)
AS
BEGIN
    DELETE v
    FROM Videos v
    JOIN Channels c ON v.channel_id = c.channel_id
    WHERE c.channel_name = @channel_name;
END;

EXEC DeleteChannelVideos 'Test';


CREATE PROCEDURE MergeUser
AS
BEGIN
    MERGE Users AS target
    USING (SELECT 1 AS user_id, 'amith_new' AS username) AS source
    ON target.user_id = source.user_id
    WHEN MATCHED THEN
        UPDATE SET username = source.username
    WHEN NOT MATCHED THEN
        INSERT (user_id, username)
        VALUES (source.user_id, source.username);
END;

EXEC MergeUser;


-- TRIGGERS --

CREATE TRIGGER trg_UpdateLikes
ON Likes
AFTER INSERT
AS
BEGIN
    UPDATE va
    SET likes_count = likes_count + 1
    FROM VideoAnalytics va
    JOIN inserted i ON va.video_id = i.video_id;
END;


CREATE TRIGGER trg_UpdateViews
ON VideoViews
AFTER INSERT
AS
BEGIN
    UPDATE va
    SET total_views = total_views + 1
    FROM VideoAnalytics va
    JOIN inserted i ON va.video_id = i.video_id;
END;


CREATE TRIGGER trg_NoDuplicateSubscription
ON Subscriptions
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Subscriptions s
        JOIN inserted i
        ON s.user_id = i.user_id AND s.channel_id = i.channel_id
    )
    BEGIN
        PRINT 'Already subscribed!';
    END
    ELSE
    BEGIN
        INSERT INTO Subscriptions
        SELECT * FROM inserted;
    END
END;


CREATE TABLE DeletedVideosLog (
    video_id INT,
    title VARCHAR(255),
    deleted_at DATETIME2 DEFAULT GETDATE()
);

CREATE TRIGGER trg_LogDeletedVideos
ON Videos
AFTER DELETE
AS
BEGIN
    INSERT INTO DeletedVideosLog (video_id, title)
    SELECT video_id, title FROM deleted;
END;


-- VIEWS --

CREATE VIEW vw_VideoDetails AS
SELECT v.title, c.channel_name, v.upload_date
FROM Videos v
JOIN Channels c ON v.channel_id = c.channel_id;


CREATE VIEW vw_ChannelSubscribers AS
SELECT c.channel_name, COUNT(s.subscription_id) AS subscribers
FROM Channels c
LEFT JOIN Subscriptions s ON c.channel_id = s.channel_id
GROUP BY c.channel_name;


CREATE VIEW vw_VideoAnalytics AS
SELECT v.title, va.total_views, va.likes_count
FROM Videos v
JOIN VideoAnalytics va ON v.video_id = va.video_id;


CREATE VIEW vw_UserActivity AS
SELECT u.username,
       COUNT(DISTINCT l.like_id) AS likes,
       COUNT(DISTINCT c.comment_id) AS comments
FROM Users u
LEFT JOIN Likes l ON u.user_id = l.user_id
LEFT JOIN Comments c ON u.user_id = c.user_id
GROUP BY u.username;



-- TRANSACTIONS --

CREATE PROCEDURE UploadVideo
    @video_id INT,
    @channel_id INT,
    @title VARCHAR(255)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Videos VALUES (@video_id,@channel_id,@title,'desc',500,GETDATE(),'public');

        INSERT INTO VideoAnalytics VALUES (@video_id,0,0,0);

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error occurred!';
    END CATCH
END;


CREATE PROCEDURE LikeWithTransaction
    @like_id INT,
    @user_id INT,
    @video_id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Likes VALUES (@like_id,@user_id,@video_id,GETDATE());

        UPDATE VideoAnalytics
        SET likes_count = likes_count + 1
        WHERE video_id = @video_id;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
    END CATCH
END;


CREATE PROCEDURE SubscribeSafe
    @id INT,
    @user INT,
    @channel INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        IF NOT EXISTS (
            SELECT 1 FROM Subscriptions
            WHERE user_id = @user AND channel_id = @channel
        )
        BEGIN
            INSERT INTO Subscriptions VALUES (@id,@user,@channel,GETDATE());
        END

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
    END CATCH
END;


CREATE PROCEDURE DeleteVideoSafe
    @video_id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM Likes WHERE video_id = @video_id;
        DELETE FROM Comments WHERE video_id = @video_id;
        DELETE FROM Videos WHERE video_id = @video_id;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
    END CATCH
END;
