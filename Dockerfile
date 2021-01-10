FROM ubuntu
RUN apt-get update -y
RUN apt-get install python3 -y
RUN apt-get install python3-venv -y
RUN apt-get install -y curl -y
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py
ADD requirements.txt /
RUN pip install -r /requirements.txt
EXPOSE 8888
WORKDIR /app
ENTRYPOINT ["jupyter", "notebook", "--allow-root",  "--ip",  "0.0.0.0"]
