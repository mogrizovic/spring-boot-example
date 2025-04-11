FROM maven:3-eclipse-temurin-11 AS builder

COPY . /usr/src/elkdemo
WORKDIR /usr/src/elkdemo
# RUN mvn -Dmaven.test.skip=true clean package 

FROM eclipse-temurin:11.0.26_4-jre-ubi9-minimal

WORKDIR /usr/src/elkdemo
COPY --from=builder /usr/src/elkdemo/target/*.jar elkdemo.jar

ENTRYPOINT ["java", "-jar", "elkdemo.jar"]
