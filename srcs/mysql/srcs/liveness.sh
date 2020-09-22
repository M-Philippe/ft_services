if [ $(netstat -a | grep mysql | wc -l) -ge 1 ]; then
        echo "OK"
else
        exit 1
fi
