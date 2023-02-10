FROM centos:latest

WORKDIR /app
# Copy the Bash script to the image
COPY assesment-script.sh /app

# Make the script executable
RUN chmod +x assesment-script.sh 

# Set the default command to run the script
CMD ["./assesment-script.sh"]

