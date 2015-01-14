echo "DBNAME: "$DBNAME
psql -U zifei -d $DBNAME -f /dfs/rambo/0/zifei/deepsaa/deepsaa-meta-only.sql
