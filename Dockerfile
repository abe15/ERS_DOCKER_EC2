# syntax=docker/dockerfile:1

FROM eclipse-temurin:17-jdk-jammy
WORKDIR /code
ARG DB_URL=jdbc:postgresql://host.docker.internal:5436/
ENV DB_URL=${DB_URL}
ARG DB_USERNAME=postgres
ENV DB_USERNAME=${DB_USERNAME}
ARG DB_PASSWORD=pass
ENV DB_PASSWORD=${DB_PASSWORD}

EXPOSE 7070
COPY Employee-Reimbursement-System.jar /home/Employee-Reimbursement-System.jar
CMD ["java","-jar","/home/Employee-Reimbursement-System.jar"]