#!/bin/sh
#
#  Taginfo Master DB
#
#  update.sh DIR
#

set -e

DIR=$1

DATECMD='date +%Y-%m-%dT%H:%M:%S'

if [ "x" = "x$DIR" ]; then
    echo "Usage: update.sh DIR"
    exit 1
fi

echo "`$DATECMD` Start master..."

DATABASE=$DIR/taginfo-master.db

rm -f $DATABASE

sqlite3 $DATABASE <languages.sql
perl -pe "s|__DIR__|$DIR|" master.sql | sqlite3 $DATABASE

echo "`$DATECMD` Done master."

