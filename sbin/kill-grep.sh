#!/bin/bash

ps uax | grep $* | awk '{print $2}' | while read r; do kill -9 $r >/dev/null 2>&1 || true; done
