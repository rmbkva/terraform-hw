# terraform-hw
They are text files with a .tfvars extension that contain sensetive info of variable and their corresponding values.

.tfvars file has more priorety comparing with mait.tf file and it will overwrite the values in main.tf file .
Working with .tfvars files can make it easier to manage and reuse input variables across multiple configurations.

To set lots of variables, it is more convenient to specify their values in a variable definitions file (with a filename ending in either .tfvars ) and then specify that file on the command line with -var-file:
terraform apply -var-file=testing.tfvars
the same as with destroy :terraform destroy -var-file=testing.tfvars

