#! /bin/bash

# This script runs as the login user (does most things as root)

sudo mkdir /home/ewv
sudo chown ewv /home/ewv
cd /home/ewv

sudo cp ~/CTAEvaluation/replacements/CERN/98-noipv6.conf /etc/sysctl.d/

sudo sysctl --system
sudo yum install -y git tmux nano

git clone https://gitlab.cern.ch/cta/CTA.git
cd CTA/continuousintegration/buildtree_runner/vmBootstrap
./bootstrapSystem.sh cta

sudo -u cta bash -c 'cd ~ ; git clone https://github.com/ericvaandering/CTAEvaluation.git'

echo "su - cta then ~/CTAEvaluation/scripts/cern_stage_3.sh"