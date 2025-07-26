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
