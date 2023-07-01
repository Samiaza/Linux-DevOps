#!/bin/bash

URLS=("google.com" "ya.ru" "yandex.ru" "yuotube.ru" "vk.com" "gitlab.com" \
        "facebook.com" "porhub.com" "github.com" "21-school.ru" "intel.com")

echo ${URLS[(($RANDOM % ${#URLS[@]}))]}