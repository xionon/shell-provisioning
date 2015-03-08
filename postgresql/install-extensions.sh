#!/usr/bin/env bash
set -e

echo "======INSTALLING POSTGRESQL EXTENSIONS"
if ! psql book -c '\dx' | grep -q cube
then
  psql book -c "CREATE EXTENSION tablefunc;"
  psql book -c "CREATE EXTENSION dict_xsyn;"
  psql book -c "CREATE EXTENSION fuzzystrmatch;"
  psql book -c "CREATE EXTENSION pg_trgm;"
  psql book -c "CREATE EXTENSION cube;"
else
  echo "...skipping"
fi
