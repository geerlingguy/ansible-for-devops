
CORES := 3

BOXES = $(shell vagrant status | \
awk ' \
BEGIN{ tog=0; } \
/^$$/{ tog=!tog; } \
/./ { if(tog){print $$1} }')

deps: ## Install required roles to spawn the cluster
	ansible-galaxy install -r requirements.yml -p ./roles
	ansible-galaxy install -r example-requirements.yml -p ./roles

start: ## Start the cluster
	vagrant up

start_parallel: ## Start the cluster in parallel
	printf "$(BOXES)" | xargs -d' ' -P$(CORES) -I {} vagrant up {}

halt: ## Halt the cluster
	vagrant halt

halt_parallel: ## Halt the cluster in parallel
	printf '$(BOXES)' | xargs -d' ' -P$(CORES) -I {} vagrant halt {}

stop: ## Stop and remove the cluster
	vagrant destroy -f

add_host: ## Add cluster.k8s.test to the /etc/hosts
	ansible-playbook examples/host-setup.yml

example_nginx: ## Deploy the nginx example
	ansible-playbook -i inventory examples/k8s-module.yml

example_nginx_clean: ## Undeploy the nginx example
	ansible-playbook -i inventory examples/k8s-module-cleanup.yml

example_helm: ## Deploy the helm example
	ansible-playbook -i inventory examples/helm.yml

example_helm_clean: ## Undeploy the helm example
	ansible-playbook -i inventory examples/helm-cleanup.yml

example_kubectl_conn: ##
	ansible-playbook -i inventory examples/kubectl-connection.yml

