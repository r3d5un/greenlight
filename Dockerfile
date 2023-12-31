FROM golang:1.20.6-alpine

WORKDIR /app

COPY . /app
RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build ./cmd/api

EXPOSE 8080

CMD [ "./api" ]

