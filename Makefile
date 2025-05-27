.PHONY: base-images clean

base-images: runner-full go-full node-full

clean:
	rm *.tar
	rm sbom-*

# ===========================================================   BASE RUNNER

runner-full: runner-build runner-push clean

runner-build:
	apko build apko/base-runner.yaml base-runner:latest base-runner.tar
	docker load -i base-runner.tar

	docker tag base-runner:latest-amd64 base-runner:latest
	docker tag base-runner:latest ghcr.io/jomaro/base-runner:latest

runner-push:
	docker push ghcr.io/jomaro/base-runner:latest


# ===========================================================   GO BUILDER

go-full: go-build go-push clean

go-build:
	apko build apko/go-builder.yaml go-builder:latest go-builder.tar
	docker load -i go-builder.tar

	docker tag go-builder:latest-amd64 go-builder:latest
	docker tag go-builder:latest-amd64 ghcr.io/jomaro/go-builder:latest

go-push:
	docker push ghcr.io/jomaro/go-builder:latest


# ===========================================================   NODE BUILDER

node-full: node-build node-push clean

node-build:
	apko build apko/node-builder.yaml node-builder:latest node-builder.tar
	docker load -i node-builder.tar

	docker tag node-builder:latest-amd64 node-builder:latest
	docker tag node-builder:latest-amd64 ghcr.io/jomaro/node-builder:latest

node-push:
	docker push ghcr.io/jomaro/node-builder:latest
