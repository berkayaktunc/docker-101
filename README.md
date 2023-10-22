# Simple Impelemtation of Docker

## Create Docker File

**Dockerfile** should be created under the root of the project.
```
├── Dockerfile
└── main.py
```

```docker
# Select a OS to run the app
FROM python:3.9.18-alpine

# Copy all the project under the /app file in docker
COPY . /app

# Change active directory into the /app
WORKDIR /app

# Run the command you want to run
CMD python main.py
```
<br>

## Docker Build

```bash
# docker build: Command to create a docker
# -t : To give tag name
# hello-docker: The tag name we provide
# . : The Dockerfile location. In this example docker file is where we open our terminal 
docker build -t hello-docker .
```

Output example of that command
```bash
Sending build context to Docker daemon  3.072kB
Step 1/4 : FROM python:3.9.18-slim-bullseye
3.9.18-slim-bullseye: Pulling from library/python
e67fdae35593: Pull complete 
a970ffaebef6: Pull complete 
025fa3dbb16e: Pull complete 
f1548e823132: Pull complete 
de7a1221312a: Pull complete 
Digest: sha256:6db9cf1a3a1dfa57f610cbe12e573dfde7d30bc4b65079059ae89d984d4eaa64
Status: Downloaded newer image for python:3.9.18-slim-bullseye
 ---> 268423777e4e
Step 2/4 : COPY . /app
 ---> dffef07d9c62
Step 3/4 : WORKDIR /app
 ---> Running in 7d9ea53248c4
Removing intermediate container 7d9ea53248c4
 ---> a4f24d5f2031
Step 4/4 : CMD python main.py
 ---> Running in 0513cf72f647
Removing intermediate container 0513cf72f647
 ---> 7878959b21c8
Successfully built 7878959b21c8
Successfully tagged hello-docker:latest
```
<br>

## List Dockers and Run

- List
```bash
# docker: The root of the command
# images: Loaded images in our system
docker images
```
or alternatively
```bash
# docker: The root of the command
# image: Our desired information
# ls: To list them all
docker image ls
```

Output of that example
```bash
REPOSITORY     TAG                    IMAGE ID       CREATED         SIZE  
hello-docker   latest                 7878959b21c8   2 minutes ago   48.4MB    
python         3.9.18-alpine          188c141401fe   5 days ago      48.4MB
```
(hello-docker is our desired docker)

- Run
```bash
# docker: The root of the command
# run: Command to perform
# hello-docker: Our desired docker file we just created
docker run hello-docker
```

Output of that example
```bash
> docker run hello-docker
hello docker!!
```
As an output, we just see "hello docker!!" is because our *main.py* has only printed that.

<br>

## Pull and Push
- Pull
```bash
# docker: The root of the command
# pull: Command to perform
# berkayaktunc/hello-docker: desired docker to pull
docker pull berkayaktunc/hello-docker
```

- Push
```bash
# Need to login first
docker login -u berkayaktunc -p password123 docker.io

# change tag for the image to push including tag
docker tag hello-docker berkayaktunc/hello-docker:v1.0

# now you are ready to push your docker to the dockerhub
docker push berkayaktunc/hello-docker:v1.0
```

<br>

## Delete locally

```bash
> docker images
REPOSITORY   TAG                    IMAGE ID       CREATED          SIZE  
<none>       <none>                 0957e6c67237   27 minutes ago   24.2MB
```

```bash
# docker: The root of the command
# rmi: Command to perform
# 0957e6c67237: ID of the unwanted docker
docker rmi 0957e6c67237
```

```bash
> docker images
REPOSITORY   TAG                    IMAGE ID       CREATED          SIZE  
```