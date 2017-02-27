# Deploy hubot on Google Compute Engine
PROJECT_ID=`gcloud config list project --format "value(core.project)"`
INSTANCE_NAME="mecha-fujiwara"
# Create Compute Engine instance
gcloud compute --project ${PROJECT_ID} instances create ${INSTANCE_NAME} \
  --zone "us-central1-b" \
  --machine-type "f1-micro" \
  --network "default" \
  --maintenance-policy "MIGRATE" \
  --scopes default="https://www.googleapis.com/auth/cloud-platform" \
  --tags "http-server","https-server" \
  --boot-disk-size "10" \
  --boot-disk-type "pd-standard" \
  --boot-disk-device-name ${INSTANCE_NAME} \
  --metadata-from-file startup-script=startup.sh
