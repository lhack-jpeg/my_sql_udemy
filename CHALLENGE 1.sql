USE ig_clone;
-- CHALLENGE 1 FINDING 5 OLDEST USERS 
-- SELECT * FROM USERS ORDER BY created_at LIMIT 5;

-- CHALLENGE 2 What day of week do most users register on
-- SELECT 
--     DAYNAME(created_at) AS DAY,
--     COUNT(DAYOFWEEK(created_at)) AS 'COUNT' 
-- FROM users 
-- GROUP BY DAYOFWEEK(created_at) 
-- ORDER BY COUNT DESC;

-- CHALLENGE 3 FInd users that never posted a photo
-- SELECT 
--     username,
--     users.id,
--     photos.user_id 
-- FROM users 
--     LEFT JOIN photos
--         ON users.id = photos.user_id
--         WHERE photos.user_id is NULL;

-- CHALLENGE 4 WHAT IS THE SINGLE MOST LIKED PHOTO
-- SELECT 
--     photo_id,
--     photos.user_id,
--     image_url,
--     username,
--     count(*) AS likes
-- FROM photos 
--     INNER JOIN users 
--         ON photos.user_id = users.id 
--     INNER JOIN likes 
--         ON photos.id = likes.photo_id 
-- GROUP BY photo_id 
-- ORDER BY likes DESC;

-- CHALLENGE 5 HOW MANY TIMES DOES THE AVG USER POST
-- SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS AVG;

-- CHALLNEGE 6 FIND THE 5 MOST COMMON HASHTAGS
-- SELECT 
--     tags.id,
--     tag_name,
--     COUNT(*) AS TOTAL,
--     photo_tags.photo_id 
-- FROM tags 
-- INNER JOIN photo_tags 
--     ON tags.id = photo_tags.tag_id
-- GROUP BY tags.id 
-- ORDER BY TOTAL DESC 
-- LIMIT 5;

-- CHALLENGE 7  FIND THE BOTS ON THE WEBSITE
SELECT 
    likes.user_id,
    username,
    COUNT(*) AS 'AMNT LIKES', 
    IF (COUNT(*)=(SELECT COUNT(*) FROM photos), 'BOT', 'NOT BOT') AS 'STATUS'
FROM likes 
INNER JOIN users
    ON likes.user_id = users.id 
GROUP BY likes.user_id
ORDER BY STATUS;

-- CHALLENGE 7 COLTE SOLUTIOn
SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 