FROM docker.io/golang:alpine3.17 AS build
RUN apk add --no-cache git
RUN git clone https://github.com/packwiz/packwiz.git /build
WORKDIR /build
RUN go mod download
RUN go build

FROM docker.io/alpine:3.17
RUN mkdir /app
COPY --from=build /build/packwiz /app/
EXPOSE 8080
WORKDIR /data
CMD [ "/app/packwiz", "serve" ]
COPY . .
