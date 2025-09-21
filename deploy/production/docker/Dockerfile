FROM python:3.13-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    pkg-config \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

COPY pyproject.toml uv.lock ./
RUN uv sync --frozen

COPY . .

RUN uv run python manage.py collectstatic --noinput

EXPOSE 8001

CMD ["uv", "run", "gunicorn", "--bind", "0.0.0.0:8001", "--workers", "3", "codepipeline_django.wsgi:application"]