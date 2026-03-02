# First Container Directory

This directory contains essential information for the first container building.

Containerfile: this is an instruction file for building the container.

# Using Containerfile

Run the following command to build the container using Containerfile.

`$ podman build --tag myfirstcontainer .`

Run the following command to run a container using the image built from the previous step.

`$ podman run --detach --name mywebcontainer --publish 8080:80 myfirstcontainer`