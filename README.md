<p align="center">
  <a href="https://fastapi.tiangolo.com/" target="blank"><img src="https://cdn.worldvectorlogo.com/logos/fastapi.svg" height="100" alt="FastAPI logo" /></a>
  <a href="https://github.com/encode/uvicorn" target="blank"><img src="https://raw.githubusercontent.com/tomchristie/uvicorn/master/docs/uvicorn.png" height="100" alt="uvicorn logo" /></a>
</p>

<p align="center">
  <a href="https://python-poetry.org/" target="blank"><img src="https://python-poetry.org/images/logo-origami.svg" height="80" alt="Poetry logo" /></a>
  <a href="https://pre-commit.com/" target="blank"><img src="https://pre-commit.com/logo.svg" height="80" alt="pre-commit logo" /></a>
  <a href="https://pycqa.github.io/isort/" target="blank"><img src="https://pycqa.github.io/isort/art/logo.png" height="80" alt="isort logo" /></a>
  <a href="https://bandit.readthedocs.io/" target="blank"><img src="https://raw.githubusercontent.com/pycqa/bandit/main/logo/logo.svg" height="80" alt="bandit logo" /></a>
  <a href="https://docs.pytest.org/" target="blank"><img src="https://raw.githubusercontent.com/pytest-dev/pytest/main/doc/en/img/pytest_logo_curves.svg" height="80" alt="pytest logo" /></a>
</p>

<p align="center">
  <a href="https://docs.docker.com/" target="blank"><img src="https://www.docker.com/wp-content/uploads/2022/03/Moby-logo.png" height="60" alt="Docker logo" /></a>
  <a href="https://github.com/features/actions" target="blank"><img src="https://avatars.githubusercontent.com/u/44036562" height="60" alt="GitHub Actions logo" /></a>
</p>

# Python FastAPI Hello World

[![CodeQL](https://github.com/smarlhens/python-fastapi-hello-word/workflows/codeql/badge.svg)](https://github.com/smarlhens/python-fastapi-hello-word/actions/workflows/codeql.yml)
[![GitHub CI](https://github.com/smarlhens/python-fastapi-hello-word/workflows/ci/badge.svg)](https://github.com/smarlhens/python-fastapi-hello-word/actions/workflows/ci.yml)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/smarlhens/python-fastapi-hello-word/main.svg)](https://results.pre-commit.ci/latest/github/smarlhens/python-fastapi-hello-word/main)
[![GitHub license](https://img.shields.io/github/license/smarlhens/python-fastapi-hello-word)](https://github.com/smarlhens/python-fastapi-hello-word)

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [What's in the box ?](#whats-in-the-box-)
- [Testing](#testing)
- [Docker](#docker)

---

## Prerequisites

- [Python](https://www.python.org/downloads/) **>=3.10 <3.11** (_tested with 3.10.5_)
- [pre-commit](https://pre-commit.com/#install)
- [docker](https://docs.docker.com/get-docker/) (_optional_)

---

## Installation

1. Clone the git repository

   ```bash
   git clone https://github.com/smarlhens/python-fastapi-hello-word.git
   ```

2. Go into the project directory

   ```bash
   cd python-fastapi-hello-word/
   ```

3. Checkout working branch

   ```bash
   git checkout <branch>
   ```

4. Enable pre-commit hooks

   ```bash
   pre-commit install
   ```

5. Start FastAPI app

   ```bash
   uvicorn myservice.main:app --host 0.0.0.0 --proxy-headers --forwarded-allow-ips='*' --port 8000
   ```

6. Navigate to docs: [http://0.0.0.0:8000/docs](http://0.0.0.0:8000/docs)

---

## What's in the box ?

### Poetry

[Poetry](https://python-poetry.org/) is a tool for dependency management and packaging in Python. It allows you to
declare the libraries your project depends on and it will manage (install/update) them for you.

**pyproject.toml file** ([`pyproject.toml`](pyproject.toml)): orchestrate your project and its dependencies
**poetry.lock file** ([`poetry.lock`](poetry.lock)): ensure that the package versions are consistent for everyone
working on your project

For more configuration options and details, see the [configuration docs](https://python-poetry.org/docs/).

### pre-commit

[pre-commit](https://pre-commit.com/) is a framework for managing and maintaining multi-language pre-commit hooks.

**.pre-commit-config.yaml file** ([`.pre-commit-config.yaml`](.pre-commit-config.yaml)): describes what repositories and
hooks are installed

For more configuration options and details, see the [configuration docs](https://pre-commit.com/).

### flake8

[flake8](https://flake8.pycqa.org/) is a tool for style guide enforcement.

Rules are defined in the [`setup.cfg`](setup.cfg).

For more configuration options and details, see the [configuration docs](https://flake8.pycqa.org/).

### mypy

[mypy](http://mypy-lang.org/) is an optional static type checker for Python that aims to combine the benefits of
dynamic (or "duck") typing and static typing.

Rules are defined in the [`pyproject.toml`](pyproject.toml).

For more configuration options and details, see the [configuration docs](https://mypy.readthedocs.io/).

### isort

[isort](https://pycqa.github.io/isort/) is tool that sort your imports, so you don't have to.

Rules are defined in the [`pyproject.toml`](pyproject.toml).

For more configuration options and details, see the [configuration docs](https://pycqa.github.io/isort/).

### black

[black](https://black.readthedocs.io/) is an uncompromising code formatter.

Rules are defined in the [`pyproject.toml`](pyproject.toml).

For more configuration options and details, see the [configuration docs](https://black.readthedocs.io/).

### bandit

[bandit](https://bandit.readthedocs.io/) is a tool designed to find common security issues in Python code.

Rules are defined in the [`pyproject.toml`](pyproject.toml).

For more configuration options and details, see the [configuration docs](https://bandit.readthedocs.io/).

### docformatter

[docformatter](https://github.com/PyCQA/docformatter) is a tool designed to format docstrings to
follow [PEP 257](https://peps.python.org/pep-0257/).

Options are defined in the [`.pre-commit-config.yaml`](.pre-commit-config.yaml).

---

## Testing

We are using [pytest](https://docs.pytest.org/) & [pytest-cov](https://github.com/pytest-dev/pytest-cov) to write tests.

To run tests:

```bash
poetry run pytest tests
```

<details>

<summary>Output</summary>

```text
collected 3 items

tests/test_myservice.py::test_read_root PASSED                                             [ 33%]
tests/test_myservice.py::test_read_item_with_id_and_query PASSED                           [ 66%]
tests/test_myservice.py::test_read_item_with_id_without_query PASSED                       [100%]
```

</details>

To run tests with coverage:

```bash
poetry run pytest tests --cov=src
```

<details>

<summary>Output</summary>

```text
collected 3 items

tests/test_myservice.py::test_read_root PASSED                                             [ 33%]
tests/test_myservice.py::test_read_item_with_id_and_query PASSED                           [ 66%]
tests/test_myservice.py::test_read_item_with_id_without_query PASSED                       [100%]

---------- coverage: platform linux, python 3.10.4-final-0 -----------
Name                        Stmts   Miss  Cover
-----------------------------------------------
src/myservice/__init__.py       1      0   100%
src/myservice/main.py          15      0   100%
src/myservice/settings.py       8      0   100%
-----------------------------------------------
TOTAL                          24      0   100%
```

</details>

---

## Docker

### Build

To build the docker `production` image using [`Dockerfile`](Dockerfile):

```bash
docker build . -t my-fastapi-application:latest
```

To build the docker `development` image using [`Dockerfile`](Dockerfile):

```bash
docker build . --target development -t my-fastapi-application:dev
```

### Run

To run the FastAPI production app example using Docker:

```bash
docker run -p 8000:8000 -it --rm my-fastapi-application:latest # or :dev for development
```

### Execute command inside container

```bash
docker run -p 8000:8000 -it --rm --entrypoint /bin/bash my-fastapi-application:lastest # or :dev for development
```

---
