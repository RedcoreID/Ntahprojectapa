FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y wget tar ca-certificates

COPY start.sh /start.sh
COPY adguard/AdGuardHome.yaml /app/adguard/AdGuardHome.yaml

RUN chmod +x /start.sh

CMD ["/start.sh"]
