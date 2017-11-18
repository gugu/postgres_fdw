FROM postgres:10
RUN apt-get update && apt-get install --no-install-recommends -y mysql-client wget unzip make gcc postgresql-server-dev-10 libmysql++-dev ca-certificates && \
    wget https://github.com/EnterpriseDB/mysql_fdw/archive/master.zip -O /opt/mysql_fdw.zip && \
    cd /opt && unzip mysql_fdw && \
    cd /opt/mysql_fdw-master && make USE_PGXS=1 && make install USE_PGXS=1 && \
    apt-get remove -y wget unzip make gcc postgresql-server-dev-10 libmysql++-dev && \
    rm -rf /var/lib/apt/lists/*
