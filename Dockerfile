FROM python:3.6

ENV TZ=Asia/Shanghai

WORKDIR /app

EXPOSE 9001

COPY requirements.txt .

RUN pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple

COPY . /app/

#CMD ["gunicorn", "aidi_cloud.wsgi:application", "-k", "gevent", "-w", "4", "-b", "0.0.0.0:9001", "--log-file", "-", "--access-logfile", "-", "--capture-output"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]