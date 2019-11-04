from alpine



#Install openvpn
RUN apk add openvpn
RUN apk add openssl
RUN apk add gettext

#Install EASYRSA
RUN mkdir /opt
WORKDIR /opt
RUN wget https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.4/EasyRSA-3.0.4.tgz
RUN tar zxvf EasyRSA-3.0.4.tgz


WORKDIR /openvpn

#Copy in client start
COPY openvpn/clientStart.sh .
COPY openvpn/client.conf /etc/openvpn/tpl/openvpn.tpl
RUN chmod +x clientStart.sh

CMD ["openvpn","--config","/etc/openvpn/conf/openvpn.conf"]
