FROM python:3.10-slim

# The target runtime Production/Test/Dev ?
ENV YOUR_ENV=${YOUR_ENV}
# Pin the version of poetry to use
ENV POETRY_VERSION=1.1.12

# Python runtime behaviors
ENV PYTHONFAULTHANDLER=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONHASHSEED=random
ENV PIP_NO_CACHE_DIR=off
ENV PIP_DISABLE_PIP_VERSION_CHECK=on
ENV PIP_DEFAULT_TIMEOUT=100

RUN pip install "poetry==${POETRY_VERSION}"

WORKDIR /app
COPY poetry.lock pyproject.toml /app

# Project initialization:
RUN poetry config virtualenvs.create false \
  && poetry install $(test "$YOUR_ENV" == production && echo "--no-dev") --no-interaction --no-ansi

# Creating folders, and files for a project:
COPY main.py /app

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
