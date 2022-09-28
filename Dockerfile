FROM python:3.10
WORKDIR /test-python-app
COPY . .
RUN pip install -r requirements.txt
EXPOSE 8080
CMD ["python", "app.py"]