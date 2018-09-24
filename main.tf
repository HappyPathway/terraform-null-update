data "external" "timestamp" {
    program = ["/usr/bin/env", "python2.7", "${path.module}/scripts/timestamp.py"]
}

resource "null_resource" "timestamp" {
  provisioner "local-exec" {
      command = "echo ${data.external.timestamp.result["timestamp"]}"
  }
}

