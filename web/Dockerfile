FROM python:3.10
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
EXPOSE 8000
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
# RUN python manage.py collectstatic
CMD ["gunicorn", "project.wsgi:application", "--bind", "0.0.0.0:8000"]