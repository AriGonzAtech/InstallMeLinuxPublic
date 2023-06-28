sudo apt-get install mysql-server -y 
sudo service mysql stop
sudo rm -rf /var/lib/mysql
sudo mkdir /var/lib/mysql
sudo chown mysql:mysql /var/lib/mysql
sudo chmod 700 /var/lib/mysql
sudo sed -i 's/\[mysqld\]/[mysqld]\nlower_case_table_names = 1/g' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo sed -i 's/127\.0\.0\.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo mysqld --defaults-file=/etc/mysql/my.cnf --initialize --lower_case_table_names=1 --user=mysql --console
sudo ufw allow mysql
sudo service mysql start
