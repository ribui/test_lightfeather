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
