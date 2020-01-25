#!/bin/sh



tar -cf home.tar ~/.locale ~/.config ~/.ssh  $(find ~  -maxdepth 1 -type f -name '.*')
