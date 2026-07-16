FROM mysql:8.0

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./custom.cnf /etc/mysql/conf.d/custom.cnf
EXPOSE 3306
