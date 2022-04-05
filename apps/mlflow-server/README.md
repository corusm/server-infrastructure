# docker-mlflow-server

# Create S3 Bucket
- Login in Webconsole of `minio`
- Create bucket named `mlflow`
- Make it public in the settings

# Update
For update change version in `Dockerfile`

# Rebuild Model
```bash
sudo docker-compose build
```

All MLFlow Docker Docs in Mouselogger-API Repo