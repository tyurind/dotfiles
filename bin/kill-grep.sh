#!/bin/bash

ps uax | grep $@ | awk '{print $2}' | while read r; do 
    kill -9 $r 2>/dev/null || true
done

