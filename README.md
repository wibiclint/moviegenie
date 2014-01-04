MovieGenie!!!!!!
=================

This application will predict what movies you will like, based on a mysterious genie algorithm
(eventually item-item collaborative filtering, random number generation for now).  Below are
instructions for building and running.


Download the MovieLens dataset
------------------------------

Download the 100k data set from the [MovieLens dataset page](http://grouplens.org/datasets/movielens/).


Download and install Cassandra
------------------------------

- Download the [latest C* build](http://cassandra.apache.org/download/).
- Unpack the contents of the tgz file and put it wherever you would like.
- Update the `conf/cassandra.yaml` file appropriately.
    - You'll probably at least want to set up the target directories for data, commit logs, etc.
      appropriately, as described [here](http://wiki.apache.org/cassandra/GettingStarted).
    - Update the cluster name to "MovieGenie Cluster"
- Fire up C*!  (You should be able to just run `<path to C* install>/bin/cassandra -f`)

You'll also likely want to set up some kind of environment variable that points to your C* install.
Below we assume that you've done something along the lines of the following:
```bash
export CASS='/Users/clint/cassandra/apache-cassandra-2.0.4'
```


Create the Keyspace and define the table layouts
------------------------------------------------

The CQL file in `src/main/resources/cql/layout.cql` contains commands to create the MovieGenie
keyspace and create the table (column family) layouts.  Execute the following command:

```bash
$CASS/bin/cqlsh < src/main/resources/cql/movie_genie.cql
```

How to run:

- Compile: `mvn package`
- Run: `java -jar target/cassandra-simple-app-1.0-SNAPSHOT.jar org.kiji.cassandra.App`
