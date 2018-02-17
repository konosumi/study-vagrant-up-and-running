#!/usr/bin/env bash

echo "Installing Apache and setting up..."
apt-get update
apt-get install -y apache2
rm -rf /var/www
# 共有フォルダの/vagrantをDocumentRootにする対応
ln -fs /vagrant /var/www

