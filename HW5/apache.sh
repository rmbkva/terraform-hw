#!/bin/bash
sudo yum update
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd

 #sudo echo "Hello World" > /var/www/html/index.html
 #Got the Hello World 

 #!/bin/bash 
sudo apt ubdate
sudo apt install apache2 -y 
sudo systemctl start apache2
sudo systemctl enable apache2 