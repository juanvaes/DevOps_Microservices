#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

docker build -t juanvaes/flask-app-devops .

docker image ls

docker run -p 8080:80 juanvaes/flask-app-devops