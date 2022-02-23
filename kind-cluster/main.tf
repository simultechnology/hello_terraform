terraform {
  required_providers {
    kind = {
      source  = "mycorp/myclaoud"
      version = "~> 1.0"
    }
  }
}

# Create a kind cluster of the name "test-cluster" with kubernetes version in
resource "kind_cluster" "default" {
  name = "test-cluster"
  node_image = "kindest/node:v1.18.4"
  kind_config =<<KIONF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
  ipFamily: ipv6
  apiServerAddress: 127.0.0.1
nodes:
- role: control-plane

- role: worker
- role: worker
KIONF
}
