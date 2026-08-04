# Stage 1 - Builder
FROM python:3.11-slim AS builder

# Set working directory
WORKDIR /app

# Copy dependency file
COPY app/requirements.txt .

# Install Python dependencies into a separate directory.
# This keeps the runtime image cleaner by copying only the
# installed packages to the final image.
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt


# Stage 2 - Runtime
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy only the installed dependencies from the builder stage.
# This reduces the final image size and excludes unnecessary
# build files from the runtime image.
COPY --from=builder /install /usr/local

# Copy application source code
COPY app/main.py .

# Expose FastAPI application port
EXPOSE 8000

# CHANGED:
# Bind Uvicorn to 0.0.0.0 instead of the default 127.0.0.1.
#
# ISSUE:
# The FastAPI application was only listening inside its own
# container (localhost), so the Nginx container could not
# connect to it.
#
# SOLUTION:
# Binding to 0.0.0.0 allows the application to listen on all
# network interfaces, enabling communication between Docker
# containers over the Docker Compose network.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]