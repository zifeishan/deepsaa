export APP_HOME=`cd $(dirname $0)../; pwd`
. env.sh

psql -c """
    DROP TABLE IF EXISTS supervised_author_names CASCADE;
    CREATE TABLE supervised_author_names(id bigint, name text);
    COPY  supervised_author_names(name)
    FROM  STDIN;
""" $DBNAME <$APP_HOME/data/stanford-faculty-list.txt