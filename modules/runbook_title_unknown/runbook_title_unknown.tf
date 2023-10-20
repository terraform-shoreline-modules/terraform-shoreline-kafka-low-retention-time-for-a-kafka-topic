resource "shoreline_notebook" "runbook_title_unknown" {
  name       = "runbook_title_unknown"
  data       = file("${path.module}/data/runbook_title_unknown.json")
  depends_on = [shoreline_action.invoke_modify_retention_size]
}

resource "shoreline_file" "modify_retention_size" {
  name             = "modify_retention_size"
  input_file       = "${path.module}/data/modify_retention_size.sh"
  md5              = filemd5("${path.module}/data/modify_retention_size.sh")
  description      = "Increase the retention size of the Kafka topic by modifying the configuration file."
  destination_path = "/tmp/modify_retention_size.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_modify_retention_size" {
  name        = "invoke_modify_retention_size"
  description = "Increase the retention size of the Kafka topic by modifying the configuration file."
  command     = "`chmod +x /tmp/modify_retention_size.sh && /tmp/modify_retention_size.sh`"
  params      = ["PATH_TO_KAFKA_CONFIG_FILE","TOPIC_NAME"]
  file_deps   = ["modify_retention_size"]
  enabled     = true
  depends_on  = [shoreline_file.modify_retention_size]
}

