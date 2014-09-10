#!/bin/bash
set -e

DIR=$( cd $( dirname "${BASH_SOURCE[0]}" ) && pwd )

echo $DIR

php -r 'print_r($_SERVER); echo __FILE__;'
