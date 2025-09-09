#rodar docker
#docker-compose up --build
#docker-compose exec web python -m unittest discover -s testes


#parar e apagar os containers
#docker-compose down -v


FROM python:3.11-slim

WORKDIR /app


RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*


COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


COPY . .

EXPOSE 5002

CMD ["python", "app.py"]
