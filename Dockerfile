FROM getchoo/packwiz-serve:latest
WORKDIR /data
COPY . .
RUN ls -la /data
