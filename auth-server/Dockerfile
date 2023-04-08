FROM python3
WORKDIR /app
COPY . ./app
COPY ./requirements.txt ./app/requirements.txt
RUN pip install -r requirements
CMD ["python", "main.py"]