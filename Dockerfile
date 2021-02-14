FROM python:3.7

WORKDIR /opt

RUN pip install --upgrade pip
RUN pip install dbt==0.19.0

# WORKDIR /opt/baseball_dbt
ENV DBT_DIR /opt/baseball_dbt/
WORKDIR $DBT_DIR
COPY . . 

CMD dbt run --profiles-dir profile


# docker run -v /Users/dhyungseoklee/.config/gcloud:/root/.config/gcloud baseball_dbt:latest 