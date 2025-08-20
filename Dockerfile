# Stage 1: Build JAR inside Docker
FROM public.ecr.aws/sam/build-java17:latest AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Runtime image
FROM public.ecr.aws/docker/library/openjdk:17-oracle
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
