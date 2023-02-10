# Repo Contents
- Shell Script assesment-script.sh
- Kubernetes Deployment file
- Dockerfile

# Shell Script assesment-script.sh
The shell scripts gets a token using a GET request for authentication and extract out 2 parameters from URL. The script expects user to pass 2 arguments, first one authentication URL and second one parameter URL and prints "HELLO WORLD, PARAM1-PARAM2". If user pass -k8 along with the other 2 mentioned arguments, it will print a kubernetes deployment file. Use single argument '-h' to print its help section.

# Dockerfile
The dockerfile packages this shell script and pushes an image to the public docker registry. The working directory of pushed image would be /app where shell script will be placed.

# Kubernetes Deployment File:
A Kubernetes Deployment file is packaged along with this repository. It can also be created on the runtime using the -k8 argument along with URL arguments to the script. Once the deployment is spin up user would be able to see the pod logs with output "HELLO WORLD, swisscom2023-smingate77"

Screenshots:
![image](https://user-images.githubusercontent.com/48657324/218091952-bb0dcc72-3b1d-47a1-858c-5515a8ceebad.png)
