FROM golang:alpine as builder
RUN go env -w GO111MODULE=on
RUN go env -w GOPROXY=https://goproxy.cn,https://goproxy.io,direct

WORKDIR $GOPATH/src/ginblog
COPY . $GOPATH/src/ginblog

RUN go build .

EXPOSE 3000

ENTRYPOINT ["./ginblog"]