# Vagrant for WordPress
This is a basic Vagrant configuration for your WordPress project.

Vagrant is a tool for building complete development environments. If you don't have it you can download it [here](https://www.vagrantup.com/downloads.html).

* First clone this repo: 
```
git clone https://github.com/simian-lab/vagrant-wordpress.git
```
* Then copy all the files inside the *vagrant-wordpress* directory in your WordPress project's root.
* Search and replace *'my-project'* for your project name in the ***vagrant.sh*** file.
* Set the *ServerName* in the ***stack/local-virtualhost.conf*** file.
* Choose a database name in ***stack/local_db.sql***.
* You're ready, just run `vagrant up`.
