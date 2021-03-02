FROM ubuntu
RUN apt update && apt install python3 python3-pip libmysqlclient-dev -y
COPY ./requirements.txt .
RUN pip3 install -r requirements.txt
COPY . /
ENTRYPOINT [ "python3" ]
CMD [ "app/main.py" ]
