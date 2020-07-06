FROM python:3.8-slim

# add a user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN set -eux; \
    groupadd -r -g 999 mlflow; \
    useradd -r -g mlflow -u 999 mlflow

# https://github.com/mlflow/mlflow/releases
ENV MLFLOW_VERSION_MAJOR 1.9
ENV MLFLOW_VERSION 1.9.1

# Note: mlflow[extras] includes scikit-learn
RUN set -eux; \
    pip --no-cache-dir install mlflow[extras]=="$MLFLOW_VERSION"; \
    /bin/rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /root/.cache/; \
    mlflow --version

# Default location where MLflow stores data locally
ENV BACKEND_STORE mlruns

RUN mkdir /mlruns; \
    chown mlflow:mlflow /mlruns

# Networking options to expose the service. For example, 0.0.0.0 exposes to all interfaces
ENV NETWORK_INTERFACE 127.0.0.1

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 5000

USER mlflow

CMD ["mlflow", "server"]
