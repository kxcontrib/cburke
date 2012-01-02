
This directory has scripts to export historical databases created with 
cburke/start/buildhdb.q into SQLite and MySQL. The exports are via csv files.
When running the export, expect timings of up to a minute per month's data.

SQLite is usually considered the fastest standard SQL database, so is useful
for benchmarking kdb+ against traditional SQL. However, it has a maximum
database size of 2TB, so would be unsuitable for production market databases.
MySQL is slower but can accommodate much larger databases.

Start by building a small hdb, say for 20 days.

mysql
-----
Open the mysql.q script and update the initial definitions as required
for your machine.

Ensure the required user, password and database are defined in mysql.
Remove any tables defined in the target database.

In q, load the hdb and the mysql.q script, then:
runexport[]           / exports the database

Then try the examples in mysqldemo.q.

sqlite
------
Open the sqlite.q script and update the initial definitions as required
for your machine.

Remove any existing database with the target name.

In q, load the hdb and the sqlite.q script, then:
runexport[]           / exports the database
makeindex[]           / makes indexes on the large tables

Then try the examples in sqlitedemo.q.
