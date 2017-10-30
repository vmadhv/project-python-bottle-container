FROM ubuntu:14.04

RUN apt-get update && apt-get install -y python-pip python-dev && apt-get clean

RUN pip install bottle
RUN pip install gunicorn
RUN pip install gevent

RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
ADD . /code/

EXPOSE 8080 80 5555

CMD ["python","app.py"]
