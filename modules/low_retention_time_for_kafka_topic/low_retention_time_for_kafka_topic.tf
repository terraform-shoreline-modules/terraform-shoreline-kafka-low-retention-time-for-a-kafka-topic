resource "shoreline_notebook" "low_retention_time_for_kafka_topic" {
  name       = "low_retention_time_for_kafka_topic"
  data       = file("${path.module}/data/low_retention_time_for_kafka_topic.json")
  depends_on = []
}

