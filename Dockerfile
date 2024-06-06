# Use an official Python runtime as the base image (install image)
FROM python:3.9-slim

# Set the working directory in the container (Going to work directory)
WORKDIR /app

# install required packages for system (Run a command)
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/* 
# Remove a app list
# COPY a requirment file
COPY requirements.txt .

# Run all commands inside container ( For Run Application )
# 1. install mysql client
RUN pip install mysqlclient 
# 2. install requirements.txt
RUN pip install -r requirements.txt

# copy a file source to destination first dot is source and second is destination
COPY ..
# RUN a command inside docker container you build using dockerfile
CMD ["python", "app.py"]