# appd-docker-analytics

You will need to fill in docker.env files under the svm and tomcat directories to configure the respective AppDynamics agents
Modify the docker-compose.yml for the correct path to docker.env files.

You will need to download the machine and java agents.
Rename the SVM Machine agent to machineagent.zip and place it in the svm directory.
Rename the App agent to AppServerAgent.zip and place it in the tomcat/appdynamics directory.

From the appd-docker-analytics directory:
cd svm
docker build -t appd-svm:latest .   [if you decide to tag it something else, you will have to update the docker-compose.yml]
cd ..
cd tomcat
docker build -t appd-java:latest .  [above note also applies here]
cd ..
docker-compose up -d


SVM agent:
start-appdynamics This automatically configures and enables analytics are part of the machine agent running server and docker visibility.  Everything else is set via Environment Variables.

Java agent:
setenv.sh Enables Node Prefix use, configures analytics url and set Unique_HostID to the first 12 characters of the container ID.  Everything else is set via Environment Variables.

*Note that the analytics url references 'monitor' this is the hostname mapping setup in the docker-compose.yml
