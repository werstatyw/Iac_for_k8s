#first of all, generate ssh key on your machine and pass it to remote vm (i've used one vm on eurobyte, ubuntu 18.04)
ssh-keygen
#then pass it to vm:
ssh-copy-id root@vm528622.eurodir.ru 
#pass root password from the console. now you're able to conntect to this vm via "ssh root@vm528622.eurodir.ru"

#then, let's update needed packages and install them in order to server will function

sudo apt-get update
#installing git
sudo apt-get install git -y
echo "now let's install gitlab runner:"
# Download the binary for your system
sudo curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
# Give it permission to execute
sudo chmod +x /usr/local/bin/gitlab-runner

# Create a GitLab Runner user
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

# Install and run as a service
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
sudo gitlab-runner start

#now let's register gitlab runner, don't forget to type 2 tags: canary,stable for our project and executor as "shell"
REGISTRATION_TOKEN=GR1348941bN-PHzgm8zMrx1sN-zVz
sudo gitlab-runner register --url https://gitlab.com/ --registration-token $REGISTRATION_TOKEN

#now let's proceed to docker-compose

sudo apt-get install docker-compose -y

echo "then, let's install release-cli tool:"
#download first
curl --location --output /usr/local/bin/release-cli "https://release-cli-downloads.s3.amazonaws.com/latest/release-cli-linux-amd64"

#give permissions to execute

sudo chmod +x /usr/local/bin/release-cli

echo "let's verify that release-cli is available:"

release-cli -v

#now let's install kubectl:

#installing kubectl, first define version
echo 'installing kubectl'
#dowloading kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
#installing kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl


#and at the end, let's install helm:

curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm -y