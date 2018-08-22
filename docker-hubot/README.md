# Docker Example - Hubot Slack bot container image built with Ansible

This is an example lightweight Docker image build using Ansible which builds a usable Hubot chat bot that works with Slack. The example is explained in more detail in Chapter 13 of [Ansible for DevOps](https://www.ansiblefordevops.com/).

## Get a Slack API Token for your bot

Follow the instructions in Slack's guide, [Slack Developer Kit for Hubot](https://slackapi.github.io/hubot-slack/), and get an API token for a bot attached to a new App installed in the workspace of a Slack organization.

## Build the Hubot container image

Make sure you have Docker installed on the workstation or VM where this playbook is located, then enter the command:

    $ ansible-playbook main.yml

This will generate a Docker image named `a4d/hubot-slack`, which you should see listed when you run `docker images`.

## Run the Hubot container image

To run the image, run the command below, replacing `TOKEN_HERE` with the API token your bot uses from Slack:

    $ docker run -d --name hubot -e HUBOT_SLACK_TOKEN=TOKEN_HERE a4d/hubot-slack

The container should be running in the background. You can inspect the logs from the bot using `docker logs hubot`, and you can kill and remove the container with `docker rm -f hubot`.

## About the Author

This project was created by [Jeff Geerling](https://www.jeffgeerling.com/) as an example for [Ansible for DevOps](https://www.ansiblefordevops.com/).
