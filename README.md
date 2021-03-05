Hey ! Welcome to this project =)

This project is a 32-hours hackathon group project which concept was proposed by "St-Ex", which is a digital culture association, and consists in a website displaying informations about the association in a playful and amusing way. The subject was "St-Ex, what it is ?", so my group and I decided to use the little prince of Antoine de St-Exupery to explain it ;-)

It is a PHP project made with mySQL and composer library so if you want to run it by yourself, you need to make sure they are installed and upgraded to latest versions and follow these few steps :

git clone the project by running command "git clone https://github.com/Tolexia/Prince_de_St_Tech.git" in a terminal
run composer install
run a mySQL client and after being connected with your ids, create a database with the name of your choice by running "CREATE DATABASE database_name;"
import the sql file "st_tech_db.sql" which contains the data of the website. To do that, you need to open the folder of the project, and copying the exact and absolute path to this file. Ex : "C:\somefolder\anotherfolder\anotherone\prince_de_st_tech\st_tech_db.sql".
After that, return to your mySQL client and select your database by running "USE database_name", and import the file by running "SOURCE" + the exact path of the file. Ex : "SOURCE C:\somefolder\anotherfolder\anotherone\prince_de_st_tech\st_tech_db.sql"
Now that you have an up-to-date database, you need to set up the PHP project to it. Get to the config folder in the project folder. Copy the db.php.dist and name it db.php instead. Open it and replace the host, user, password and database name by your own informations.
Congrats ! Now you just have to launch a php server on your terminal (php -S localhost:8000) and open a navigator to your localhost adress.
Enjoy =)
