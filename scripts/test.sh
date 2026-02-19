#!/bin/bash

read -p "Enter the key: " key
read -p "Enter the value: " value

BASE_URL="http://localhost:30080"


echo "Storing value...."
curl -X POST "${BASE_URL}/cache?key=${key}&value=${value}"
echo

echo "Retrieving value..."
curl "${BASE_URL}/cache?key=${key}"
echo

