# PROD
# BASE IMAGE
FROM eclipse-temurin:21-alpine

# CONFIGURE TEMPORARY VOLUME
VOLUME /tmp

# SET TIMEZONE
ENV TZ=America/Sao_Paulo
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo "$TZ" > /etc/timezone

# ENVIRONMENT
# ENV JWT_SECRET="123"
# ENV ROLE_SECRET="321"

# PORT
EXPOSE 5050

# JAR FILE
ARG JAR_FILE=target/discovery-0.0.1-SNAPSHOT.jar

# ADD JAR TO CONTAINER
ADD ${JAR_FILE} app-discovery.jar

# INIT
ENTRYPOINT ["java","-Duser.timezone=America/Sao_Paulo","-jar","/app-discovery.jar"]


# mvn install
# docker build -t arca-discovery:dev_v1 .
# docker container run --name arca-discovery -d -p 5050:5050 arca-discovery:dev_v1