# Openvpn Server and client for Docker and Kubernetes


This is a small setup to use openvpn server and client.
I use them to connect kubernetes to kubernetes ore docker to kubernetes cluster

### Fetures

- Simple generat of certs
- Auto setup of heöm secrets
- Simple run in docker with docker-compose
- Helm deploys of server and client



## How to get started

Lets build it 


```
 docker-compose build
```

First we need to generate certs and setup heöm secrest for the server and the client

```
docker-compose  run openvpn-server ./setup.sh
```

This will generate and setup the certs neede for openvpn.
Follow the screen and respond to questions

#### Do not change names of server and client this will breake the cert generation.


Now we should hava a working PKI and helm charts so lets run in.


## Run it openvpn server

With docker-compose

```
docker-compose up 
```

With helm

```
helm install openvpn/helm/openvpn-server/ --name openvpn
```

