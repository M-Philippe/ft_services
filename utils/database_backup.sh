#! /bin/bash

while [ true ]
do
sleep 60
    echo $(date) >> ./utils/backup_log
    container_name=$(sudo kubectl get pods -o name | grep "mysql") > /dev/null
    sudo kubectl exec $container_name -- ps | grep "mysql" > /dev/null
    if [ $? == 0 ]
    then
        sudo kubectl exec $container_name -- sh entrypoint.sh save >> ./utils/backup_log
        printf "Mysql backup done\n____________________\n\n" >> ./utils/backup_log
    else
        printf "Mysql is not running\n___________________\n\n" >> ./utils/backup_log
        sudo kubectl exec $container_name -- ps | grep "mysql" > /dev/null
        while [ $? != 0 ]
        do
            sleep 10
            sudo kubectl exec $container_name -- ps | grep "mysql" > /dev/null
        done
    fi
    container_name=$(sudo kubectl get pods -o name | grep "influxdb") > /dev/null
    sudo kubectl exec $container_name -- ps | grep "influx" > /dev/null
    if [ $? == 0 ]
    then
        sudo kubectl exec $container_name -- sh entrypoint.sh save >> ./utils/backup_log
        printf "Influxdb backup done\n____________________\n\n" >> ./utils/backup_log
    else
        printf "Influx is not running\n_____________________\n\n" >> ./utils/backup_log
        sleep 30
        sudo kubectl exec $container_name -- ps | grep "influx" > /dev/null
        while [ $? != 0 ]
        do
            sleep 10
            sudo kubectl exec $container_name -- ps | grep "influx" > /dev/null
        done
    fi
done