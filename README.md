# ansible-test-lab
[![License](http://img.shields.io/:license-mit-blue.svg)](https://github.com/master-of-servers/ansible-test-lab/blob/master/LICENSE)

Used to create a test lab that can be used to work with MOSE and Ansible.

**Warning, take heed: This lab should be run in a controlled environment; it contains vulnerable assets.**

## Dependencies
You must download and install the following for this environment to work:
* [Docker](https://docs.docker.com/install/)
* [Docker Compose](https://docs.docker.com/compose/install/)

## Basic Lab Build Instructions
To create an environment with an ansible control node that manages a single node with a simple hello world playbook, run the following command:
```
cd basic && make run
```

To tear down the lab, run the following command:
```
make destroy
```