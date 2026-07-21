FROM --platform=amd64 golang:1.25-alpine AS build
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o main .


FROM --platform=amd64 scratch
COPY --from=build /app/main /main
EXPOSE 8080
ENV SERVER_PORT=8080
ENTRYPOINT ["/main"]