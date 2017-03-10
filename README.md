# Dynamically Provisioned (On-Demand) Jenkins Slaves in a Kubernetes Cluster on AWS

![Jenkins on Kubernetes](images/screenshot_jenkins_console_1.png "Jenkins on Kubernetes")

Example code for the [Dynamically Provisioned (On-Demand) Jenkins Slaves in a Kubernetes Cluster on AWS](https://kumorilabs.com/blog/dynamically-provisioned-jenkins-slaves-kubernetes-aws/) blog post.

## TL;DR

```
vagrant up

vagrant ssh
cd jenkins-with-kubernetes-slaves

# Once you have logged into your Vagrant environment, you
# will need to update the [`/scripts/variables.sh`] script

./scripts/create-cluster.sh

./scripts/deploy-jenkins.sh

./scripts/delete-cluster.sh
```
