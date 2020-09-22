if [[ "$1" == "save" ]]
then
    mv ./database/wordpress.sql ./database/back_wordpress.sql
    mysqldump -u root -proot --databases wordpress > ./database/wordpress.sql
else
    mysqld --user=root --datadir=./data & ./loading_database.sh
    while [ true ]
    do true = true
    done
fi