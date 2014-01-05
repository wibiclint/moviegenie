MovieGenie!!!!!!
=================

This application will predict what movies you will like, based on a mysterious genie algorithm
(eventually item-item collaborative filtering, random number generation for now).  Below are
instructions for building and running.


Set up some useful environment variables
----------------------------------------

Set up an environment variable to point to wherever you've checked out this repo:

```bash
export MG_HOME=/Users/clint/cassandra/movie_genie
```



Download the MovieLens dataset
------------------------------

Download the 100k data set from the [MovieLens dataset page](http://grouplens.org/datasets/movielens/).
Unpack the tgz file in `${MG_HOME}/data`.  The files `u.data`, `u.item`, and `u.user` should now exist in `${MG_HOME}/data/ml-100k`.


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
$CASS/bin/cqlsh < ${MG_HOME}/src/main/resources/cql/layout.cql
```


Bulk loading the MovieLens data
-------------------------------

To load the data set into our table, we use the CQL `COPY` command.  For really large data sets, we
might instead want to use the C* [bulk loader](http://www.datastax.com/documentation/cassandra/2.0/webhelp/index.html#cassandra/tools/toolsBulkloader_t.html).

Before loading the MovieLens data, we run it through a script:

```bash
cat ${MG_HOME}/data/ml-100k/u.data | python3 ${MG_HOME}/scripts/pp.py -t 3 > ${MG_HOME}/data/u.data.pp
cat ${MG_HOME}/data/ml-100k/u.item | python3 ${MG_HOME}/scripts/pp_items.py -t 3 > ${MG_HOME}/data/u.item.pp
```

And then we populate all of our tables:

```bash
$CASS/bin/cqlsh < ${MG_HOME}/src/main/resources/cql/import_users.cql
$CASS/bin/cqlsh < ${MG_HOME}/src/main/resources/cql/import_movies.cql
```

How to run:

- Compile: `mvn package`
- Run: `java -jar target/cassandra-simple-app-1.0-SNAPSHOT.jar org.kiji.cassandra.App`
