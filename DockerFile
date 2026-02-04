FROM ubuntu:22.04

RUN apt update && apt install -y python3

WORKDIR /app
COPY index.html .

EXPOSE 8000

CMD ["python3", "-m", "http.server", "8000"]
