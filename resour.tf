resource "aws_instance" "os1" {	
	ami = var.amiId 
	key_name = "terra_may"
        vpc_security_group_ids = [ "sg-0caa3d4471e98ba7c" ]
	instance_type  =  "t2.micro"
	tags  =  {  
			Name = var.instance_name[0]
		}
}

resource "aws_instance" "os2" {	
	ami = var.amiId 
	key_name = "terra_may"
        vpc_security_group_ids = [ "sg-0caa3d4471e98ba7c" ]
	instance_type  =  "t2.micro"
	tags  =  {  
			Name = var.instance_name[1]
		}
}

resource "aws_ebs_volume" "myvol" {
  availability_zone = aws_instance.os1.availability_zone
  size              = 1

  tags = {
    Name = var.instance_name[1]
  }
}

resource "aws_volume_attachment" "my_ebs_attach_ec2" {
  force_detach = true
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.myvol.id
  instance_id = aws_instance.os1.id
}