resource "null_resource" "control_node" {
  provisioner "local-exec" {
    command = "cd control_node && vagrant up"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

resource "null_resource" "managed_node_1" {
  provisioner "local-exec" {
    command = "cd managed_node_1 && vagrant up"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

resource "null_resource" "managed_node_2" {
  provisioner "local-exec" {
    command = "cd managed_node_2 && vagrant up"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

resource "null_resource" "managed_node_3" {
  provisioner "local-exec" {
    command = "cd managed_node_3 && vagrant up"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}