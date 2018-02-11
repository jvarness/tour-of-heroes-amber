FROM amberframework/amber:latest

WORKDIR /app

COPY shard.* /app/
RUN crystal deps

ADD . /app

CMD amber watch
