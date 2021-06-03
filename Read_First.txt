Dockerfile Explanation:

It is a file to configure, for creating a new computer without os

Step one:
	Need to install a os first like ubuntu , alpine, fedora
		eg: FROM alpine = just a simple linux nothing pre installed
		eg: FROM python:3.7-alpine = just a alpine with python pre installed
	
	alpine is a very lite linux with no features pre installed like ubuntu or fedora
	
	Important points to remember:
		1. Commands to install a os => FROM alpine
		2. This must be the first line in the Dockerfile !!
		3. Because we can't do anything without a os
Step two:
	Need to install requirements of our Application
		eg: requirements.txt
		eg: package.json
	
	Before that we need to set our working Directory, If not our app will be copied to the root of our linux
		eg: WORKDIR /usr/app
		eg: WORKDIR /myapp

	Then copy our files into docker linux
		COPY ./ ./

	Important points to remember:
		1. Must set a working directory to avoid copying of files at root of docker linux
		2. Must copy files into linux to make it work with docker
		

Step Three:
	1.Commands are to be performed after the installation of the os
		eg: RUN pip install install -r /requirements.txt
		eg: RUN npm install
		eg: CMD ['npm','start']
	2. Order of the commands are important

	Important points to remember:
		1. Must check wheather our os has preinstalled dependencies like node or python
		2. If not Fist we need to install the dependencies or we must use a os which as preinstalled dependencies in the first place
		3. After installing the dependencies only we must RUN other commands
		4. Order of all commands are impoertant, because if a command above a command is modified and built then the command below is also re executed instead of cache


Volumes:
	1. Docker volumes are references of files or folder inside our local machine which is stored inside the docker linux
	2. The purpose of using volumes is to avoid rebuilding each time when we make a change to our code