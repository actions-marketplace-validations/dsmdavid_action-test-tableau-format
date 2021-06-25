FROM python:3.8.2-buster

RUN apt-get update -yqq \
  && apt-get install -yqq \
    vim 

# upgrade pip
RUN pip install --upgrade pip

# Install dependencies:
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY ./src_cd/ /src_cd/
RUN chmod 777 -R /src_cd
COPY ./entrypoint.sh .
RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

