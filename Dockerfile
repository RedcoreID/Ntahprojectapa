FROM pihole/pihole:latest

ENV ServerIP=0.0.0.0
ENV WEBPASSWORD=Admin123
ENV DNS1=1.1.1.1
ENV DNS2=1.0.0.1

COPY ./pihole/pihole.conf /etc/pihole/

EXPOSE 80

CMD ["/start.sh"]
