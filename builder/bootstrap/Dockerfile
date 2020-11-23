FROM debian:stretch

RUN apt -q -y update\
 && apt -q -y install\
	automake\
	bash\
	bison\
	flex\
	git\
	gperf\
	python\
 && apt clean
CMD /bin/bash
