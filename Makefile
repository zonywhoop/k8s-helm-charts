all: charts index

.PHONY: charts
charts:
	@helm package argus --destination docs
	@helm repo index docs --url=https://zonywhoop.github.io/k8s-helm-charts
	@helm package releasemanager --destination docs
	@helm repo index docs --url=https://zonywhoop.github.io/k8s-release-manager
	@helm package collectorset-controller --destination docs
	@helm repo index docs --url=https://zonywhoop.github.io/k8s-helm-charts

index:
	helm repo index ./ --url https://zonywhoop.github.io/k8s-helm-charts
	sed -i '' 's/\/docs//' index.yaml
	mv index.yaml ./docs
