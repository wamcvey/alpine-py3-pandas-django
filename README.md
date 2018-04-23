# Overview
This image [jackton1/bitbucket-alpine-ecr]() replace the [atlassian/default-image:2](https://hub.docker.com/r/atlassian/default-image/)
provided by [Bitbucket Pipelines](https://confluence.atlassian.com/bitbucket/use-docker-images-as-build-environments-792298897.html)

### Platform: alpine 3.7
Packages available out-of-the-box:
wget
xvfb: 1.19.6
curl: 7.59.0
ssh: 7.7.2
git: 2.17.0
gitflow: 1.11.0 (AVH Edition)
mercurial: 4.5.3
java: Open-JDK 1.8u151
maven: 3.5.3
node: 8.11.1
npm: 5.6.0
nvm: 0.33.8
python: 2.7.14, 3.6.4
pip: 10.0.1
gcc: 6.4.0
ant: 1.9.6
make: 4.2.1
jq: 1.6.1


### Python packages:
- botocore: 1.10.2
- awscli: 1.15.2


# Usage
Use like you would any other base image:
```
FROM jackton1/bitbucket-alpine-ecr:latest
RUN python3.6 -m pip install -U Django
```

More details about the contents:
https://confluence.atlassian.com/bitbucket/using-docker-images-as-build-environments-792298897.html

# Versioning
The latest tag matches the most recent release, so jackton1/bitbucket-alpine-ecr:latest
 will use the newest stable version available.
