FROM golang:1.16 as builder

WORKDIR /go/src

COPY . .

RUN go get -d -v ./...

RUN go build -a -o app .


FROM alpine:latest

COPY --from=builder /go/src/app .

EXPOSE 8000

CMD [ "./app" ]

