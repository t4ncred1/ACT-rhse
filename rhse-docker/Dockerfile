FROM mongo:4.0-xenial

RUN apt-get update -y

RUN apt-get install -y python2.7 python-tk python-pip

RUN pip install --upgrade pip==20.2.4

COPY ./requirements.txt /requirements.txt

RUN pip install -r requirements.txt

WORKDIR rhse/
