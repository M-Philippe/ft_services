if [[ "$1" == "save" ]]
then
    rm /database/*
    /influxdb-1.8.1-1/influxd backup -portable -database influx_db_telegraf /database
else
    ./influxdb-1.8.1-1/influxd &
    ./loading_database.sh
    while [ true ]
    do true = true
    done
fi