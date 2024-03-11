FROM python:3.11 AS builder
COPY requirements.txt .
RUN pip install --user -r requirements.txt
FROM python:3.11-slim
WORKDIR /code
COPY --from=builder /root/.local /root/.local
COPY ./lab3.py .
ENV PATH=/root/.local:$PATH
CMD [ "python", "-u", "./lab3.py" ]                                                                                                                                                                                                                                                                 