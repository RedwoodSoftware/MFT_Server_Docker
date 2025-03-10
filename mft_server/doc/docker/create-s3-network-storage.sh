#!/bin/bash

proto="http"
jscapehost=localhost
jscapemanagmentport='11880'
username=${APP_MANAGEMENT_USERNAME}
password=${APP_MANAGEMENT_PASSWORD}
nsName="${TENANT_NAME}-AWS-Network-Storage"
s3Key=${S3_USER_ACCESS_KEY}
s3Password=${S3_USER_SECRET_ACCESS_KEY}
aType='Credentials'
cRegion=${REGION}
remoteDir=${S3_BUCKET_NAME}
domain=${TENANT_NAME}
# kmsKeyId='446b1948-15b0-4da9-88c6-6db0cf364e46'
kmsKeyId=${TENANT_KMS_KEY_ID}
encryptionType='AWS_KMS_MANAGED_KEYS'

echo jscapehost: $jscapehost

### make a cookie file to store the session id and get it through get_session_id()
cookie_file=$(mktemp /tmp/cookie.XXXXXXXXXX)

get_session_id() {
   grep JSESSIONID $cookie_file | awk '{printf "%s=%s",$6,$7}'
}

## get session cookie
sid="$(get_session_id)"

echo "Getting CSRF Token"
echo "curl -s -k -b "$sid" -H "Content-type: application/json" $proto://$jscapehost:$jscapemanagmentport/rest/management/csrf-token"
## get CSRF token
csrftoken=$(curl -s -k -b "$sid" -H "Content-type: application/json" $proto://$jscapehost:$jscapemanagmentport/rest/management/csrf-token)

echo "Logging into MFT Server"
## Login to MFT Server
loginResponse=$(curl -s -k -b "$sid" -c "$cookie_file" -w "%{http_code}" -o /dev/null -H "x-js-at: $csrftoken" -H "Content-type: application/json" -X POST -d "{\"username\":\"$username\", \"password\":\"$password\"}" $proto://$jscapehost:$jscapemanagmentport/rest/management/login)

## check server reachable
if [[ "$loginResponse" -eq 000 ]]; then
   echo -e '\n'
   echo "Could not connect to the server.."
else

   if [[ "$loginResponse" -eq 204 ]]; then
      echo -e '\n'
      echo "Login success. Proceeding to create the resource .."

      ### get session cookie again
      sid="$(get_session_id)"

      ## get CSRF token again
      csrftoken=$(curl -s -k -b "$sid" -H "Content-type: application/json" $proto://$jscapehost:$jscapemanagmentport/rest/management/csrf-token)

      echo "Creating network storage"
      ## Create amazon s3 netowork storage
      addResourceResponse=$(curl -s -o /dev/null -k -b "$sid" -w "%{http_code}" -o /dev/null -H "x-js-at: $csrftoken" -H "X-Requested-With: XMLHttpRequest" -H "accept: application/json" -H "Content-type: application/json" -X POST -d "{\"protocol\":\"AmazonS3\",\"name\":\"$nsName\",\"encryptionType\":\"$encryptionType\",\"kmsKeyId\":\"$kmsKeyId\",\"username\":\"$s3Key\",\"password\":\"$s3Password\",\"authenticationType\":\"$aType\",\"region\":\"$cRegion\",\"requesterPaymentRequired\":false,\"remoteDirectory\":{\"@type\":\"REMOTE_PATH\",\"path\":\"$remoteDir\"},\"logDirectory\":null,\"tags\":[],\"usingCredentials\":false,\"timeToLive\":null,\"host\":\"\"}" $proto://$jscapehost:$jscapemanagmentport/rest/management/reverse-proxies/$domain)

      ## success creation check
      if [[ "$addResourceResponse" -eq 409 ]]; then
         echo "AmazonS3 Storage already exists.. Try other name .."
      fi

      ## success creation check
      if [[ "$addResourceResponse" -eq 201 ]]; then
         echo "AmazonS3 Storage created successfully.."
      fi
      ## failed creation check
      if [[ "$addResourceResponse" -eq 404 ]]; then
         echo "Response Code : 404 AmazonS3 Storage creation failed, Recheck the parameters.."
      fi
   else
      echo "Login failed. Re-check protocol,host,port,user and password"
   fi
fi

### logout
curl -s -k -b "$sid" -H "x-js-at: $csrftoken" -X POST $proto://$jscapehost:$jscapemanagmentport/rest/management/logout

### delete cookie file
rm $cookie_file
