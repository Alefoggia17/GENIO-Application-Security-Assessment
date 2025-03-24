# GENIO-Application-Security-Assessment

The implemented tool consists of an orchestrator for open-source tools dedicated to static and dynamic software analysis. The tool automates the execution of security and code quality analysis, integrating several third-party state-of-the-art tools into a single workflow. Its main purpose is to simplify and standardize the use of existing analysis tools, providing a common and configurable interface to perform analysis on Docker containers and related images.

## Container Security

The goal of this project is to analyze container images in a complete way, focusing on both static and dynamic analysis, and also including some monitoring activities. This is achieved with the creation of workflows that leverage several open-source tools. <br>

The repository contains three main folders: <b>static</b>, <b>dynamic</b> and <b>monitoring</b>. Each folder contains a description, an installation guide and some usage examples. <br>

In order for the scripts to work some programs need to be installed. While it might seem a bit tedious or overwhelming at first, most of these tools are quick and easy to set up, and not all of them are required (Eg. If a user is only interested in the static analysis of python applications he  can download the tools required for that workflow). 

<h2>Before reading</h2>
All the scripts in this repository use docker to perform certain tasks. Run a simple test with <code>docker ps</code>; if you get an error like this: <br><br>
<code>permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock</code> <br> <br>
it means the current user doesn't have enough privileges, so you can either run the scripts with sudo or add the current user to the docker group (https://stackoverflow.com/questions/48957195/how-to-fix-docker-got-permission-denied-issue).
