FROM openjdk:8-jdk
COPY build/libs/kcl-sample-all.jar /app/kcl-sample-all.jar
ENTRYPOINT ["java","-jar","/app/kcl-sample-all.jar"]
CMD []