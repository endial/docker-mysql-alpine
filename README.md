# MySQL(MariaDB) Alpine
基于的 Alpine 系统的 Docker 镜像，用于提供 MySQL 服务。

## 基本信息

* 镜像地址：endial/mysql-alpine
* 依赖镜像：endial/base-alpine

## 数据卷

```
/var/run			# MySQL 运行PID文件，位于子目录 mysql 中
/srv/data			# MySQL 数据文件，位于子目录 mysql 中
/srv/conf			# MySQL 配置文件，位于子目录 mysql 中
```



## 参数说明

```
MYSQL_DATABASE		# 启动时创建新的数据库 
MYSQL_USER			# 新数据库的管理员用户名
MYSQL_PASSWORD		# 新数据库的管理员密码
MYSQL_ROOT_PASSWORD # root 用户密码，如果不提供，系统将随机生成(注意保存生成的随机密码) 
```



## 使用说明

生成并运行一个新的容器：

```
docker run --name mysql \
  -v ./data:/srv/data \
  -e MYSQL_DATABASE=mybase \
  -e MYSQL_USER=dev \
  -e MYSQL_PASSWORD=mysql \
  -e MYSQL_ROOT_PASSWORD=Passw0rd \
  -it -d endial/mysql-alpine
```

如果存在 dvc（endial/dvc-alpine） 数据卷容器：

```
docker run --name mysql \
  --volumes-from dvc \
  -e MYSQL_DATABASE=mybase \
  -e MYSQL_USER=dev \
  -e MYSQL_PASSWORD=mysql \
  -e MYSQL_ROOT_PASSWORD=Passw0rd \
  -it -d endial/mysql-alpine
```

该容器可以不声明外部接口，使用 phpmyadmin 直接访问：

```
docker run --name pma -p 8080:80 --link mysql:db -d endial/phpmyadmin-alpine
```

则可以通过访问 `http://localhost:8080/` 来访问容器。