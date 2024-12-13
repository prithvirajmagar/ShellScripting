#!/bin/bash
cd /path/to/app
git pull origin main
npm install   # or your build command
sudo systemctl restart <service-name>

- name: Deploy application
  hosts: webservers
  tasks:
    - name: Pull the latest code
      git:
        repo: 'https://github.com/user/repo.git'
        dest: '/path/to/app'
    
    - name: Install dependencies
      command: npm install
      args:
        chdir: '/path/to/app'
    
    - name: Restart service
      systemd:
        name: <service-name>
        state: restarted

#!/bin/bash
SERVICE="<service-name>"
if ! systemctl is-active --quiet $SERVICE; then
    echo "$SERVICE is down" | mail -s "$SERVICE down" admin@example.com
    # Optionally restart the service
    sudo systemctl restart $SERVICE
fi


[Service]
ExecStart=/usr/bin/myapp
Restart=on-failure
RestartSec=5
WatchdogSec=10s

