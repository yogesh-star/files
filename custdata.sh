#!/bin/bash
mkdir /opt/actions-runner
cd /opt/actions-runner && curl -O -L https://github.com/actions/runner/releases/download/v2.277.1/actions-runner-linux-x64-2.277.1.tar.gz
cd /opt/actions-runner && tar xzf ./actions-runner-linux-x64-2.277.1.tar.gz
sudo chmod o+w /opt/actions-runner
cd /opt/actions-runner && su azureuser -c './config.sh --url https://github.com/yg57404/test-runner --token AP4NNAMFCUQ2QFSEQJCIQGDAIDPIC --name "my-runner-$(hostname)" --labels lable-y --work _work'
cd /opt/actions-runner && ./svc.sh install
cd /opt/actions-runner && ./svc.sh start


#!/bin/bash
snap install jq
mkdir /opt/actions-runner
cd /opt/actions-runner && curl -O -L https://github.com/actions/runner/releases/download/v2.277.1/actions-runner-linux-x64-2.277.1.tar.gz
cd /opt/actions-runner && tar xzf ./actions-runner-linux-x64-2.277.1.tar.gz
sudo chmod o+w /opt/actions-runner
PAT=f80605e20dc4ffbe2a1487d41113877ae7b30e3c
export token=$(curl -s -XPOST \
                        -H "authorization: token $PAT" \
                                        https://api.github.com/repos/yg57404/test-runner/actions/runners/registration-token |\
                                                        jq -r .token)
cd /opt/actions-runner && su ubuntu -c './config.sh --url https://github.com/yg57404/test-runner --token $token --name "my-runner-$(hostname)" --labels lable-y --work _work'
cd /opt/actions-runner && ./svc.sh install
cd /opt/actions-runner && ./svc.sh start


"sudo apt-get update",
"sudo apt-get install \\\n    apt-transport-https \\\n    ca-certificates \\\n    curl \\\n    gnupg \\\n    lsb-release -y",
"sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg",
"echo \\\n          \"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \\\n          $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
"sudo apt-get update",
"sudo apt-get install docker-ce docker-ce-cli containerd.io -y",
"sudo apt install build-essential -y"		

		
---
- hosts: webservers
  become: true
  tasks:
    - name: "Create a directory if it does not exist"
      file:
        path: /opt/actions-runner
        state: directory
        mode: '0757'

    - name: Download file
      get_url:
        url: https://github.com/actions/runner/releases/download/v2.277.1/actions-runner-linux-x64-2.277.1.tar.gz
        dest: /opt/actions-runner
        mode: '0644'
    
    - name: Extract  into /opt/actions-runner/
      unarchive:
        src: /opt/actions-runner/actions-runner-linux-x64-2.277.1.tar.gz
        dest: /opt/actions-runner
        remote_src: yes

    - name: "changing permission"
      file:
        path: /opt/actions-runner
        state: directory
        mode: '0757'    

    - name: switch user and run shell script
      become_user: ubuntu
      shell: /opt/actions-runner/config.sh --url https://github.com/yg57404/test-runner --token AP4NNAKXRVZBM7ICH76XVCLAIMN66 --name "my-runner-$(hostname)" --labels lable-y --work _work

    - name: add runner
      shell: |
        cd /opt/actions-runner/;./svc.sh install
        cd /opt/actions-runner/;./svc.sh start
		
		
actions.runner.yg57404-test-runner.my-runner-ansible.service


ansible_ssh_private_key_file: ~/.ssh/mykey1.pem		


"sudo apt-get update",
        "sudo apt-get install \\\n    apt-transport-https \\\n    ca-certificates \\\n    curl \\\n    gnupg \\\n    lsb-release -y",
        "sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg",
        "echo \\\n          \"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \\\n          $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
        "sudo apt-get update",
        "sudo apt-get install docker-ce docker-ce-cli containerd.io -y",
        "sudo apt install build-essential -y"