.PHONY: all run_dev_web run_dev_mobile run_unit clean upgrade lint format build_dev_mobile help

all: lint format run_dev_mobile

help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done

run_test: ## Runs unit tests
	@echo "╠ Running the tests"
	@flutter test || (echo "Error while running tests"; exit 1)

clean: ## Cleans the environment
	@echo "╠ Cleaning the project..."
	@rm -rf pubspec.lock
	@flutter clean

get: ## Get all dependencies
	@echo "╠Getting all dependencies..."
	@flutter pub get

format: ## Formats the code
	@echo "╠ Formatting the code"
	@flutter format --set-exit-if-changed .

lint: ## Lints the code
	@echo "╠ Verifying code..."
	@dart analyze . || (echo "▓▓ Lint error ▓▓"; exit 1)

upgrade: clean ## Upgrades dependencies
	@echo "╠ Upgrading dependencies..."
	@flutter pub upgrade

commit: format lint run_unit
	@echo "╠ Committing..."
	git add .
	git commit

run_dev_mobile: ## Runs the mobile application in dev
	@echo "╠ Running the app"
	@flutter run --dart-define=ENVIRONMENT=dev

run_staging_mobile: ## Runs the mobile application in staging
	@echo "╠ Running the app"
	@flutter run --dart-define=ENVIRONMENT=staging

run_production_mobile: ## Runs the mobile application in production
	@echo "╠ Running the app"
	@flutter run --dart-define=ENVIRONMENT=production

#run_dev_mobile: ## Runs the mobile application in dev
#	@echo "╠ Running the app"
#	@flutter run --flavor dev

build_dev_mobile: clean run_unit
	@echo "╠  Building the app"
	@flutter build apk --flavor dev
