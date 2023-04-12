CREATE TABLE users(userid INT NOT NULL, name TEXT NOT NULL, PRIMARY KEY(userid));

CREATE TABLE movies(movieid INT NOT NULL, title TEXT NOT NULL, PRIMARY KEY(movieid));

CREATE TABLE taginfo(tagid INT NOT NULL, content TEXT NOT NULL, PRIMARY KEY(tagid));

CREATE TABLE genres(genreid INT NOT NULL, name TEXT NOT NULL, PRIMARY KEY(genreid));

CREATE TABLE ratings(userid INT NOT NULL, movieid INT NOT NULL, rating NUMERIC(2,1) NOT NULL, timestamp BIGINT NOT NULL,
CHECK (rating>=0 AND rating<=5),PRIMARY KEY(userid,movieid),
FOREIGN KEY(userid) REFERENCES users(userid), 
FOREIGN KEY (movieid) REFERENCES movies(movieid));

CREATE TABlE tags(userid INT NOT NULL, movieid INT NOT NULL, tagid INT NOT NULL, timestamp BIGINT NOT NULL,
PRIMARY KEY(userid, movieid, tagid), 
FOREIGN KEY(userid) REFERENCES users(userid), 
FOREIGN KEY (movieid) REFERENCES movies(movieid), 
FOREIGN KEY (tagid) REFERENCES taginfo(tagid));

CREATE TABLE hasagenre(movieid INT NOT NULL, genreid INT NOT NULL, 
PRIMARY KEY(movieid, genreid),
FOREIGN KEY (movieid) REFERENCES movies(movieid),
FOREIGN KEY (genreid) REFERENCES genres(genreid));