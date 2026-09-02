RANGER_VERSION=2.4.0
HADOOP_VERSION=3.3.6
HADOOP_TAG=3.3.6.3

emr-hdfs:
	docker buildx build \
		--build-arg HADOOP_VERSION=${HADOOP_VERSION} \
        --build-arg RANGER_VERSION=${RANGER_VERSION} \
		-t hub.hmf.xyz/emr/hdfs:${HADOOP_TAG} \
		--platform linux/amd64 \
		-f Dockerfile.emr-hdfs .
	docker push hub.hmf.xyz/emr/hdfs:${HADOOP_TAG}

emr-hdfs-kerberos:
	docker buildx build \
		--build-arg HADOOP_VERSION=${HADOOP_VERSION} \
        --build-arg RANGER_VERSION=${RANGER_VERSION} \
		-t hub.hmf.xyz/emr/hdfs-kerberos:${HADOOP_TAG} \
		--platform linux/amd64 \
		-f Dockerfile.emr-hdfs-kerberos .
	docker push hub.hmf.xyz/emr/hdfs-kerberos:${HADOOP_TAG}

emr-yarn:
	docker buildx build \
		--build-arg HADOOP_VERSION=${HADOOP_VERSION} \
        --build-arg RANGER_VERSION=${RANGER_VERSION} \
		-t hub.hmf.xyz/emr/yarn:${HADOOP_TAG} \
		--platform linux/amd64 \
		-f Dockerfile.emr-yarn .
	docker push hub.hmf.xyz/emr/yarn:${HADOOP_TAG}

emr-yarn-kerberos:
	docker buildx build \
		--build-arg HADOOP_VERSION=${HADOOP_VERSION} \
        --build-arg RANGER_VERSION=${RANGER_VERSION} \
		-t hub.hmf.xyz/emr/yarn-kerberos:${HADOOP_TAG} \
		--platform linux/amd64 \
		-f Dockerfile.emr-yarn-kerberos .
	docker push hub.hmf.xyz/emr/yarn-kerberos:${HADOOP_TAG}
