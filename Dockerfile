FROM centos:6.7
MAINTAINER dbaskette@pivotal.io

COPY greenplum-loaders-4.3.8.1-build-1-RHEL5-x86_64.zip /tmp/greenplum-loaders-4.3.8.1-build-1-RHEL5-x86_64.zip
WORKDIR /tmp
RUN yum install -y unzip tar util-linux-ng which\ 
    && unzip ./greenplum-loaders-4.3.8.1-build-1-RHEL5-x86_64.zip -d /tmp \
    && sed -i s/"more << EOF"/"cat << EOF"/g ./greenplum-loaders-4.3.8.1-build-1-RHEL5-x86_64.bin  \
    && echo -e "yes\n\nyes\nyes\n" | ./greenplum-loaders-4.3.8.1-build-1-RHEL5-x86_64.bin  

EXPOSE 8082
CMD  source /usr/local/greenplum-loaders-4.3.8.1-build-1/greenplum_loaders_path.sh;gpfdist -d /gpfdist-data -p 8082 > /tmp/gpfdist.log 2>&1 

