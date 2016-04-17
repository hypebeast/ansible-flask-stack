# ansible-flaskapp

[![Build Status](https://travis-ci.org/hypebeast/ansible-flaskapp.svg?branch=master)](https://travis-ci.org/hypebeast/ansible-flaskapp)

Ansible role for provisioning and deploying Flask applications.


## Features

  * Provides tasks for provisioning and deploying a Flask application.
  * Provisions a server with all required applications and requirements.
  * Easily deploy your Flask application
  * Use git to checkout the application
  * Use Nginx as reverse proxy
  * Use Supervisor as process manager
  * Use Gunicorn to run the Flask application (can be overridden if a custom start script is provided)
  * Setup Postgresql with required database and user (optional)
  * Run pre and post install hooks
  * Install npm and bower if required
  * Run `npm install` and `bower install` during deployment (optional)


## Installation

### ansible-galaxy

ansible-flaskapp is an Ansible role distributed globally using [Ansible Galaxy](https://galaxy.ansible.com/). In order to install ansible-flaskapp role you can use the following command.

```
$ ansible-galaxy install hypebeast.ansible-flaskapp
```

### Manually

Or directly clone the repository in your *roles* folder:

  $ git clone https://github.com/hypebeast/ansible-flaskapp roles/ansible-flaskapp


## Usage

### Installed via ansible-galaxy

#### Add the role to your playbook

Add the *ansible-flaskapp* role to your *playbook*:

```yaml
- hosts: servers
  roles:
     - role: hypebeast.ansible-flaskapp
```

This executes the setup and deploy tasks. If you want to run only the deploy task:

```yaml
- hosts: servers
  roles:
     - role: hypebeast.ansible-flaskapp
       tags: ansible-flaskapp-deploy
```



#### Set up role variables

Customize the role variables (see role variables)


## Role Variables

See [defaults/main.yml](./defaults/main.yml) for a full list with available variables:

```yaml
# The name of the application, uses to create application directory, e.g.
# should be a shorthand, lowercase and not contain any whitespaces.
flaskapp_app_name: flaskapp

# Port for the application
flaskapp_port: 8000

# The user used to run the Flask application
flaskapp_app_user: www-data

# The directory to keep application source code.
flaskapp_app_directory: "/opt/{{ flaskapp_app_name }}"

# The directory to keep application logs.
flaskapp_app_log_directory: "/var/log/{{ flaskapp_app_name }}"

# The path to application requirements.
flaskapp_app_requirements: "{{ flaskapp_app_directory }}/requirements.txt"

# The remote git repository to pull application code from, for example:
# git@github.com:hypebeast/flaskapp.git
flaskapp_app_repository: git@github.com:hypebeast/ansible-flaskapp.git

# The version of the repository to checkout. This can be a full
# 40-character SHA1 hash, the branch or a tag name.
flaskapp_app_version: master

# The list of environment variables uses to run most of commands.
flaskapp_app_environment:
  PATH: "{{ flaskapp_app_directory }}/bin:{{ ansible_env.PATH }}"

# The list of custom commands to run before and after deploy. These commands
# uses previously defined environment to run.
flaskapp_app_pre_hooks: []
flaskapp_app_post_hooks: []

# The path to application config to use when launch application.
flaskapp_app_config:

# The Python version which should be installed
flaskapp_python_version: 2.7

# The list of system packages required to build/run application.
flaskapp_app_packages:
  - git
  - python{{ python.version }}
  - build-essential
  - python-dev
  - python-virtualenv
  - libpq-dev
  - build-essential

# Additional system packages required by your application
flaskapp_additional_app_packages:

# Install `nodejs` and required package dependencies via `npm`?
flaskapp_app_requires_npm: false

# Install frontend package dependencies via `bower`?
flaskapp_app_requires_bower: false

# Install and configure Postgresql
flaskapp_use_postgresql: true

# Postgresql db user
flaskapp_postgresql_user: "{{ flaskapp_app_name }}"

# Postgresql db password
flaskapp_postgresql_password: xxxxx

# Postgresql db table name
flaskapp_postgresql_table: "{{ flaskapp_app_name }}"

# Defines if migrations should be run during deployment
flaskapp_run_migrations: false

# Directory with migrations scripts
flaskapp_migrations_dir: ../migrations

# Migration command
flaskapp_migration_command: python manage.py migrate

# Nginx server name
flaskapp_nginx_server_name: "{{ flaskapp_app_name }}.domain.com"

# Directory with static files served directly by Nginx
flaskapp_nginx_static_dir: "{{ flaskapp_app_directory }}/static/"

# Set to true if you want to use a custom nginx config (you need to provisioning it by yourself)
flaskapp_use_custom_nginx_conf: false

# Set to true if you want to use a custom supervisor config (you need to provisioning it by yourself)
flaskapp_use_custom_supervisor_conf: false

# Set to true if you want to use a custom startup script used by supervisor (you need to provisioning it by yourself)
flaskapp_use_custom_start_script: false
```


## Testing

TODO


## Author

Sebastian Ruml, sebastian@sebastianruml.name


## Credits

Credits goes to the authors of the following projects:

  * https://github.com/vitalk/ansible-flaskapp
  * https://github.com/ansistrano/deploy
  * https://github.com/nodesource/ansible-nodejs-role
