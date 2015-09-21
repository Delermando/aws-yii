run:
	docker run -d --name db -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 mysql:5.5;
	docker run -d --name php --link db:mysql -p 80:80 -v `pwd`:/var/www/html -v `pwd`/vhosts:/etc/apache2/vhosts 446433907ae6;
	
	
runPhp:
		docker run -d --name php --link db:mysql -p 80:80 -v `pwd`:/var/www/html -v `pwd`/vhosts:/etc/apache2/vhosts rtancman/php:php53-apache22;

runMysql:
	docker run -d --name wordpressdb mysql:5.5;

rm:
	docker rm `docker ps -a -q`;

kill:
	docker kill `docker ps -a -q`

restart:
	docker restart db php;

mysqlIp:
	docker exec -it php env | grep MYSQL_PORT_3306_TCP_ADDR |sed 's,MYSQL_PORT_3306_TCP_ADDR=,,'

status:
	docker ps -a;

connectMySql:
	docker exec -it db bash;

connectPhp:
	docker exec -it php bash;