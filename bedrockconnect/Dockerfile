FROM ubuntu:latest

RUN apt update -y && apt install -y wget openjdk-11-jre-headless

WORKDIR /app

RUN wget https://github.com/Pugmatt/BedrockConnect/releases/download/1.41/BedrockConnect-1.0-SNAPSHOT.jar

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]
