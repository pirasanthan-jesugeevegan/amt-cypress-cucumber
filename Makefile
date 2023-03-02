docker:
	docker build -t web-ui-amt:latest -f Dockerfile .
run:	
	docker run web-ui-amt:latest npm run cypress:run