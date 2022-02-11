FROM centos:7


COPY jdk-11.0.11_linux-x64_bin.tar.gz /usr/jdk/

RUN cd /usr/jdk \
    && tar -vxzf /usr/jdk/jdk-11.0.11_linux-x64_bin.tar.gz \
    && rm -rf jdk-11.0.11_linux-x64_bin.tar.gz \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone

ENV JAVA_HOME=/usr/jdk/jdk-11.0.11
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH=$JAVA_HOME/bin:$PATH

CMD [ "bash" ]
