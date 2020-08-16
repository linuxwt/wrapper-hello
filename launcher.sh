#!/bin/sh -e
app="hello"
pid=`ps aux | grep $app | grep -v grep| sed -n '1P' | awk '{print $1}' `

usage(){
    echo "Usage: ./launcher start|stop"
    exit 1
}

cd ./monolith/

start(){
    if [ -z $pid ];then
        ./hello &
        echo "`date '+%Y/%m/%d %H:%M:%S'` $app has been started."
    else
        echo "`date '+%Y/%m/%d %H:%M:%S'` $app is running."
    fi
}

stop(){
    if [ $pid ];then
        kill $pid
        echo "`date '+%Y/%m/%d %H:%M:%S'` $app has been stopped."
    fi
}

case "$1" in
    "start") start ;;
    "stop") stop ;;
    *) usage;;
esac