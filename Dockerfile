FROM gradle:7.4.2-jdk17-alpine AS build
FROM groovy
RUN mkdir product-traceability-foss-backend
COPY . /home/app/product-traceability-foss-backend
WORKDIR /home/app/product-traceability-foss-backend
USER root
RUN groupadd rootGroup &&  usermod -aG rootGroup root
RUN ./gradlew wrapper
RUN ./gradlew build -i -x test -x javadoc

WORKDIR /home/app/product-traceability-foss-backend/build/libs
EXPOSE 8081
ENTRYPOINT ["java","-jar","traceability-app-0.0.1-SNAPSHOT.jar"]
