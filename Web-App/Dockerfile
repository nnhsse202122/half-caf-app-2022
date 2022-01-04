FROM python:3.6-alpine
RUN adduser -D half-caf-web-app
WORKDIR /home/half-caf-web-app
COPY requirements.txt requirements.txt
RUN python -m venv env
RUN env/bin/pip install -r requirements.txt
RUN env/bin/pip install gunicorn
COPY theapp.py .env config.py boot.sh ./
RUN chmod +x boot.sh
ENV FLASK_APP theapp.py
RUN chown -R half-caf-web-app:half-caf-web-app ./
RUN apk add gcc
RUN apk add --no-cache libressl-dev musl-dev libffi-dev
RUN env/bin/pip install --no-cache-dir cryptography
USER half-caf-web-app
EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
