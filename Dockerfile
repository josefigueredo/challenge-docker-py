FROM python:3.4

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

ENV FLASK_APP=main.py
ENV FLASK_ENV=development

COPY main.py main.py

EXPOSE 8080

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=8080"]