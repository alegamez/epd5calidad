# Utiliza la imagen base de Ubuntu 20.04
FROM ubuntu:20.04

# Actualiza el sistema e instala Java 8
RUN apt-get update && apt-get install -y openjdk-8-jdk

# Instala Tomcat 9
RUN apt-get install -y tomcat9

# Descarga la última versión de Jenkins en formato .war
ADD https://get.jenkins.io/war-stable/latest/jenkins.war /var/lib/tomcat9/webapps/jenkins.war

# Exponer el puerto 8080
EXPOSE 8080
RUN echo "CATALINA_OPTS=\"-Djava.security.egd=file:/dev/./urandom\"" >> /etc/default/tomcat9