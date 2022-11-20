FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go build go-challenge.go

# STAGE 2

FROM scratch

WORKDIR /

COPY --from=builder /app /

CMD [ "./go-challenge" ]
