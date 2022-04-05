# TO BUILD RUN: sudo docker build -t corusm/mlflow_server .

FROM python:3-slim
LABEL maintainer="Niklas Leinz <niklas@corusm.de>"
ARG MLFLOW_VERSION=1.23.1

WORKDIR /mlflow/
RUN pip install --no-cache-dir mlflow==$MLFLOW_VERSION
RUN pip install boto3 pymysql
EXPOSE 5000

ENV BACKEND_URI sqlite:////mlflow/mlflow.db
ENV ARTIFACT_ROOT /mlflow/artifacts
ENV PROM_DIR /mlflow/prometheus

CMD mlflow server --backend-store-uri ${BACKEND_URI} --default-artifact-root ${ARTIFACT_ROOT} --host 0.0.0.0 --port 5000 --expose-prometheus ${PROM_DIR}