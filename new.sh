#!/bin/bash

cd ..;
git clone --bare https://github.com/listz/listz-template $1;
cd $1;

new_url="https://github.com/listz/$1";
git push --mirror $new_url;

cd ..;
rm -rf $1;

git clone $new_url;