FROM python:latest

ADD manager /manager

ENV POSTGRES_USER=user
ENV POSTGRES_PASSWORD=password
ENV POSTGRES_DB=database
ENV CSV_FILENAME=data.csv

RUN pip3 install psycopg2

EXPOSE 8000

RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /
RUN chmod +x /wait-for-it.sh
ENTRYPOINT ["/wait-for-it.sh", "db:5432", "--"]

CMD [ "python3", "-m", "manager" ]