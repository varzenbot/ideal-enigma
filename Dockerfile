FROM golang:alpine

WORKDIR /app

COPY go.mod .
RUN go mod download

COPY main.go .
RUN go build -o hello_web .

EXPOSE 8080

CMD ["./hello_web"]