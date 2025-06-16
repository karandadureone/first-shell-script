#!/bin/bash
#######################
#Author: KaranDadureOne
#Date: 15-June-2025
#
#Version: V1
#
#This Script will report AWS Resource Usage
#
#######################

set -x
set -e
set -o pipefail

#list of AWS S3 buckets
aws s3 ls

#list of AWS EC2 Instances
aws ec2 describe-instances

#list of AWS lambda functions
aws lambda list-functions

#list of AWS IAM users
aws iam list-users
