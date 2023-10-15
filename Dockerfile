FROM getchoo/packwiz-serve:latest
WORKDIR /data
COPY . .
RUN packwiz 
