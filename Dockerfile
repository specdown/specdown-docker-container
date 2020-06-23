FROM ubuntu AS downloader

RUN apt update && apt install -y curl

RUN if [ -z "$VERSION" ]; then \
        curl -L https://github.com/specdown/specdown/releases/latest/specdown-x86_64-unknown-linux-gnu --output /specdown; \
    else \
	curl -L https://github.com/specdown/specdown/releases/download/$VERSION/specdown-x86_64-unknown-linux-gnu --output /specdown; \
    fi

FROM ubuntu

COPY --from=downloader /specdown /usr/bin/specdown

RUN chmod +x /usr/bin/specdown
