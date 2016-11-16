FROM ansible/ubuntu14.04-ansible:stable

# Add playbooks to the Docker image
ADD . /build/ansible-flaskapp
ADD . /etc/ansible/roles/ansible-flaskapp
ADD ./tests/localhosts /etc/ansible/hosts

ENV WORKDIR /build/ansible-flaskapp

RUN ansible-playbook $WORKDIR/tests/test.yml -c local --tags "flaskapp-setup"
