#!/bin/bash
while getopts g:s:h option
do
case "${option}"
in
g) gitlink=${OPTARG};;
s) s3bucket=${OPTARG};;
h) echo "sh git-s3-tool.sh -g FULL-LINK-TO-GITHUB-LINK -s NAME-OF-S3-BUCKET"
esac
done


gittoken=TOKEN
gitfile="${gitlink##*/}"
s3fulllink=s3://$s3bucket/
awsaccesskey=KEY
awssecret=SECRET

echo $s3fulllink
echo $gitfile

#Dowload file form GitHub
curl -o /tmp/$gitfile -H 'Authorization: token $gittoken' -H 'Accept: application/vnd.github.v3.raw' -O -L $gitlink

#Upload file to S3
AWS_ACCESS_KEY_ID=$awsaccesskey AWS_SECRET_ACCESS_KEY=$awssecret aws s3 mv /tmp/$gitfile $s3fulllink
