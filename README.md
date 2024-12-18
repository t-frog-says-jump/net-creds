# Net-docker-cred

**Net-docker-cred** is a simple docker application for analyzing pcap files(based https://github.com/DanMcInerney/net-creds)

## Note

Docker only supports working with pcap files on the host machine(DONT USE SHARED FOLDER).
if you are using a virtual machine mount the flash drive on it.

## Installation

Net-docker-cred can be installed with:
```bash
git clone <git_url_repo_net_docker_cred>
cd net-cred
```

You can build it using:
```bash
docker-compose build 
```

Or build and run:
```bash
docker-compose up --build
```

Stop or free up resources:
```bash
docker-compose down
```