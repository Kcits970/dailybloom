FROM python:3
RUN apt-get update && apt-get install -y --no-install-recommends postgresql-client

WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

RUN chmod +x ./init.sh
ENTRYPOINT ["sh", "./init.sh"]
CMD ["python", "./gateway.py"]
