FROM python:3.11.4-slim-buster

WORKDIR /usr/src/app/

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install system dependencies
RUN apt-get update && apt-get install -y netcat

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt 
RUN pip install psycopg2-binary

# copy entrypoint.sh
COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' /usr/src/app/entrypoint.sh
RUN chmod +x ./entrypoint.sh

# copy project
COPY . .

WORKDIR /usr/src/app/hello_django

USER root
RUN chmod a+x /usr/src/app/entrypoint.sh
# run entrypoint.sh
CMD ["/bin/bash", "-c", "/usr/src/app/entrypoint.sh"]