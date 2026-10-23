# ==========================================
# Etapa 1: Compilación (Build)
# ==========================================
FROM maven:3.9.6-eclipse-temurin-21 AS builder

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
RUN mvn package -DskipTests

# ==========================================
# Etapa 2: Ejecución (Runtime)
# ==========================================
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

# Valor por defecto para la variable de entorno dentro del contenedor
ENV PORT=4000
EXPOSE ${PORT}

ENTRYPOINT ["java", "-jar", "app.jar"]