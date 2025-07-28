REGION="eu-central-1"
ACCOUNT_ID="1111111111"
REPO_NAME="flask-lucky-app"
TAG="latest"


docker build -t ${REPO_NAME}:${TAG} .

aws ecr get-login-password --region $REGION | \
docker login --username AWS --password-stdin ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com

docker tag ${REPO_NAME}:${TAG} ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${REPO_NAME}:${TAG}

docker push ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${REPO_NAME}:${TAG}
