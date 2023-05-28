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
	echo 'https://'$$(minikube ip)':80' | pbcopy