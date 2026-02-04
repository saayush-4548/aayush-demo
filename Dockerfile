name: Build and Push Docker Image

on:
  push:
    branches:
      - main

jobs:
  docker:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_TOKEN }}

      - name: Build Docker image
        run: |
          docker build -t ${{ secrets.DOCKER_HUB_USERNAME }}/aayush-demo:latest .

      - name: Push Docker image
        run: |
          docker push ${{ secrets.DOCKER_HUB_USERNAME }}/aayush-demo:latest