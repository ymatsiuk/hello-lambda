FROM golang:1.18 as builder
WORKDIR /function
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o function .

FROM amazon/aws-lambda-go
COPY --from=builder /function/function /var/task
CMD [ "function" ]
