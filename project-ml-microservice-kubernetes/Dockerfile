FROM python:3.7.3-stretch

RUN mkdir -p /app
WORKDIR /app

COPY app.py /app/app.py
COPY model_data/ /app/model_data/
COPY requirements.txt /app/requirements.txt

RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

EXPOSE 80

CMD ["python", "app.py"]

