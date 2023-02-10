# Repo Contents
- Shell Script assesment-script.sh
- Kubernetes Deployment file
- Dockerfile
- Docker Image image-zeehasham27-coding_challenge.tar.gz

# Shell Script assesment-script.sh
The shell scripts gets a token using a GET request for authentication and extract out 2 parameters from URL. The script expects user to pass 2 arguments, first one authentication URL and second one parameter URL and prints "HELLO WORLD, PARAM1-PARAM2". If user pass -k8 along with the other 2 mentioned arguments, it will print a kubernetes deployment file. Use single argument '-h' to print its help section.

Output for `bash assesment-script.sh https://151dd0e4-bd8b-453b-a01c-924e75053a8b.mock.pstmn.io/auth https://151dd0e4-bd8b-453b-a01c-924e75053a8b.mock.pstmn.io/parameters -k8`
![image](https://user-images.githubusercontent.com/48657324/218092947-bd6a0ad8-b0dc-4c60-928f-73551c6689ea.png)

Output for `bash assesment-script.sh https://151dd0e4-bd8b-453b-a01c-924e75053a8b.mock.pstmn.io/auth https://151dd0e4-bd8b-453b-a01c-924e75053a8b.mock.pstmn.io/parameters`
![image](https://user-images.githubusercontent.com/48657324/218093205-74fc8c9a-d2f6-4c41-99db-9473c9fde88c.png)

Printing help section
![image](https://user-images.githubusercontent.com/48657324/218093296-5a3784a6-78f2-41ec-a2e1-ddbd75b02fed.png)

# Dockerfile
The dockerfile packages this shell script and pushes an image to the public docker registry. The working directory of pushed image would be /app where shell script will be placed.

`docker build -f dockerfile . -t image:latest`
`docker push image:latest`

# Docker Image image-zeehasham27-coding_challenge.tar.gz
A docker image is also available to be pulled, you can download the image using the drive link below:
https://drive.google.com/file/d/1eovCOXJjPS2pnh6UDSjlTDEHyOOtq2ZX/view?usp=share_link

To load the downloaded image use command below:
`docker load -i image-zeehasham27-coding_challenge.tar.gz`

Once loaded check available images using command:
`docker images`

# Kubernetes Deployment File:
A Kubernetes Deployment file is packaged along with this repository. It can also be created on the runtime using the -k8 argument along with URL arguments to the script. Once the K8 Deployment file is printed to the std out, user would have to update the command section by adding the enviornment variables. 
The command section should look like:
`command: ["/bin/sh", "-c", "./assesment-script.sh $AUTH_URL $PARAMS_URL && sleep 3000000"]`

Once the deployment is spin up user would be able to see the pod logs with output "HELLO WORLD, swisscom2023-smingate77".
Screenshots:
![image](https://user-images.githubusercontent.com/48657324/218091952-bb0dcc72-3b1d-47a1-858c-5515a8ceebad.png)
