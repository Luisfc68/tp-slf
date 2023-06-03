env-build:
	docker build -t ant .

env-windows:
	for /f "usebackq tokens=*" %%p IN (`echo %cd%`) do \
		docker run -v %%p\workspace:/home/ant/workspace --name tp \
		-ti ant /bin/bash