#!/bin/bash
# Install Git, Java, and Maven
yum install git java-1.8.0-openjdk maven -y
SETUP:

#! /bin/bash
#Launch an instance with 9000 and t2.medium
cd /opt/
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.6.50800.zip
unzip sonarqube-8.9.6.50800.zip
amazon-linux-extras install java-openjdk11 -y
useradd sonar
chown sonar:sonar sonarqube-8.9.6.50800 -R
chmod 777 sonarqube-8.9.6.50800 -R
su - sonar

#run this on server manually
#sh /opt/sonarqube-8.9.6.50800/bin/linux/sonar.sh start
#echo "user=admin & password=admin"



pipeline {
    agent any 
    
    stages{
        stage('checkout') {
            steps {
                git 'https://github.com/devopsbyraham/jenkins-java-project.git'
            }
        }
        stage('build') {
            steps {
                sh 'mvn compile'
            }
        }
        stage('test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('code quality') {
            steps {
                sh '''
                sonarqube Script Past here
                '''
            }
        }
        stage('artifact') {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}
