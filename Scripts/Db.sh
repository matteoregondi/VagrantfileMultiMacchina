sudo apt-get update
sudo apt-get upgrade


sudo apt-get install -y mysql-server
sudo mysql -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'Password&1'; GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"
sudo mysql -e "UPDATE mysql.user SET Host='localhost' WHERE User='root'; FLUSH PRIVILEGES;"
sudo mysql -e "CREATE DATABASE IF NOT EXISTS DBProva;"
sudo mysql -e "USE DBProva; CREATE TABLE IF NOT EXISTS Employees (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  hire_date DATE NOT NULL,
  department VARCHAR(50) NOT NULL,
  salary DECIMAL(10,2) NOT NULL
);"
sudo mysql -e "USE DBProva; INSERT INTO Employees (first_name, last_name, email, phone, hire_date, department, salary) VALUES
  ('John', 'Doe', 'johndoe@example.com', '555-1234', '2022-01-01', 'Sales', 50000.00),
  ('Jane', 'Doe', 'janedoe@example.com', '555-5678', '2022-02-15', 'Marketing', 55000.00),
  ('Bob', 'Smith', 'bobsmith@example.com', '555-9012', '2022-03-01', 'IT', 60000.00);"

#NEW_BIND_ADDRESS="0.0.0.0"

sudo sed -i "s/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf


sudo systemctl restart mysql
sudo loadkeys ch

#guardare porta di ascolto nel file config di sql