
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Low Retention Time for Kafka Topic.
---

This incident type occurs when the retention time for a Kafka topic is too low. Kafka is a distributed streaming platform that is commonly used for building real-time data pipelines and streaming applications. The retention time determines how long Kafka will retain messages in a topic before they are deleted. If the retention time is too low, it can cause issues such as data loss or incomplete processing of messages. Increasing the retention time can help prevent these problems and ensure that messages are available for processing for a longer period of time.

### Parameters
```shell
export BROKER_HOST="PLACEHOLDER"

export BROKER_PORT="PLACEHOLDER"

export TOPIC_NAME="PLACEHOLDER"

export ZOOKEEPER_PORT="PLACEHOLDER"

export ZOOKEEPER_HOST="PLACEHOLDER"

export NEW_RETENTION_TIME_MS="PLACEHOLDER"

export BROKER_LOG_DIRECTORY="PLACEHOLDER"

export LOG_FILE_NAME="PLACEHOLDER"
```

## Debug

### Connect to the Kafka broker
```shell
kafka-console-consumer.sh --bootstrap-server ${BROKER_HOST}:${BROKER_PORT} --topic ${TOPIC_NAME}
```

### Check the retention time for the topic
```shell
kafka-topics.sh --zookeeper ${ZOOKEEPER_HOST}:${ZOOKEEPER_PORT} --describe --topic ${TOPIC_NAME}
```

### Check the disk space usage for the broker
```shell
df -h
```

### Check the partition and replication factor for the topic
```shell
kafka-topics.sh --zookeeper ${ZOOKEEPER_HOST}:${ZOOKEEPER_PORT} --describe --topic ${TOPIC_NAME}
```

### Check the broker log directory for any issues
```shell
ls -l ${BROKER_LOG_DIRECTORY}
```

### Check the broker logs for any errors or warnings
```shell
tail -f ${BROKER_LOG_DIRECTORY}/${LOG_FILE_NAME}
```

### Increase the retention time for the topic
```shell
kafka-topics.sh --zookeeper ${ZOOKEEPER_HOST}:${ZOOKEEPER_PORT} --alter --topic ${TOPIC_NAME} --config retention.ms=${NEW_RETENTION_TIME_MS}
```