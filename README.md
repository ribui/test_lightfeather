# Overview
This repository contains a React frontend, and an Express backend that the frontend connects to.

# Objective
Deploy the frontend and backend to somewhere publicly accessible over the internet. The AWS Free Tier should be more than sufficient to run this project, but you may use any platform and tooling you'd like for your solution.

Fork this repo as a base. You may change any code in this repository to suit the infrastructure you build in this code challenge.

# Submission
1. A github repo that has been forked from this repo with all your code.
2. Modify this README file with instructions for:
* Any tools needed to deploy your infrastructure
* All the steps needed to repeat your deployment process
* URLs to the your deployed frontend.

# Evaluation
You will be evaluated on the ease to replicate your infrastructure. This is a combination of quality of the instructions, as well as any scripts to automate the overall setup process.

# Setup your environment
Install nodejs. Binaries and installers can be found on nodejs.org.
https://nodejs.org/en/download/

For macOS or Linux, Nodejs can usually be found in your preferred package manager.
https://nodejs.org/en/download/package-manager/

Depending on the Linux distribution, the Node Package Manager `npm` may need to be installed separately.

# Running the project
The backend and the frontend will need to run on separate processes. The backend should be started first.
```
cd backend
npm ci
npm start
```
The backend should response to a GET request on `localhost:8080`.

With the backend started, the frontend can be started.
```
cd frontend
npm ci
npm start
```
The frontend can be accessed at `localhost:3000`. If the frontend successfully connects to the backend, a message saying "SUCCESS" followed by a guid should be displayed on the screen.  If the connection failed, an error message will be displayed on the screen.

# Configuration
The frontend has a configuration file at `frontend/src/config.js` that defines the URL to call the backend. This URL is used on `frontend/src/App.js#12`, where the front end will make the GET call during the initial load of the page.

The backend has a configuration file at `backend/config.js` that defines the host that the frontend will be calling from. This URL is used in the `Access-Control-Allow-Origin` CORS header, read in `backend/index.js#14`

# Optional Extras
The core requirement for this challenge is to get the provided application up and running for consumption over the public internet. That being said, there are some opportunities in this code challenge to demonstrate your skill sets that are above and beyond the core requirement.

A few examples of extras for this coding challenge:
1. Dockerizing the application
2. Scripts to set up the infrastructure
3. Providing a pipeline for the application deployment
4. Running the application in a serverless environment

This is not an exhaustive list of extra features that could be added to this code challenge. At the end of the day, this section is for you to demonstrate any skills you want to show that’s not captured in the core requirement.

1.	Manually created a Jenkins server and integrated it with Docker and git. Opened the right ports to allow communication PORT NUMBERS: 8080, SSH port. Added ec2-user and Jenkins user into the docker group.
2.	Locally configured Jenkins with necessary plugins: 
Install Jenkins and required plugins:
o	Install Jenkins on your server (https://www.jenkins.io/doc/book/installing/)
o	Install the required Jenkins plugins:
o	AWS Steps (https://plugins.jenkins.io/pipeline-aws)
o	Terraform (https://plugins.jenkins.io/terraform)
o	GitHub (https://plugins.jenkins.io/github)
o	Docker (https://plugins.jenkins.io/docker-plugin)
o	SSH Agent (https://plugins.jenkins.io/ssh-agent)
Configured AWS CLI:
o	Install AWS CLI on the Jenkins server (https://aws.amazon.com/cli/)
o	Configure AWS CLI with the appropriate access keys and region (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
Configure Jenkins Credentials:
3.	Add your AWS access keys, GitHub credentials, Docker Hub credentials, and SSH key to the Jenkins credentials store (https://www.jenkins.io/doc/book/using/using-credentials/)

Docker:
4.	In the Docker files, we describe how to build a Docker container for a Node.js application. It starts with the official Node.js base image, sets up the working directory, installs dependencies, copies the application code, exposes the application's ports 3000 and 8080, and starts the application.

Terraform files:
1.	Deploying aws resources using terraform configuration files. Here we will create an ECR repository, an ECS cluster, and an ECS service, as well as ECS task definition with container ports and host ports in the port mapping

To set up a Jenkins pipeline:
2.	Create a new Jenkins pipeline job
3.	Configure the pipeline to pull the Jenkinsfile from your GitHub repository
4.	In the Jenkinsfile, define the steps for your CI/CD process, 
i.	Provisioning the AWS infrastructure with the terraform files BEFORE the application of built and deployed.
ii.	Login to ECR repo created from above step to allow the later built application to be deployed to.
iii.	Building each Docker image, tagging then pushing to the above ECR.
iv.	 Deploying to ECS using Jenkins as the final step.
Deployment process
1.	Once the application is deployed using Jenkins and terraform, verify that we have the following resources in AWS:	
a.	ECR: This is where the docker images will be pushed to
b.	ESC: with service created and 2 task definitions. One for the Front end and the other for the backend.
2.	To access the application, get the public IP address for the front-end application and add :3000 on your local browser.
3.	once the application successfully communicates to the backend application, user will be able to interact with backend hosted on port :8080 and receive a message: “ Web site created using create-react-app”
