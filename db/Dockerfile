FROM python:3.7

# Add db directory
ADD . /srv/db

# Add start script
ADD ./config/db-start.sh /

# Execute start script
CMD ["./db-start.sh"]
