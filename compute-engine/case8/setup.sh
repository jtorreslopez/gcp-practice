gsutil mb gs://spatial-thinker-285016-mysqldata
gsutil cp data.sql gs://spatial-thinker-285016-mysqldata

gcloud sql instances create mysql-1 --zone=us-west1-a --tier=db-n1-standard-1 --assign-ip --authorized-networks=default --database-version=MYSQL_5_6 --root-password=$MYSQL_ROOT_PASSWORD

gcloud sql import sql mysql-1 gs://spatial-thinker-285016-mysqldata/data.sql --database=mydb

p674056837516-of74ee@gcp-sa-cloud-sql.iam.gserviceaccount.com
