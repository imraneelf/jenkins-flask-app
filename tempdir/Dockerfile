FROM python
RUN pip install flask
COPY ./static /home/im_app/static/
COPY ./templates /home/im_app/templates/
COPY flask_app.py /home/im_app/
EXPOSE 8008
CMD python3 /home/im_app/flask_app.py
