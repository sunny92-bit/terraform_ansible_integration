resource  "null_resource"  "ssh1" {

	triggers = {
		mytest = timestamp()
	}


	connection {
	    type     = "ssh"
	    user     = "ec2-user"
	    private_key = file("C:/Users/AVINAVA/Downloads/defy.pem")
	    host     = aws_instance.os1.public_ip
	  }



	provisioner "remote-exec" {
	    inline = [
	      "sudo useradd -G wheel ansibleuser",
#              "echo 'ansible' | passwd --stdin ansibleuser",

	    ]
	  }

# meta argument
	depends_on = [ 
			aws_instance.os1 
			]


}


resource  "null_resource"  "ssh2" {

	triggers = {
		mytest = timestamp()
	}


	connection {
	    type     = "ssh"
	    user     = "ec2-user"
	    private_key = file("C:/Users/AVINAVA/Downloads/dde.pem")
	    host     = aws_instance.os2.public_ip
	  }



	provisioner "remote-exec" {
	    inline = [
	      "sudo useradd -G wheel ansibleuser",
#              "sudo echo 'ansible' | passwd --stdin ansibleuser",


	    ]
	  }

# meta argument
	depends_on = [ 
			aws_instance.os2 
			]


}




resource  "null_resource"  "ssh3" {

	triggers = {
		mytest = timestamp()
	}


	connection {
	    type     = "ssh"
	    user     = "ec2-user"
	    private_key = file("C:/Users/AVINAVA/Downloads/ssdree.pem")
	    host     = var.ansible
	  }



	provisioner "remote-exec" {
	    inline = [
              "sudo chmod 777 /tmp/inventory",
              "sudo mv /tmp/inventory /root/ansible/inventory",
#	      "sudo cat /tmp/inventory >> /etc/ansible/hosts",
#              "ansible tf -m ping",
	    ]
	  }

# meta argument
	depends_on = [ 
			null_resource.myinventory
			]
}


resource  "null_resource"  "ansible_ping" {

	triggers = {
		mytest = timestamp()
	}


	connection {
	    type     = "ssh"
	    user     = "ec2-user"
	    private_key = file("C:/Users/AVINAVA/Downloads/zzss.pem")
	    host     = var.ansible
	  }



	provisioner "remote-exec" {
	    inline = [
              "sudo cd /root/ansible/",
              "sudo ansible tf -m ping",
	    ]
	  }

# meta argument
	depends_on = [ 
			null_resource.ssh3
			]
}


