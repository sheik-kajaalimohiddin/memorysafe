#!/bin/bash
###Install necessary dependencies###
sudo yum install python -y &> /dev/null
sudo yum install pip -y &> /dev/null
sudo pip install virtualenv &> /dev/null
pip install Django &> /dev/null
pip install --upgrade pip &> /dev/null
pip install psycopg2-binary &> /dev/null
pip install Django &> /dev/null
DIR1="eb-virt"
if [ -d "DIR1" ];
then
	source ~/eb-virt/bin/activate
else
	virtualenv ~/eb-virt
	source ~/eb-virt/bin/activate
fi

DIR="memorysafe"

if [ -d "$DIR" ];
then
	rm -rf memorysafe/
	git clone git@github.com:sheik-kajaalimohiddin/memorysafe.git &> /dev/null
	cd memorysafe/
	python manage.py makemigrations &> /dev/null
	python manage.py migrate &> /dev/null
	python manage.py runserver 0.0.0.0:8000 &> /dev/null
else
	git clone git@github.com:sheik-kajaalimohiddin/memorysafe.git &> /dev/null
	cd memorysafe/
	python manage.py makemigrations &> /dev/null
	python manage.py migrate &> /dev/null
	python manage.py runserver 0.0.0.0:8000 &> /dev/null
	sudo service httpd start &> /dev/null
fi