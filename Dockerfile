FROM rust:1.67 as builder
COPY . .
ENV SALUT "HAHAH c'est ouf"
RUN cargo build --release

FROM debian:bullseye-slim
#RUN apt-get update && apt-get install -y extra-runtime-dependencies && rm -rf /var/lib/apt/lists/*
COPY --from=builder target/release/CI ./app
CMD ["./app"]
