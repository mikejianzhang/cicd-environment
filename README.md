# Setup test CI/CD environment

## Support Matrix

1. Docker Desktop for Mac (Verified: Docker:community-2.1.0.3, Kubernetes:v1.14.6)
2. Docker Desktop for Windows10 (Not verified)

## Setup the CI/CD environment on Mac

### Prerequisites

#### Configure system

1. Add local dns mapping in /etc/hosts for "mykube.com" and "docker-registry.local" to map to "127.0.0.1"
   > "mykube.com" is the local doamin for Jenkins, and "docker-registry.local" is the local domain for private docker-registry

2. If you are behind any company firewall and already set the http proxy, please add "mykube.com" and "docker-registry.local" in the no proxy list

#### Install and configure the docker desktop for Mac

1. Install the Docker Desktop for Mac and enable the Kubernetes platform
   > Suggest try to be close to the verified version

2. Add "docker-registry.local" to the "Insecure registries"
   > This is the local domain name for internal docker registry 

3. If you are behind any company firewall, configure the http proxy and add "docker-registry.local" to the "Bypass proxy" section
   
#### Install helm and sever(Tiller) of version 2.14.1 

> You need to install this version, because the Jenkins build slave installed this version. If you want to use the latest version, please update Jenkins build slave firstly

The download link of helm is at:
https://get.helm.sh/helm-v2.14.1-linux-amd64.tar.gz

The download link of kubectl is at:
https://storage.googleapis.com/kubernetes-release/release/v1.15.5/bin/linux/amd64/kubectl

### Start CI/CD environment

> If you are behind any company fireware, please update file jenkins/values-prod.yaml to add proxy information, so that jenkins plugins can be downloaded and installed:

```bash
containerEnv:
- name: http_proxy
    value: "http://xxxx"
- name: https_proxy
    value: "http://xxxx"
- name: no_proxy
    value: "localhost,127.0.0.1,mykube.com,docker-registry.local"
```

#### Startup

Run shell script "mac-start.sh" to install all necessary tools in your local cluster. Once they are started, you can access "http://mykube.com/jenkins" with default account "admin/admin888".
