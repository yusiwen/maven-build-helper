#!/bin/bash

JAVA=$(which java)

JMX_OPTS=
if [ "$JMXREMOTE_ENABLED" = true ]; then
  JMX_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.host=eth0 -Dcom.sun.management.jmxremote.port=${JMXREMOTE_PORT} -Dcom.sun.management.jmxremote.rmi.port=${JMXREMOTE_PORT} -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=127.0.0.1"
fi

REMOTE_DEBUG_OPTS=
if [ "$REMOTE_DEBUG_ENABLED" = true ]; then
  REMOTE_DEBUG_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=${REMOTE_DEBUG_PORT}"
fi

SW_OPTS=
if [ "$SW_ENABLED" = true ]; then
  SW_OPTS="-javaagent:/skywalking/agent/skywalking-agent.jar"
fi

OPTS="$JMX_OPTS $REMOTE_DEBUG_OPTS $SW_OPTS $JAVA_OPTS"

$JAVA \
  -Dspring.profiles.active="${PROFILE}" \
  -Dlogging.file.name="${LOG_FILE}" \
  -Dlogging.file.max-size="${LOG_FILE_MAX_SIZE}" \
  -Dlogging.file.max-history="${LOG_FILE_MAX_HISTORY}" \
  -Dserver.port="${PORT}" \
  -Dnacos_host="${NACOS_HOST}" \
  "${OPTS}" \
  -jar /app/app.jar
