#!/usr/bin/env bash

./setup-vim.sh
./setup-gnu-ls.sh
sudo dnf install git gh
echo "Create a personal access token: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-token"
echo "Select GitHub.com > HTTPS > Y > Paste an authentication token"
gh auth login
