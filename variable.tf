variable "instance_name" {
	default =  [ "aw1app01a", "aw1fe01a" ]
	type = list(string)
}


variable "amiId" {}
         

variable "AWS_REGION" {}

variable "ansible" {
       default = "3.110.196.206"

}
