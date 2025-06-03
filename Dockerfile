FROM hub.hmf.xyz/base/hmf-centos:8

RUN mkdir -p /etc/yum.repos.d/backup && \
    mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/backup/ && \
    curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-8.repo && \
    yum makecache && \
    yum install -y \
        sudo \
        python2-pip \
        wget \
        nmap-ncat \
        jq \
        java-1.8.0-openjdk

ADD ./hadoop-dist/target/hadoop-3.3.6.tar.gz /opt/
RUN ln -s /opt/hadoop-3.3.6 /opt/hadoop

WORKDIR /opt/hadoop

RUN groupadd --gid 1000 hadoop && \
    useradd --uid 1000 hadoop --gid 1000 --home /opt/hadoop && \
    useradd --shell /bin/bash -M -r -N --groups hadoop hdfs && \
    useradd --shell /bin/bash -M -r -N --groups hadoop yarn && \
    useradd --shell /bin/bash -M -r -N --groups hadoop mapred && \
    echo "hadoop ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER root

ENV JAVA_HOME=/usr/lib/jvm/jre/
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/hadoop/bin
ENV HADOOP_HOME=/opt/hadoop