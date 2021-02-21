# Build 
FROM golang:stretch AS builder
WORKDIR /go/src/app
COPY . .
ENV GO113MODULE=on
RUN go build -o server ./cmd/main.go

# Cloud Run
FROM gcr.io/distroless/base
COPY --from=builder /go/src/app/server /app
ENV PORT=${PORT}
ENTRYPOINT [ "/app" ]
CMD [ "/server" ]