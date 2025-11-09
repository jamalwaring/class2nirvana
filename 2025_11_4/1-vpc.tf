resource "aws_vpc" "czj-vpc" {
    cidr_block = "10.25.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        Name="czj-vpc"
        Service="vpc"
        Owner="Chewbacca"
        Planet="Mustafar"
    }
}