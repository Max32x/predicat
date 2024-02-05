FROM python:3.13.0a3-slim

COPY requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY ./app /app

CMD ["gunicorn","-k","uvicorn.workers.UvicornWorker","-b", "0.0.0.0:8000","main:app"]
