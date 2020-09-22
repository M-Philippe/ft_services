if [ $(netstat -a | grep http | wc -l) -ge 1 ]; then
        echo "OK"
else
        exit 1
fi

if [ $(netstat -a | grep https | wc -l) -ge 1 ]; then
        echo "OK"
else
        exit 1
fi

if [ $(netstat -a | grep ssh | wc -l) -ge 1 ]; then
        echo "OK"
else
        exit 1
fi

