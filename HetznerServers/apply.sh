#!/bin/bash -e

source .env

usage() {
    echo "Usage: $0 -e [project_name] [-y]" 1>&2
}

exit_abnormal() {
    usage
    exit 1
}

AUTO_APPROVE=''

while getopts ":e:y" options; do
    case "${options}" in
    e)
        ENV=${OPTARG}
        ;;
    y)
        AUTO_APPROVE='-auto-approve'
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

echo "Apply state: $ENV"
terraform apply -no-color -var-file=$ENV.tfvars ${AUTO_APPROVE}
