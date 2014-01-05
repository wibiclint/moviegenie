// CQL code to generate table layouts for a movie-ratings application.

//--------------------------------------------------------------------------------------------------
// Generate keyspace for all user information
CREATE KEYSPACE IF NOT EXISTS movie_genie
  WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1 };

USE movie_genie;

// Column family containing all of the movie reviews for a given user.
CREATE TABLE IF NOT EXISTS movie_ratings (
  userid bigint,
  itemid bigint,
  rating int,
  time timestamp,
  // We use timestamp as part of a composite key here so that we can select
  // user reviews by time if necessary
  PRIMARY KEY (userid, time)
);

// Column family with additional information about the user
CREATE TABLE IF NOT EXISTS user_info (
  userid bigint,
  age int,
  gender text,
  occupation text,
  zip_code text,
  PRIMARY KEY (userid)
);

// Meta data about movies
CREATE TABLE IF NOT EXISTS movie_info (
  movieid bigint,
  title text,
  // Let's skip all of the other information for now...
  PRIMARY KEY (movieid)
);

/*

// CQL code to generate table layouts for a movie-ratings application.

//--------------------------------------------------------------------------------------------------
// Generate keyspace for all user information
CREATE KEYSPACE IF NOT EXISTS movie_genie_users
  WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1 };

USE movie_genie_users;

//DROP TABLE movie_ratings;
//DROP TABLE user_info;

// Column family containing all of the movie reviews for a given user.
CREATE TABLE IF NOT EXISTS movie_ratings (
  userid bigint,
  itemid bigint,
  rating int,
  time timestamp,
  // We use timestamp as part of a composite key here so that we can select
  // user reviews by time if necessary
  PRIMARY KEY (userid, time)
);

// Column family with additional information about the user
CREATE TABLE IF NOT EXISTS user_info (
  userid bigint,
  age int,
  gender text,
  occupation text,
  zip_code text,
  PRIMARY KEY (userid)
);

//--------------------------------------------------------------------------------------------------
// Generate keyspace for all user information
CREATE KEYSPACE IF NOT EXISTS movie_genie_movies
  WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1 };

USE movie_genie_movies;

// Meta data about movies
CREATE TABLE IF NOT EXISTS movie_info (
  movieid bigint,
  title text,
  // Let's skip all of the other information for now...
  PRIMARY KEY (movieid)
);
*/
