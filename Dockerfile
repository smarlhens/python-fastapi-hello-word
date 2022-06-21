FROM python:3.10.5-slim-bullseye as python-base

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1 \
    PYSETUP_PATH="/opt/pysetup" \
    VENV_PATH="/opt/pysetup/.venv"

ENV PATH="$POETRY_HOME/bin:$VENV_PATH/bin:$PATH"

FROM python-base as builder-base
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        curl \
        build-essential

ENV POETRY_VERSION=1.1.13
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python

WORKDIR $PYSETUP_PATH
COPY ./poetry.lock ./pyproject.toml ./
RUN poetry install --no-root --no-dev

FROM builder-base as development
ENV POETRY_VIRTUALENVS_IN_PROJECT=None \
    FASTAPI_ENV=development \
    PYTHONPATH="$PYSETUP_PATH/src"

RUN poetry install --no-root

COPY . .

RUN chmod 555 ./src/entrypoint.sh

EXPOSE 8000
ENTRYPOINT ["/opt/pysetup/src/entrypoint.sh"]


FROM python-base as production
ENV FASTAPI_ENV=production \
    PYTHONPATH="$PYSETUP_PATH"
COPY --from=builder-base $VENV_PATH $VENV_PATH
WORKDIR $PYSETUP_PATH
COPY ./src/ ./
USER 10000

ENTRYPOINT ["/opt/pysetup/entrypoint.sh"]
