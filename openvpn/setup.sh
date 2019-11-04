#sh
echo "Init pki"
/opt/EasyRSA-3.0.4/easyrsa init-pki
/opt/EasyRSA-3.0.4/easyrsa build-ca nopass
openvpn --genkey --secret pki/ta.key
/opt/EasyRSA-3.0.4/easyrsa gen-dh


echo "Setup Server Certs"
/opt/EasyRSA-3.0.4/easyrsa gen-req server nopass
/opt/EasyRSA-3.0.4/easyrsa sign-req server server


echo "Setup Client Certs"
/opt/EasyRSA-3.0.4/easyrsa gen-req client1 nopass
/opt/EasyRSA-3.0.4/easyrsa sign-req client client1

echo "Settings key into ENV"
#Server certs
export takey=`cat pki/ta.key | base64 | sed ':a;N;$!ba;s/\n/ /g' | sed 's/ //g'`
export serverkey=`cat pki/private/server.key | base64 | sed ':a;N;$!ba;s/\n/ /g' | sed 's/ //g'`
export servercrt=`cat pki/issued/server.crt | base64 | sed ':a;N;$!ba;s/\n/ /g' | sed 's/ //g'`
export cacrt=`cat pki/ca.crt | base64 | sed ':a;N;$!ba;s/\n/ /g' | sed 's/ //g'`
export dhpem=`cat pki/dh.pem | base64 | sed ':a;N;$!ba;s/\n/ /g' | sed 's/ //g'`



#Client certs
export clientkey=`cat pki/private/client1.key | base64 | sed ':a;N;$!ba;s/\n/ /g' | sed 's/ //g'`
export clientcrt=`cat pki/issued/client1.crt | base64 | sed ':a;N;$!ba;s/\n/ /g' | sed 's/ //g'`


env
echo "Generating helm secrets file"

envsubst < "/openvpn/helmTemplates/server_secrets.yaml" > "/openvpn/helm/openvpn-server/templates/server_secrets.yaml"
envsubst < "/openvpn/helmTemplt_secret.yaml" > "/openvpn/helm/openvpn-client/templates/client_secret.yaml"