#!/bin/bash

#TOKEN_URL="https://151dd0e4-bd8b-453b-a01c-924e75053a8b.mock.pstmn.io/auth"
#PARAM_URL="https://151dd0e4-bd8b-453b-a01c-924e75053a8b.mock.pstmn.io/parameters"
TOKEN_URL=$1
PARAM_URL=$2

### Checking number of Argument
if [ $# -lt 2 -o $# -gt 3 ] && [ "$1" != "-h" ]; then
  echo "Error: Invalid number of arguments provided."
  echo "Usage: ./assesment-script.sh arg1=authentication_url arg2=Parameter_url OR ./assesment-script.sh arg1=authentication_url arg2=Parameter_url -k8"
  exit 1
fi



### Print Help
if [ $1 == '-h' ]; then
  echo "Usage: ./assesment-script.sh arg1=authentication_url arg2=Parameter_url
    OR
      Print K8 Deployment file    ./assesment-script.sh arg1=authentication_url arg2=Parameter_url -k8"
  exit 1
fi



function get_token {
  TOKEN=$(curl -s -X GET "$1")
  echo "$TOKEN"
}


#Pass the URL followed by Parameter as arguments to function
function get_params() {
  auth_token=$(get_token "$TOKEN_URL")
  url="${2}?TOKEN=${auth_token}"
  param=$(curl -s "$url" | grep "$1" | awk -F'"' '{print $4}')
  echo $param 
}

PARAMETER1=$(get_params "PARAMETER1" "$PARAM_URL")
PARAMETER2=$(get_params "PARAMETER2" "$PARAM_URL")

echo "HELLO WORLD, $PARAMETER1-$PARAMETER2"


if [ $# == 3 ] && [ "$3" == "-k8" ]; then

# Generate the Kubernetes deployment YAML
cat << EOF > deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: swisscom-coding-challenge
  name: swisscom-coding-challenge
spec:
  replicas: 1
  selector:
    matchLabels:
      app: swisscom-coding-challenge
  template:
    metadata:
      labels:
        app: swisscom-coding-challenge
    spec:
      containers:
        - env:
            - name: AUTH_URL
              value: "https://151dd0e4-bd8b-453b-a01c-924e75053a8b.mock.pstmn.io/auth"
            - name: PARAMS_URL
              value: "https://151dd0e4-bd8b-453b-a01c-924e75053a8b.mock.pstmn.io/parameters"
          command: ["/bin/sh", "-c", "./assesment-script.sh <variable AUTH_URL_HERE> <variable PARAMS_URL_HERE> && sleep 3000000"]
          image: zeehasham27/coding_challenge:latest
          name: swisscom-coding-challenge
          imagePullPolicy : IfNotPresent
          ports:
            - containerPort: 8080
EOF

# Output the generated YAML
cat deployment.yaml

fi
