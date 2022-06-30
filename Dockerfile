FROM golang:1.16-alpine

RUN apk add --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing --repository http://dl-3.alpinelinux.org/alpine/edge/main vips-dev
RUN apk add build-base

RUN mkdir /app
RUN mkdir /app/logs

ADD . /app

WORKDIR /app

RUN go get -u github.com/h2non/bimg

RUN go build -o . cmd/main.go

CMD ["/app/main"]