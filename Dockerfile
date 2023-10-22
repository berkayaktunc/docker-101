FROM python:3.9.18-alpine
COPY . /app
WORKDIR /app
CMD python main.py