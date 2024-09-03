## Kubernetes with PHP and NGINX

### Development Environment Setup with Persistent Volumes (PV) and Persistent Volume Claims (PVC)

This setup is designed to facilitate a development environment where the project folder from the host machine is mounted into the `demo-app` pods running in a Kubernetes cluster. By using Kubernetes Persistent Volumes (PV) and Persistent Volume Claims (PVC), the project folder is integrated into the running pods, allowing for easy updates and testing during development once the code is saved.

### Key Features:
- **Persistent Volume (PV)**: A Persistent Volume is configured to map to a specific directory on the host machine, where the project's source code resides. This volume acts as a persistent storage location accessible to the Kubernetes cluster.

- **Persistent Volume Claim (PVC)**: The PVC is a request for storage by the `demo-app` pods. It binds to the PV, ensuring that the pods have access to the project folder's content.

- **Mounted Project Folder**: The project folder on the host machine is directly mounted into the `/var/www/html` directory of each `demo-app` pod. Changes to the codebase are accessible in the running application after the code is saved and the application or pod is refreshed.

**Install Docker, Kubectl, Minikube**

Build docker image
```bash
docker build -t demo-app:latest -f docker/php.Dockerfile .
```

Start Minikube

```bash 
minikube start
```

Mount your computers project root to minikube
```bash
minikube mount /path/to/your/kubernetes-demo:/mnt/data
```

Deploying Kubernetes
```bash
bin/start-pods.sh
```

Copy NGINX config to pod.
```bash
kubectl get pods -l app=nginx

kubectl cp /path/to/docker/nginx-conf <nginx-pod-name>:/etc/nginx/conf.d
```

Reload NGINX config 
```bash 
kubectl exec -it <nginx-pod-name> -- nginx -s reload
```

