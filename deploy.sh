#!/bin/bash

# 현재 디렉토리의 폴더(서비스)들을 배열에 저장
readarray -t services < <(find . -maxdepth 1 -type d \
                            ! -name "." \
                            ! -name ".." \
                            ! -name ".git" \
                            -printf "%P\n")

for service in "${services[@]}"; do
  # .version 파일이 있을 때에만 진행
  if [ -e "./${service}.version" ]; then
    version=$(cat ./${service}.version)
    # docker-compose의 image버전 최신화
    sed -i "s/${service}:[^ ]*/${service}:v${version}/g" "./docker-compose.yml"
  else
    # .version 파일이 없을 경우 latest
    sed -i "s/${service}:[^ ]*/${service}:latest/g" "./docker-compose.yml"
  fi
done

# 최신화한 버전으로 deploy
docker stack deploy --with-registry-auth --compose-file docker-compose.yml micro

# deploy 후 docker-compose.yml 원복 (git 추적방지용)
sleep 10
sed -E -i 's/:v[0-9]+(\.[0-9])?/:latest/g' "./docker-compose.yml"