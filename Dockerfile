FROM python:3

RUN pip install --upgrade pip 
RUN pip install paho-mqtt 
RUN pip install influxdb 
	
ENV INFLUXDB_HOST=192.168.50.4
ENV INFLUXDB_PORT=8086
ENV INFLUXDB_DB=weatherstation

COPY listen.py /usr/local/bin
CMD python /usr/local/bin/listen.py --influxdb --influxdb_host=$INFLUXDB_HOST --influxdb_port=$INFLUXDB_PORT --influxdb_db=$INFLUXDB_DB -M 2>&1 > /var/log/weatherflow.log
