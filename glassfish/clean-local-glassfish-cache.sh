#!/bin/bash
GLASSFISH_DIR=/usr/lib/jvm/glassfish4
export TERM="xterm-256color"


for domain in $GLASSFISH_DIR/glassfish/domains/*;
    do
        $GLASSFISH_DIR/bin/asadmin stop-domain $(basename $domain)
        rm -rf $domain/applications/*
        rm -rf $domain/osgi-cache/*
        rm -rf $domain/generated/*
        echo $(tput setaf 9) "Deleted "$(basename $domain)" cache files"
    done

echo $(tput setaf 10)"Glassfish local cache cleaned"
exit 0