#!/bin/bash

# Clone the template repository using the --bare flag
cd ..;
git clone --bare https://github.com/listz/listz-template $1;
cd $1;

# Push the --bare template repository to the new repository.
new_url="https://github.com/listz/$1";
git push --mirror $new_url;

# Remove the --bare directory.
cd ..;
rm -rf $1;

# Clone the new repository and remove the old README.md.
git clone $new_url;
cd $new_url;
rm README.md;

# Update the new README.md.
touch README.md;
echo "# $1" >> README.md;
echo "\nEnter a description." >> README.md;
echo "\n[![Build Status](https://travis-ci.org/listz/$1.svg?branch=master)](https://travis-ci.org/listz/$1)" >> README.md;
echo "\n## How to contribute" >> README.md;
echo "\nYou can read more about how to contribute [here](https://github.com/listz/listz/blob/master/CONTRIBUTING.md)." >> README.md;

# Commit and push changes.
git add --all .;
git commit -m "Created new Listz repository.";
git push;