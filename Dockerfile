FROM nicolaka/netshoot as builder
WORKDIR /build

COPY target/demo-server.jar demo-server.jar
COPY tools/run.sh run.sh
RUN curl -v --upload-file demo-server.jar http://h-ds.j3east.ltd:5088/repository/temp/demo-server/demo-server.jar && rm demo-server.jar && chmod +x run.sh

FROM alpine:3.11
LABEL maintainer="jclazz@outlook.com"
ENV TZ=Asia/Shanghai
COPY --from=builder /build/run.sh /demo-server/run.sh
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

EXPOSE 8080

CMD ["/demo-server/run.sh"]