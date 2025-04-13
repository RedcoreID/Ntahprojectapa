FROM debian:bullseye-slim

# Install wget
RUN apt update && apt install -y wget && apt clean

# Copy all files
COPY start.sh /start.sh
COPY adguard /app/adguard
RUN chmod +x /start.sh

EXPOSE 53 80 3000

CMD ["/start.sh"]
