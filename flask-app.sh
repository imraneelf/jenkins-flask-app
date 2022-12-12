#!/bin/bash
mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp flask_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python" >> tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "COPY ./static /home/im_app/static/" >> tempdir/Dockerfile
echo "COPY ./templates /home/im_app/templates/" >> tempdir/Dockerfile
echo "COPY flask_app.py /home/im_app/" >> tempdir/Dockerfile
echo "EXPOSE 8008" >> tempdir/Dockerfile
echo "CMD python3 /home/im_app/flask_app.py" >> tempdir/Dockerfile
cd tempdir
docker build -t flaskapp .
docker run -t -d -p 8008:8008 --name flaskrunning flaskapp
docker ps -a