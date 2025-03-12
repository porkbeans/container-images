ifndef TAG
$(error TAG is not defined)
endif

ifndef PYTHON_VERSION
$(error PYTHON_VERSION is not defined)
endif

.PHONY: build run dive push clean clean-all

build:
	docker buildx build \
		--tag "$(TAG)" \
		--build-arg "PYTHON_VERSION=$(PYTHON_VERSION)" \
		--debug \
		--progress plain \
		--load .
	make clean

run:
	docker run -it --rm "$(TAG)"

dive:
	dive "$(TAG)"

push:
	docker buildx build \
		--tag "$(TAG)" \
		--build-arg "PYTHON_VERSION=$(PYTHON_VERSION)" \
		--platform linux/amd64,linux/arm64 \
		--provenance=false \
		--push .

clean:
	docker image prune -f

clean-all:
	docker buildx prune -f
