### 적용방법
1. nfs/micro-nginx/config에 nginx.conf, default.conf 파일 추가
2. docker-compose.yml의 $PORT, $DIR 수정
3. micro-api 추가
4. nfs/micro-api/config/config.json 추가, nfs/micro-nginx/htdocs 추가, nfs/micro-file 추가
5. nginx, api 각각 build.sh 실행 후 deploy.sh (컨테이너마다 버전관리가 필요할 경우 컨테이너명.version 파일 생성)
