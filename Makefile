PROJECT=apprunner-errorenv
REGION=ap-northeast-1
ACCOUNT=853641575541

login::
	aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin https://${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com

build::
	docker build -t ${PROJECT} .
	docker tag ${PROJECT}:latest ${ACCOUNT}.dkr.ecr.ap-northeast-1.amazonaws.com/${PROJECT}:latest

run: build
	docker run -p 8000:3000 ${PROJECT}:latest

push::
	docker push ${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/${PROJECT}:latest
