SHELL := /bin/bash
SERVER_PATH := /srv/http

ARROW := \033[1m\033[31m>\033[32m>\033[33m>\033[39m
CL_GREEN := \033[32m
CL_RESET := \033[39m

local:
	@ echo -e "${ARROW} Creating local server..."
	@
	@ # Overriding the ownership of every server files
	@ sudo chown -R $(shell whoami) /srv/http/*
	@ rm -rf $(SERVER_PATH)/*
	@ echo -e "[${CL_GREEN}OK${CL_RESET}] Server cleared"
	@
	@ # Copy files
	@ cp -r * $(SERVER_PATH)
	@ echo -e "[${CL_GREEN}OK${CL_RESET}] File copied"
	@
	@ # Compile scss file
	@ sass $(SERVER_PATH)/main.scss $(SERVER_PATH)/main.css
	@
	@ echo -e "[${CL_GREEN}OK${CL_RESET}] Done! http://localhost"