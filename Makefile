start:
	minikube start
	helm install app ./app-chart
	sleep 30
	make info

delete:
	minikube delete

restart:
	make delete
	make start

info:
	kubectl get services
	kubectl get deployments
	kubectl get pods
	minikube ip

test:
	kubectl port-forward svc/postgres-service 5432:5432 &
	kubectl port-forward svc/frontend-app-service-app 8080:80 &
	kubectl port-forward svc/backend-app-service-app 3000:3000 &
	pbcopy http://localhost:8080