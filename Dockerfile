FROM python:3
ADD hello_world.py /
RUN pip3 install flask
RUN pip3 install flask_restful 
EXPOSE 3333
CMD ["python", "./hello_world.py"]