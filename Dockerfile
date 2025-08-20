
# instead of pulling from docker hub
# FROM openjdk:17-oracle

# use the same image from Amazon ECR Public (no rate limits in AWS)
FROM public.ecr.aws/docker/library/openjdk:17-oracle

VOLUME /tmp
COPY target/*.jar  app.jar
ENTRYPOINT ["java","-jar", "app.jar"]

