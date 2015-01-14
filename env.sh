#! /bin/bash -e

# Machine Configuration
export MEMORY="64g"
#export MEMORY="2g"

export PARALLELISM=4
#export PARALLELISM=4

# Database Configuration
# psql -d cs341 -U dbritz -h localhost -p 5433
# export DBNAME="deepsaa_toy_3b"
# export DBNAME="deepsaa_real"
# export DBNAME="deepsaa"  # this currently contains toy 6.
export DBNAME="deepsaa_real_8"
if [ $# = 1 ]; then
  export DBNAME=$1
fi

echo "#######################"
echo "Set DBNAME to $DBNAME."
echo "#######################"
export PGUSER=zifei
# ${PGUSER:-`whoami`}
export PGPASSWORD=${PGPASSWORD:-}
# export PGPORT=5432
# export PGHOST=rocky
export PGHOST=rambo
export PGPORT=5433
# SBT Options
export SBT_OPTS="-Xmx$MEMORY"

export ARXIV_DIR=/dfs/madmax/0/dbritz/arxiv/pdf/