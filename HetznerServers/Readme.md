init.sh  - initializes the terraform directory and upgrades plugins
plan.sh  - creates the plan and writes it in "plan" file in binary format.
apply.sh  - creates the infrastructure in the cloud according to the plan
destroy.sh  - destroys the infrastructure in the cloud. Careful with it!

Files that are not included in the repo for security reasons:
.env - contains the token for authentication in VirtualSports Production project. API token can be found in bitwarden.

create file .env like so:
export TF_VAR_hcloud_token= {API tokeн}

For AWS resources access (such as S3 bucket) you need to create a programmatic access key in your aws account
and use it on your local machine by issuing "aws configure" command where you enter your AWS access key and secret key.

Important! check those files that needs changing with every new project:
    - new tfvars file
    - plan.sh - change the project file name and workspace
    - apply.sh - change workspace
    - destroy.sh - change the project file name and workspace

