FROM docker.io/golang:alpine3.17 AS build
RUN apk add --no-cache git
RUN git clone https://github.com/packwiz/packwiz.git /build
WORKDIR /build
RUN go mod download
RUN go build

FROM docker.io/alpine:3.17
EXPOSE 8080
WORKDIR /data
CMD [ "/bin/pacstrapwiz" ]
RUN echo "#!/bin/sh\ngit clone -b v2 https://github.com/nekosmp/nsmp-modpack .\npackwiz serve" >> /bin/pacstrapwiz && chmod +x /bin/pacstrapwiz
RUN apk add --no-cache git
COPY --from=build /build/packwiz /bin/packwiz