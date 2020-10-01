## Testing prometheues

This repo is based on [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) helm chart

### Dependencies:

- Docker
- Homebrew
- Kubectl
- Helm

### How to use:
* download the repo
```bash
git clone https://github.com/yotamloe/testing_prometheus.git
cd testing_prometheus
```
* Edit `helm_vals.yaml` file with your configuration

* Run the script to set up the enviroment
```bash
chmod +x script.sh
./script.sh
```

#### When you see this response you are good to go 🚀

```bash
Forwarding from 127.0.0.1:9090 -> 9090
Forwarding from [::1]:9090 -> 9090
Forwarding from 127.0.0.1:3000 -> 3000
Forwarding from [::1]:3000 -> 3000
```

#### Link to prometheus:

[http://localhost:9090/graph](http://localhost:9090/graph)

#### Link to grafana:

[http://localhost:3000/](http://localhost:3000/)

```yaml
username: admin
password: prom-operator
```