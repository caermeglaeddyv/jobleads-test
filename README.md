Task
====

Given simple counter application that uses Redis as a backend storage to keep 
the persistent counter.

#### API:

    GET / - returns current counter number
    POST /increment - increments the counter
    DELETE /increment - resets the counter

#### Run configuration:

`server.py` - main application entrypoint. 
Server can be started via command: `pipenv run python server.py`

Dependencies
------------

- All the python dependencies MUST be installed via pipenv
- Application uses Redis as a backend storage

Expectations
------------

- Dockerfile is provided as application run environment
- Application running in Docker Swarm / Kubernetes stack / etc. (feel free to choose orchestrator)
- Stack can be deployed locally running single bash script / command (prerequisites provided if something needs to be installed)
- Application is located behind load-balancer and can be reachable via domain name from host (e.g. http://counter-app.local)
- Application is scalable and fault tolerant (killing single node will not result into application is down)
- Application can be easily configured via ENV variables (feel free to propose updates into application if needed)
