
FROM python:3.11.3-slim as python-base
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    \
    POETRY_VERSION=1.1.5 \
    POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_CREATE=false \
    \
    PYSETUP_PATH="/opt/pysetup"
ENV PATH="$POETRY_HOME/bin:$PATH"


FROM python-base as initial
RUN apt-get update && \
    apt-get install --no-install-recommends -y && \
    apt-get install -y gcc g++ cmake curl
RUN python -m pip install --upgrade pip && \
    pip install poetry
WORKDIR $PYSETUP_PATH


FROM initial as development-base
ENV POETRY_NO_INTERACTION=1
WORKDIR /src
COPY poetry.lock pyproject.toml ./


FROM development-base as development
RUN poetry install


FROM development as local-development
ENTRYPOINT ["poetry", "run", "uvicorn", "server.main:app", "--host", "0.0.0.0", "--port", "7000", "--reload" ]


FROM development as cloud-development
COPY ./ /src
ENTRYPOINT ["poetry", "run", "uvicorn", "server.main:app", "--host", "0.0.0.0", "--port", "7000", "--reload" ]
