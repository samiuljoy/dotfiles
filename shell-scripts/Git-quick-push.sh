#!/bin/sh
git add *
echo "\nEnter commit message: "
read cmsg
git commit -m "$cmsg"
git push
