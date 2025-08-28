# Build stage
FROM golang:1.21-alpine AS builder

WORKDIR /app
COPY . .

# Install dependencies
RUN go mod download

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -o discord-security-connector ./cmd/server

# Final stage
FROM alpine:latest

RUN apk --no-cache add ca-certificates tzdata
WORKDIR /root/

# Copy the binary from builder
COPY --from=builder /app/discord-security-connector .
COPY --from=builder /app/configs ./configs

# Create a non-root user
RUN adduser -D -g '' appuser
USER appuser

EXPOSE 8080
CMD ["./discord-security-connector"]