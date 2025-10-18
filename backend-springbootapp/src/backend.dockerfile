# Stage 1: Build the app
FROM eclipse-temurin:21-jdk AS builder

WORKDIR /backend-springbootapp

COPY mvnw .          
COPY .mvn/ .mvn
COPY pom.xml ./
COPY src ./src

# Give execute permission for mvnw
RUN chmod +x mvnw

RUN ./mvnw clean package -DskipTests

# Stage 2: Run the app
FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=builder /backend-springbootapp/target/*.jar app.jar

EXPOSE 200

ENTRYPOINT ["java", "-jar", "app.jar"]