# Stage 1: Maven Build
FROM maven AS build
WORKDIR /usr/src/app
COPY pom.xml .
COPY src src
RUN mvn clean package

# Stage 2: Tomcat Runtime
FROM tomcat
COPY --from=build /usr/src/app/target/java-websocket-example.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
