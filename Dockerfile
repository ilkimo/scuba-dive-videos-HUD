FROM python:3.8

WORKDIR /usr/src/app
#COPY Pipfile Pipfile.lock ./

RUN pip install --no-cache-dir pipenv
RUN if [ -f Pipfile ]; then pipenv install --deploy --ignore-pipfile; else pipenv --python 3.8 install; fi

COPY . .

CMD ["pipenv", "run", "python", "main.py"]
