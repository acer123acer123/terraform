resource "aws_instance" "tyler" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.public.id}"
  security_groups = ["${aws_security_group.default.id}", "${aws_security_group.nat.id}", "${aws_security_group.web.id}"]
  key_name = "${aws_key_pair.deployer.key_name}"
  source_dest_check = false
  tags = { 
    Name = "tyler"
  }
  connection {
    user = "ec2-user"
    key_file = "ssh/insecure-deployer"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y ",
      "sudo yum install -y git docker",
      "sudo usermod -aG docker ec2-user",
      "sudo service docker start",
      "git clone https://github.com/acer123acer123/tyler.git ",
      "cd tyler",
      "sudo docker build -t christopherryan/tyler:v1 .",
      "sudo docker run --name=tyler -d -p 80:80 christopherryan/tyler:v1"
    ]
  }
}
