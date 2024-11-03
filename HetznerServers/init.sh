#!/bin/bash -e
export AWS_PROFILE=sas2_prod # change it to the name of the project.
terraform init -upgrade -reconfigure