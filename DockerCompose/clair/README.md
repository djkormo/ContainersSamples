Based on https://github.com/Charlie-belmer/Docker-security-example


# Docker-security-example
This is code and configuration files for a series on getting hands on with Docker security & [building a docker security program](https://nullsweep.com/building-a-docker-security-program/)

1. A simple example for illustrating security static analysis with Docker & Clair in the write up [docker static analysis with Clair](https://nullsweep.com/docker-static-analysis-with-clair/)
2. A look at HIDS models and container deployment best practices in [Host Based Intrusion Prevention And Detection For Docker]()

The series walks through a hands on tutorial for Docker security, starting with a threat assessment, implementing security tooling, and building a comprehensive Docker security program.



# running


docker-compose up -d


# internal testing 
docker-compose exec clair netstat -anp

docker-compose exec clairctl netstat -anp

docker-compose exec clairctl clairctl health

docker-compose exec clairctl ls -alh /var/run/docker.sock


# pulling special bad image

docker pull imiell/bad-dockerfile

# analyze

docker-compose exec clairctl clairctl analyze -l imiell/bad-dockerfile --log-level Debug --no-clean


# report

docker-compose exec clairctl clairctl report -l imiell/bad-dockerfile --log-level Debug --no-clean