SETUP: CREATE EC2 WITH ALL TRAFFIC (8080)

#STEP-1: INSTALLING GIT JAVA-1.8.0 MAVEN 
yum install git java-1.8.0-openjdk maven -y

#STEP-2: GETTING THE REPO (jenkins.io --> download -- > redhat)
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

#STEP-3: DOWNLOAD JAVA11 AND JENKINS
amazon-linux-extras install java-openjdk11 -y
yum install jenkins -y
update-alternatives --config java

#STEP-4: RESTARTING JENKINS (when we download service it will on stopped state)
systemctl start jenkins.service
systemctl status jenkins.service

copy public ip and paste on browser like this
public-ip:8080
cat /var/lib/jenkins/secrets/initialAdminPassword
install plugins and create user for login.

INTEGRATION OF GIT AND MAVEN WITH JENKINS:
NEW ITEM -- > NAME: NETFLIX JOB -- > FREE STYLE -- > OK 
Source Code Management -- > GIT -- > https://github.com/devopsbyraham/jenkins-java-project.git
Build Steps -- > add setp -- > Execute shell -- > save
