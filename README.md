	Light Feather Devops-code-challenge
Manually created a Jenkins server and integrated it with Docker and git. Opened the right ports to allow communication PORT NUMBERS: 8080, SSH port. Added ec2-user and Jenkins user into the docker group.
Locally configured Jenkins with necessary plugins: 
Install Jenkins and required plugins:
Install Jenkins on your server (https://www.jenkins.io/doc/book/installing/)
Install the required Jenkins plugins:
AWS Steps (https://plugins.jenkins.io/pipeline-aws)
Terraform (https://plugins.jenkins.io/terraform)
GitHub (https://plugins.jenkins.io/github)
Docker (https://plugins.jenkins.io/docker-plugin)
SSH Agent (https://plugins.jenkins.io/ssh-agent)
Configured AWS CLI:
Install AWS CLI on the Jenkins server (https://aws.amazon.com/cli/)
Configure AWS CLI with the appropriate access keys and region (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
Configure Jenkins Credentials:
Add your AWS access keys, GitHub credentials, Docker Hub credentials, and SSH key to the Jenkins credentials store (https://www.jenkins.io/doc/book/using/using-credentials/)

Docker:
In the Docker files, we describe how to build a Docker container for a Node.js application. It starts with the official Node.js base image, sets up the working directory, installs dependencies, copies the application code, exposes the application's ports 3000 and 8080, and starts the application.

Terraform files:
Deploying aws resources using terraform configuration files. Here we will create an ECR repository, an ECS cluster, and an ECS service, as well as ECS task definition with container ports and host ports in the port mapping

To set up a Jenkins pipeline:
Create a new Jenkins pipeline job
Configure the pipeline to pull the Jenkinsfile from your GitHub repository
In the Jenkinsfile, define the steps for your CI/CD process, 
Provisioning the AWS infrastructure with the terraform files BEFORE the application of built and deployed.
Login to ECR repo created from above step to allow the later built application to be deployed to.
Building each Docker image, tagging then pushing to the above ECR.
 Deploying to ECS using Jenkins as the final step.
Deployment process
Once the application is deployed using Jenkins and terraform, verify that we have the following resources in AWS:	
ECR: This is where the docker images will be pushed to
ESC: with service created and 2 task definitions. One for the Front end and the other for the backend.
To access the application, get the public IP address for the front-end application and add :3000 on your local browser.
once the application successfully communicates to the backend application, user will be able to interact with backend hosted on port :8080 and receive a message: “ Web site created using create-react-app”
