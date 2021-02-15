# Run dbt with Docker

## Overview
Running dbt by creating a docker image for this particular dbt project. This docker image can be used to intergrate dbt into other tools such as airflow. 

Usage of dbt docker image in airflow can be found [here](https://github.com/dannylee1020/airflow-pipelines)

## Run with Docker
Run the dbt project with `docker run -v ~/.config/gcloud:root/.config/gcloud` or `docker-compose run dbt-docker`. 

This assumes that user uses application default credentials stored by `gcloud auth login` in `~/.config/gcloud` and the user's home directory in the container is `/root`