<include a CircleCI status badge, here>

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl

### Circle CI Badge
[!CircleCI](https://circleci.com/gh/circleci/DevOps_Microservices.svg?style=svg)](https://circleci.com/gh/circleci/DevOps_Microservices.svg?style=svg)

### Repository Explanation
Our project is stored in the folder project-ml-microservice-kubernetes/ and we are going to give some details about its content:

- app.py: It is a Flask application that provides an endpoint for making predictions.
- requirements.txt: Dependencies file from the Flask API.
- model_data/: Is the folder that stores the prediction ML model.
- output_txt_files/: A folder containing some text files that stores logs from the current project. It's intended to save docker and kubernet logs.
- .circleci and .circleci/config.yml: Continuos Integration folder for the repository. 
- Dockerfile: File that allow us to create an image of the project and then run containers of it.
- Makefile: Allow us to store commands that we can run quickly on the terminal.
- make_prediction.sh: Makes a curl request to the deployed application
- run_docker.sh: Build and run the application container
- run_kubernetes.sh: Build kubernetes pods
- upload_docker.sh: Upload docker container into dockerhub

## How to run application
Go to the `project-ml-microservice-kubernetes/` folder by executing: 
```cd project-ml-microservice-kubernetes```
1. Option 1:Python In the terminal type and execute: `python app.py`
> You can test the app on http://localhost:80
2. Option 2:Docker In the terminal type and execute: `./run_docker.sh`
> You can test the app on http://localhost:8080
3. Option 3:Kubernetes In the terminal type and execute: `./run_kubernetes.sh`
> You can test the app on http://localhost:8000

## How to test the application
Run the script `./make_prediction.sh`, depending of the option you chose to run the application you may want
to change the port in the script, if you chose Option1:Python, go to the script and change the port to PORT=80,
Option2:Docker PORT=8080, Option3:PORT=8000. 

At executing the script you will a message like:
```
[2021-10-09 16:19:50,358] INFO in app: JSON payload: 
{'CHAS': {'0': 0}, 'RM': {'0': 6.575}, 'TAX': {'0': 296.0}, 'PTRATIO': {'0': 15.3}, 'B': {'0': 396.9}, 'LSTAT': {'0': 4.98}}
[2021-10-09 16:19:50,372] INFO in app: Inference payload DataFrame: 
   CHAS     RM    TAX  PTRATIO      B  LSTAT
0     0  6.575  296.0     15.3  396.9   4.98
[2021-10-09 16:19:50,380] INFO in app: Scaling Payload: 
   CHAS     RM    TAX  PTRATIO      B  LSTAT
0     0  6.575  296.0     15.3  396.9   4.98
[2021-10-09 16:19:50,383] INFO in app: Prediction: [20.35373177134412]
172.17.0.1 - - [09/Oct/2021 16:19:50] "POST /predict HTTP/1.1" 200 -
```

## Stop/Delete Minikube
After you test your application is working you can do one of the following to stop minikube:
- minikube stop
- minikube delete