#!/bin/sh
LOCAL_JAR=demo-server.jar
REMOTE_JAR=http://h-ds.j3east.ltd:5088/repository/temp/demo-server/demo-server.jar

if type -p java; then
    echo "Found Java executable in PATH"
    _java=java
elif [[ -n $JAVA_HOME ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
    echo "Found Java executable in JAVA_HOME"
    _java="$JAVA_HOME/bin/java"
else
    echo "no JRE found"
    apk --no-cache add openjdk11-jre=11.0.5_p10-r0
    _java=java
fi


if [ -f "$LOCAL_JAR" ]; then
    echo "$LOCAL_JAR exists."
else
    echo "$LOCAL_JAR does not exist."
    apk --no-cache add curl && curl -o $LOCAL_JAR $REMOTE_JAR
fi

$_java -jar $LOCAL_JAR