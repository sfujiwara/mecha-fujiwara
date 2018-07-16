# Build image
docker build -t mecha-fujiwara .
# Get project ID
PROJECT_ID=`gcloud config list project --format "value(core.project)"`
# Tag image
docker tag mecha-fujiwara gcr.io/${PROJECT_ID}/mecha-fujiwara
# Push to Google Container Registry
gcloud docker -- push gcr.io/${PROJECT_ID}/mecha-fujiwara
# Deploy container image to Compute Engine
gcloud beta compute instances create-with-container hubot \
  --zone=us-central1-c \
  --machine-type=f1-micro \
  --subnet=default \
  --network-tier=PREMIUM \
  --maintenance-policy=MIGRATE \
  --service-account=default \
  --scopes=https://www.googleapis.com/auth/cloud-platform \
  --tags=http-server,https-server \
  --image=cos-stable-67-10575-57-0 \
  --image-project=cos-cloud \
  --boot-disk-size=10GB \
  --boot-disk-type=pd-standard \
  --boot-disk-device-name=hubot \
  --container-image=gcr.io/${PROJECT_ID}/mecha-fujiwara:latest \
  --container-restart-policy=always \
  --container-env-file=.env
