# Docker Image for MLflow

[![GitHub license](https://img.shields.io/github/license/cmontemuino/docker-mlflow?color=blue)](https://github.com/cmontemuino/docker-mlflow/blob/master/LICENSE) ![Publish Docker Images](https://github.com/cmontemuino/docker-mlflow/workflows/Publish%20Docker%20Images/badge.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/cmontemuino/mlflow)

This is the Docker Image for [MLflow].

## Image variants

The `mlflow` images come in many flavors, each designed to a specific use case, formatted as `mlflow:<version>-<distro>-<flavor>`:

- `<version>` same version as specified in [MLflow releases](https://github.com/mlflow/mlflow/releases). If you use `1.9`, then you will get the latest version published under `1.9` (e.g., `1.9.1`)
- `<distro>` is the image used as base. Available distributions: `buster`
- `<flavor>` determines what backend is used for metadata and artifacts:
  - `fs`: both metadata and artifacts is stored on the filesystem

## How to use this image

### Run a server with filesystem backend

The most basic example is to run an MLflow server on background with default values. It will store metadata and artifacts under the `/mlruns` folder (inside the running container):

```script
docker run --rm -d cmontemuino/mlflow:1.9-buster-fs
```

If you want to get access to the metadata and artifacts (e.g., to make backups), then you could create a folder (or use an existing one), and mount it into the running container:

```script
mkdir store
docker run --rm -d -v $(pwd)/store:/store -e BACKEND_STORE=/store cmontemuino/mlflow:1.9-buster-fs
```

### Accessing the UI

If you want to access the MLflow UI, then you might want to change the network interface and config the port-forwarding. For example, binding to all interfaces and forward port to 5000:

```script
mkdir store
docker run --rm -d -e NETWORK_INTERFACE=0.0.0.0 -p 5000:5000 cmontemuino/mlflow:1.9-buster-fs
```

## License

[MLflow] is open source and released under the terms of the [Apache License 2.0](https://github.com/mlflow/mlflow/blob/master/LICENSE.txt).

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.

[MLflow]: https://mlflow.org