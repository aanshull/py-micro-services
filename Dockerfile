FROM lyft/envoy:latest
RUN apt-get update && apt-get -q install -y 
    curl 
    python-pip 
    dnsutils
WORKDIR /application
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY service.py .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]
