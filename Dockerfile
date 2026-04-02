# ── Stage 1: build dependencies ──────────────────────────────────────
FROM python:3.11-slim AS base

# Prevent Python from writing .pyc files and enable unbuffered stdout/stderr
# (so logs appear immediately in `docker compose logs`).
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /code

# Install system libs needed later by Pillow and psycopg
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libjpeg62-turbo-dev \
        libpng-dev \
        libpq-dev \
        gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy and install Python deps first (layer caching means we only
# re-install when requirements.txt changes, not on every code edit).
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY ./app ./app

EXPOSE 8000
