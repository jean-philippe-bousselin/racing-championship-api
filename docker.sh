
# start mariadb container
if [[ "$(docker ps -a | grep my-mariadb | wc -l)" > 0 ]]; then
  docker start my-mariadb
else
  docker run --name my-mariadb -e MYSQL_ROOT_PASSWORD=passwd -d mariadb:10.1
fi

# start app container
docker build -t rcm_api .
docker rm rcm_api_running
docker run -it --link my-mariadb:mysql --name="rcm_api_running" -p 80:80 -v $(pwd)/src:/var/www rcm_api

# Delete all containers
# docker rm $(docker ps -a -q)
# Delete all images
# docker rmi $(docker images -q)

# available env variables from mariadb container
#
# PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# HOSTNAME=4fee3be1fde7
# MYSQL_PORT=tcp://172.17.0.2:3306
# MYSQL_PORT_3306_TCP=tcp://172.17.0.2:3306
# MYSQL_PORT_3306_TCP_ADDR=172.17.0.2
# MYSQL_PORT_3306_TCP_PORT=3306
# MYSQL_PORT_3306_TCP_PROTO=tcp
# MYSQL_NAME=/rcm_api_running/mysql
# MYSQL_ENV_MYSQL_ROOT_PASSWORD=passwd
# MYSQL_ENV_GOSU_VERSION=1.7
# MYSQL_ENV_MARIADB_MAJOR=10.1
# MYSQL_ENV_MARIADB_VERSION=10.1.19+maria-1~jessie
# HOME=/root
