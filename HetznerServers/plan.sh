#!/bin/bash -e

source .env

usage() {
    echo "Usage: $0 -e project_name" 1>&2
}

exit_abnormal() {
    usage
    exit 1
}

while getopts ":e:" options; do
    case "${options}" in
    e)
        ENV=${OPTARG}
        ;;
    *)
        exit_abnormal
        ;;
    esac
done

if [ -z "$ENV" ]; then
  echo "Project name is missing!"
  exit_abnormal
fi

export AWS_PROFILE=$ENV

echo "Select workspace: $ENV"
terraform workspace select $ENV

echo "Format source code"
terraform fmt

echo "Install modules"
terraform get

echo "Plan state: $ENV"
terraform plan -var-file=$ENV.tfvars