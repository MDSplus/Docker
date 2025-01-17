FROM debian:bullseye

RUN apt -q -y update\
 && apt -q -y install\
	automake\
	bash\
	bison\
	flex\
	git\
	gperf\
	python3\
 && apt clean
CMD [ "/bin/bash" ]
