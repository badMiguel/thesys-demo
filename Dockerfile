FROM python:slim

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY ThesisManager/ /app/ThesisManager/

RUN pip install gunicorn

WORKDIR /app/ThesisManager/

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "ThesisManager.wsgi:application", "--workers", "3"]

# development
# CMD [ "python", "manage.py", "runserver", "0.0.0.0:8080" ]
