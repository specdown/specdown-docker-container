FROM ubuntu AS downloader

RUN apt update && apt install -y curl

RUN curl -L https://github.com/specdown/specdown/releases/download/$VERSION/specdown-x86_64-unknown-linux-gnu --output /specdown

FROM ubuntu

COPY --from=downloader /specdown /usr/bin/specdown

RUN chmod +x /usr/bin/specdown
