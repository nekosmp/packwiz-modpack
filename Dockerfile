FROM docker.io/golang:alpine3.17 AS build

RUN apk add --no-cache git=2.38.3-r1

RUN git clone https://github.com/packwiz/packwiz.git /build

WORKDIR /build
RUN go mod download
RUN go build

FROM docker.io/alpine:3.17

RUN mkdir /app
COPY --from=build /build/packwiz /app/

EXPOSE 8080

WORKDIR /data
COPY . .
