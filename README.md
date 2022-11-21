# go-scratch-image
The exercise consists of creating a Go image with less than 2MB that when executed appears as a result: Code.education Rocks!<br>
And finally push the image to Docker hub.

## Docker image using multi-stage build to compile the app and optimize the image.

- Stage 1

```
# Initializing a base golang:alpine image
FROM golang:alpine AS builder
# Creating a work directory
WORKDIR /app
# Copying the app
COPY . .
# Compiling the binary
RUN go build go-challenge.go
```
- Stage 2
```
# Initializing from scratch image
FROM scratch
# Creating a work directory
WORKDIR /
# Copying 1° stage builder to 2° stage work directory
COPY --from=builder /app /
# Running
CMD [ "./go-challenge" ]
```

## Build 

```
docker build . -t jhonatanalves/codeeducation
```

## Images

```
docker images
```

![go-minimal-image](https://user-images.githubusercontent.com/71884829/203049475-16f7d28b-b9f3-422d-8d06-18a149058daa.png)

## Run

```
docker run jhonatanalves/codeeducation
```
![docker-run-scratch-go-image](https://user-images.githubusercontent.com/71884829/203051881-7c7b960a-80e1-4055-a220-a3b62e79eebc.png)

## Push

```
docker push jhonatanalves/codeeducation
```

## Docker Hub repository

```
https://hub.docker.com/r/jhonatanalves/codeeducation
```

## Pull

```
docker pull jhonatanalves/codeeducation
```
