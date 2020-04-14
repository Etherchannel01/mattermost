# Mattermost Operator

These instructions are a work-in-progress, as we work on getting the links to the images referenced below public.

Refer to this guide in order to learn how to set up Mattermost with Kubernetes:
https://docs.mattermost.com/install/install-kubernetes.html

In order to use the approved images from the Iron Bank, you MUST edit the mattermost-installation.yaml and mattermost-operator.yaml files in the following manner:
- mattermost-operator:
    - change the value for "image" in line 1538 to the approved Iron Bank Mattermost Operator image
- mattermost-installation.yaml
    - change the value for "image" in line 6 to the approved Iron Bank Mattermost Enterprise or Mattermost Team edition, depending on the edition you are installing
