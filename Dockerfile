FROM golang:1.16 as builder

WORKDIR /go/src

COPY . .

RUN go get -d -v ./...

RUN GOOS=linux go build -a -o app .



FROM alpine:latest

WORKDIR /go/src

COPY --from=builder /go/src/app .

EXPOSE 8000

RUN chmod +x ./app

ENTRYPOINT [ "./app" ]

