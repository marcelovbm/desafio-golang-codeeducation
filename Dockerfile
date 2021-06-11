FROM golang:1.16.5 AS builder

WORKDIR $GOPATH/src/mypackage/myapp/

COPY . .

RUN go build -o /go/bin/desafio

FROM scratch

COPY --from=builder /go/bin/desafio /go/bin/desafio

ENTRYPOINT ["/go/bin/desafio"]