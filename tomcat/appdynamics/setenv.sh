# Set AppDynamics Java Agent environment variables using docker run -e, --env or --env-file
# https://docs.appdynamics.com/display/PRO43/Use+Environment+Variables+for+Java+Agent+Settings
export UNIQUE_HOSTID=`cat /proc/self/cgroup | awk -F '/' '{print $NF}'  | tail -n 1 | head -c12`
export CATALINA_OPTS="$CATALINA_OPTS -javaagent:/opt/appdynamics/javaagent.jar ${APPDYNAMICS_NODE_PREFIX:+-Dappdynamics.agent.reuse.nodeName=true -Dappdynamics.agent.reuse.nodeName.prefix=${APPDYNAMICS_NODE_PREFIX} -Dappdynamics.agent.uniqueHostId=${UNIQUE_HOSTID}} -Dappdynamics.analytics.agent.url=http://monitor:9090/v2/sinks/bt"
