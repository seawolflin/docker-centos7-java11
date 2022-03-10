FROM centos:7


COPY jdk-11.0.11_linux-x64_bin.tar.gz /usr/jdk/

RUN yum install -y dejavu-sans-fonts fontconfig kde-l10n-Chinese \
    && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 \
    && cd /usr/jdk \
    && tar -vxf /usr/jdk/jdk-11.0.11_linux-x64_bin.tar.gz \
    && rm -rf jdk-11.0.11_linux-x64_bin.tar.gz \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone

ENV JAVA_HOME=/usr/jdk/jdk-11.0.11
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH=$JAVA_HOME/bin:$PATH
ENV LC_ALL zh_CN.utf8

CMD [ "bash" ]
