PROJECT_NAME=scuba-dive-videos-hud
SRC=main.py Dockerfile
TARGET_DIR=target
INPUT_DIR=input

all: docker-run

docker-run: docker-build
	mkdir -p $(INPUT_DIR) $(TARGET_DIR)
	docker run --rm -v $(INPUT_DIR):/usr/src/app/input -v $(TARGET_DIR):/usr/src/app/output $(PROJECT_NAME):latest

docker-build: $(SRC)
	 docker build -t $(PROJECT_NAME):latest .

.PHONY: clean clean-target
clean:
	@echo "Cleaning the entire project..."
	rm -rf $(TARGET_DIR)
	rm -rf $(INPUT_DIR)

clean-target:
	@echo "Cleaning the target..."
	rm -rf $(TARGET_DIR)
