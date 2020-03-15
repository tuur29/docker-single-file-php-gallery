#!/bin/bash

# setup variables

if [ "$SECURITY_PHRASE" = "" ]; then
    SECURITY_PHRASE=$(openssl rand -base64 32)
fi
sed -ri -e "s|'SECURITY_PHRASE', ''|'SECURITY_PHRASE', '${SECURITY_PHRASE}'|g" ./index.php

if [ "$PASSWORD" != "" ]; then
    sed -ri -e "s|'PASSWORD', ''|'PASSWORD', '${PASSWORD}'|g" ./index.php
fi

if [ "$ADMIN" != "" ]; then
    sed -ri -e "s|'ADMIN', FALSE|'ADMIN', ${ADMIN}|g" ./index.php
fi

# start server
apache2-foreground
