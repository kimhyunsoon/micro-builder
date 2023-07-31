![image](https://github.com/kimhyunsoon/micro-builder/assets/60641694/53ca8710-58da-4b68-9077-a52970b87f61)

Docker Stack with Nginx as a Reverse Proxy** Server and TypeScript Node for Socket.IO and RESTful API and.


**This repository includes only Nginx and the builder.:**  
[MICRO-API is here.](https://github.com/kimhyunsoon/micro-api)  

# Directory Structure
```
nfs
└──micro-file
   └──uploads
└──micro-nginx
   └──htdocs
      │  "The frontend build artifacts are here."
   └──config
      │  nginx.conf
      │  default.conf
└──micro-api
   └──config
      │  config.json

workspace
│  "Please clone the git repository here."
```

# How to Apply
0. Please create the [Directory Structure](#directory-structure)
1. Git clone [micro-builder](https://github.com/kimhyunsoon/micro-builder) in `workspace`
2. Git clone [micro-api](https://github.com/kimhyunsoon/micro-api) in `workspace/micro-api`
3. Write `docker-compose.yml`:  
   Refer to [docker-compose.yml.sample](https://github.com/kimhyunsoon/micro-builder/blob/main/docker-compose.yml.sample)
4. Write `nginx.conf` and `default.conf` in `nfs/micro-nginx/config/`:  
   Refer to [nginx.conf.sample](https://github.com/kimhyunsoon/micro-builder/blob/main/nginx.conf.sample) and [default.conf.sample](https://github.com/kimhyunsoon/micro-builder/blob/main/default.conf.sample))
5. Write `config.json` in `nfs/micro-api/config/`:  
   Refer to [config.json.sample](https://github.com/kimhyunsoon/micro-api/config.json.sample)
6. Build `micro-api` and `micro-nginx`
   ```
   bash micro-api/build.sh
   bash micro-nginx/build.sh
   ```
7. Deploy Docker Swarn
   ```
   bash deploy.sh
   ```
