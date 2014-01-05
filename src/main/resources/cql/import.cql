USE movie_genie;

COPY user_info(userid, age, gender, occupation, zip_code) FROM 'data/ml-100k/u.user' WITH DELIMITER = '|';
COPY movie_info(movieid, title) FROM 'data/u.item.pp' WITH DELIMITER = '|';
COPY movie_ratings(userid, itemid, rating, time) FROM 'data/u.data.pp' WITH DELIMITER = '|';
