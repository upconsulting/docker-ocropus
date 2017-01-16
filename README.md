# Docker container for running Ocropus

## Installation
- download or clone this repository
- cd into `docker-ocropus` directory
- run `docker build -t ocropus .`

To test the installation run:
`docker run ocropus ./run-test`

This should run Ocropus' tests.

Docker will mount a `/data` folder in the container that you need to map on to your data folder on the host system when running the container.

Any commands parsed to the container will be executed from the folder `/ocropy`.

## Usage
To use this docker image run docker appending the Ocropus command you want to execute like this;
`docker run -v [path/to/your/ocropus/data/folder]:/data ocropus [docker command]'

for example:
`docker run -v /my/data/folder/path:/data ocropus ./ocropus-nlbin /data/ersch.png -o book`
