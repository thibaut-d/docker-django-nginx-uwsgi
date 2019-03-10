FROM python:3.8

# Add code
ADD . /srv/myproject

# Install application requirements
ADD ./config/requirements.txt /srv/myproject/
RUN pip3 install -r /srv/myproject/requirements.txt

# Add start script
ADD ./config/start.sh /

# Add uWSGI config
ADD ./config/django-uwsgi.ini /etc/uwsgi/django-uwsgi.ini

# Add database check script
ADD ./config/database-check.py /srv/config/database-check.py

# Create django user, will own the Django app. This is needed
# because we defined this, in the uwsgi.ini file
RUN adduser --no-create-home --disabled-login --group --system django
RUN chown -R django:django /srv/myproject

# Execute start script
CMD ["./start.sh"]
