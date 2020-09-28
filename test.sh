#!/bin/bash

echo "This is parent test.sh!"
echo ""

echo "This is parent test.sh!" > /tmp/output
echo "" >> /tmp/output

source ./function_test.sh
