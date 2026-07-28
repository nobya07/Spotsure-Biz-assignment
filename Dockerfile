FROM python:3.11-slim

WORKDIR /app

COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app/main.py .

EXPOSE 8000

# CHANGED: Bind Uvicorn to 0.0.0.0 instead of 127.0.0.1.
# This allows the application to accept connections from
# other Docker containers (such as the Nginx reverse proxy).
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
