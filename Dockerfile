FROM rhel8/python-36
ENV PYTHONUNBUFFERED 1

ADD requirements.pip /config/
RUN pip install -r /config/requirements.pip

ADD . /src
WORKDIR /src

RUN pip install -r requirements.pip

# CMD gunicorn openshift_django.wsgi -b 0.0.0.0:3013
CMD python manage.py runserver 0.0.0.0:3013

EXPOSE 3013
