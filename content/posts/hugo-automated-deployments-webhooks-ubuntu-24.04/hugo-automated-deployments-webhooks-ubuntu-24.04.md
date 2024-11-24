+++
title = "Automating Hugo deployments with GitHub and Webhooks on Ubuntu 24.04 LTS"
slug = "hugo-automated-deployments-webhooks-ubuntu-24.04"
date = "2024-10-16T15:50:57-06:00"
author = "KatieTheDev"
#cover = ""
tags = ["hugo", "web development", "guides"]
#keywords = ["", ""]
description = "In this blog post, I will walk you through the process of automating Hugo deployments using a bash script and setting up a webhook to streamline updates from GitHub. The guide is designed for users on Ubuntu Server 24.04 LTS."
showFullContent = false
readingTime = true
hideComments = false
draft = false
+++
# Overview
In this blog post, I will walk you through the process of automating Hugo deployments using a bash script and setting up a webhook to streamline updates from GitHub. The guide is designed for users on Ubuntu Server 24.04 LTS and covers three main components:

1.	Creating a Deployment Script: We will create a shell script that handles the tasks of pulling the latest code, building the Hugo site, and deploying it to the web directory. This script will ensure that your site is always up to date with the latest changes.
2.	Configuring a Webhook: Once the deployment script is in place, we’ll set up a webhook configuration that allows GitHub to automatically trigger the deployment process every time you push code to your repository. This automation saves time and reduces the potential for manual errors.
3.	Setting Up a Systemd Service: Finally, we’ll create a systemd service to manage the webhook, ensuring that it runs reliably and automatically on server startup. This includes configuring the service for SSL if needed.
4.	Enable the webhook

By the end of this post, you’ll have a fully automated Hugo deployment system that responds instantly to your code updates, enhancing your development workflow and improving site management.
# Create Hugo deploy script
I use the following script to automate Hugo deployments. 
```bash
#!/bin/bash
# Change directory into build directory
cd /home/katiethedev/build/katiethe.dev
# Remove existing files in build directory
rm -rf public
rm -rf resources
# Run git pull as username 
sudo -u username git pull
# Run Hugo with minify option to build a minified site, to save on bandwidth and storage. For development purposes you can remove --minify.
sudo -u username hugo --minify
# Change directories into web directory and then remove all present files
cd /var/www/katiethe.dev
rm -rf *
# Copy all Hugo output files into web directory (switch username for your username)
cp -r /home/username/build/katiethe.dev/public/* /var/www/katiethe.dev
# Change ownership of all files in web directory to my user (change username to your username, change usergroup to your usergroup [usually the same as username])
chown username:usergroup * -R
# Reload nginx, log nginx status to webhook log, or show if ran manually
service nginx reload
service nginx status 
```
This script was created on Ubuntu Server 24.04 LTS.

# Create a webhook
## Create webhook.conf
With that script created (I named it `hugo-deploy.sh`) and placed into a directory of your choice, we can now create a webhook. GitHub will call this webhook every time code is pushed to GitHub. This will automatically deploy the website.

I placed the following into `/etc/webhook.conf`:
```json
[
  {
    "id": "deploy",
    "execute-command": "/home/username/hugo-deploy.sh",
    "command-working-directory": "/home/username/",
    "trigger-rule":
    {
      "match":
      {
        "type": "payload-hash-sha1",
        "secret": "your-secret",
        "parameter":
        {
          "source": "header",
          "name": "X-Hub-Signature"
        }
      }
    },
  }
]
```
If you placed your script into a file other than your home directory, the specific locations may differ.

## Add systemd service
Lastly, I created a systemd service called `webhook` located at `/usr/lib/systemd/system/webhook.service`:
```text
[Unit]
Description=Small server for creating HTTP endpoints (hooks)
Documentation=https://github.com/adnanh/webhook/
ConditionPathExists=/etc/webhook.conf

[Service]
ExecStart=/usr/bin/webhook -nopanic -hooks /etc/webhook.conf -secure -cert /etc/letsencrypt/live/katiethe.dev/fullchain.pem -key /etc/letsencrypt/live/katiethe.dev/privkey.pem -verbose

[Install]
WantedBy=multi-user.target
```
If you need SSL, replace the paths with the correct paths for your keys. Otherwise, feel free to remove them. My webhook is hosted behind NGINX, so I don't use keys for my webhook. Instead, NGINX terminates SSL for me and then passes the request to the webhook.

## Enable the webhook
After creating all of those files, simply run `sudo systemctl daemon-reload`, then enable and run the webhook:
```bash
sudo systemctl enable webhook
sudo systemctl start webhook
```
You can now test your webhook with either curl or by adding it in GitHub. If you set a secret, make sure to add that to GitHub as well.

## View Webhook Logs
Webhooks can be viewed by running the following:
```bash
journalctl -u webhook.service
```
