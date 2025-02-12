### Docker build command using the artifact registry tags

Note the use of:
1. ``me-central`` - this is the region where the repository is located
1. ``inft-3611`` - this is the project ID
1. ``inft-3611-dev-sec-ops`` - this is the repo name
1. ``nginx-$USER`` - this is the name of the image you will be pushing

```docker build . -t me-central1-docker.pkg.dev/inft-3611/inft-3611-dev-sec-ops/nginx-$USER```

### Running the nginx docker in the GCP shell
 ```docker run -d -p8080:80 me-central1-docker.pkg.dev/inft-3611/inft-3611-dev-sec-ops/nginx-$USER```
Note the use of:
1. ``-d`` - this means the docker image runs in daemon mode
2. ``-p8080:80`` - this maps the port of the nginx container from the default port 80 to the GCP port 8080

### Pushing the image to GCP artifact registry command

```docker push me-central1-docker.pkg.dev/inft-3611/inft-3611-dev-sec-ops/nginx-$USER```

This should result in the image ``nginx-$USER`` being stored in the location as described above

