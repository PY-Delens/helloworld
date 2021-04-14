FROM python:3.8

WORKDIR /app

RUN pip install poetry

ADD pyproject.toml poetry.lock main.py /app/

RUN poetry install

ENV FLASK_APP=main:app

EXPOSE 80

CMD [ "/usr/local/bin/poetry", "run", "flask", "run", "--host", "0.0.0.0", "--port", "80" ]
