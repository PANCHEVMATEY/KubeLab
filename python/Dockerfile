FROM python:3.10-slim

WORKDIR /app

COPY main.py .

RUN pip install flask psycopg2-binary

CMD ["python", "main.py"]
