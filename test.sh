#!/bin/bash
data=$(cat nodelist.txt)

rm -rf result.log

for url in $data; do
  if [[ $url == https://raw.githubusercontent.com* ]]; then
    echo "$url" >>result.log
  else
    code=$(curl -o /dev/null -k -s -w %{http_code} $url)
    if [ "000" != "$code" ]; then
      echo "$url" >>result.log
    fi
  fi
done
