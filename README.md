# The first step I created Terraform recipe, which deploys two EC2 instances, and added the ability to connect via HTTP and SSH (using private key).

provider "aws" {
  access_key = "AKIASYU5GPSU6JDMAMXP"
  secret_key = "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"
  region     = "eu-central-1"
}

resource "aws_instance" "Ubuntu_1_1" {
  ami           = "ami-0a49b025fffbbdac6"
  instance_type = "t3.micro"
  key_name      = "my_key"
}


# The second step, I created a docker image that shows IPv4 EC2 instace

FROM nginx:mainline-alpine
RUN chmod -R a+w /var/cache/nginx/ \
        && touch /var/run/nginx.pid \
        && chmod a+w /var/run/nginx.pid \
        && rm /etc/nginx/conf.d/*


COPY index.html /usr/share/nginx/html/
EXPOSE 8080
USER nginx

# The last step I tried to do the docker image deployments using ansible 
[defaults]
hostfile = ~/ansible/inventory
sudo_user = root
log_path = ~/ansible/logs/ansible.log

[experiments]
ec2-3-71-71-60.eu-central-1.compute.amazonaws.com
