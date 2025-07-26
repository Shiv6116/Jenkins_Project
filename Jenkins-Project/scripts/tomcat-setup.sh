TOMCAT SETUP:
1. wget http://dlcdn.apache.org/tomcat/tomcat-9/v9.0.80/bin/apache-tomcat-9.0.80.tar.gz
2. tar -zxvf apache-tomcat-9.0.80.tar.gz
3. vim apache-tomcat-9.0.80/conf/tomcat-users.xml

  <role rolename="manager-gui"/>
  <role rolename="manager-script"/>
  <user username="tomcat" password="Shivam" roles="manager-gui, manager-script"/>

4. vim apache-tomcat-9.0.80/webapps/manager/META-INF/context.xml (delete 21,22)
5. sh apache-tomcat-9.0.80/bin/startup.sh
public-ip(in Server) ServerName:8080
http://Public ip:8080/netflix/ 
vim /root/apache-tomcat-9.0.80/conf/server.xml
sh /root/apache-tomcat-9.0.80/bin/startup.sh
sh /root/apache-tomcat-9.0.80/bin/shutdown.sh

pipeline {
    agent {
        label 'slave1'
    }  
    stages {
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
                  Sonarqube Script Past here
                '''
            }
        }
        stage('artifact') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('deploy') {
            steps {
                deploy adapters:[
                    tomcat9(
                        credentialsId: '(Create ID Put Here)',
                        path: '',
                        url: 'http://Public ip:8080/'
                        )
                    ],
                    contextPath: 'netflix',
                    war: 'target/*.war'
            }
        }
    }
}
