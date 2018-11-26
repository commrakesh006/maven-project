	FROM tomcat:8.0
	
	ADD ./webapp/target/*.war /opt/tomcat/latest/webapps/
	
	EXPOSE 8080
	
	CMD ["catalina.sh","run"]	