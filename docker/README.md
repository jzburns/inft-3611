### Docker build command

Note the use of: 

1. ``me-central`` - this is the region where the repository is located
1. ``inft-3611`` - this is the project ID
1. ``inft-3611-dev-sec-ops`` - this is the repo name
1. ``nginx-$USER`` - this is the name of the image you will be pushing


```docker build . -t me-central1-docker.pkg.dev/inft-3611/inft-3611-dev-sec-ops/nginx-$USER```

### Docker push command

```docker push me-central1-docker.pkg.dev/inft-3611/inft-3611-dev-sec-ops/nginx-$USER```

This should result in the image ``nginx-$USER`` being stored in the location as described above

 ### Running the nginx docker in the GCP shell
 ```docker run -d -p8080:80 me-central1-docker.pkg.dev/inft-3611/inft-3611-dev-sec-ops/nginx-$USER``
