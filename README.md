# ERS_DOCKER_EC2

## Running on EC2

### Downloading Docker images to EC2
-Create new EC2 instance using free tier
-Run the following to install docker on EC2 instance

$ sudo yum update -y
$ sudo amazon-linux-extras install docker
$ sudo service docker start
$ sudo usermod -a -G docker ec2-user

-Run `docker pull abe15/ers_abe:latest`
-Run `docker pull postgres:latest`

###Database enviroment variables are override-able.
Defaults:
-DB_URL=jdbc:postgresql://host.docker.internal:5436/
-DB_USERNAME=postgres
-DB_PASSWORD=pass 

-Run `docker run abe15/ers_abe` to run java app with defaults
else override env variables using `docker run --name [container-name] -e "[variable-name]=[new-value]" [image-name]`

###Initializing database

-Run `docker run --env=POSTGRES_PASSWORD=pass -p 5436:5432 -d postgres:latest`
-Customize POSTGRES_PASSWORD, POSTGRES_USER, port if needed
-Execute ERS_SCHEMA.sql on database 


####Run database first before java app
