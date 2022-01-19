FROM python:3.6-slim

COPY requirements.txt .
RUN python3 -m pip install -r \
    requirements.txt --quiet --no-cache-dir \
    && rm -f requirements.txt
RUN pip install ray==1.5.0 kfserving
ENV APP_HOME /app
COPY src $APP_HOME
WORKDIR $APP_HOME
ENTRYPOINT ["python"]
CMD ["kfservingdeployer.py"]