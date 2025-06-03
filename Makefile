hadoop:
	docker buildx build -t hub.hmf.xyz/emr/hadoop:3.3.6 --platform linux/amd64 .
	docker push hub.hmf.xyz/emr/hadoop:3.3.6