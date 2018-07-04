Steps to deploy OpenCMS application in Tomcat server and user apache as web server, back-end DB as MySql

Command to run playbooks:

ansible-playbook -i inventory <playbook_name>

This playbook is meant for RHEL/Centos operating systems

1. Add web, app and DB server details along with a common user name and key to login to servers in inventory file

2. Run playbook setup_apache.yml to install apache web server 
Assumptions: ServerName and ServerAdmin are filled in httpd.conf.j2 file (available inside templates folder of apache role) where tomcat is  installed

3. Run playbook setup_mysql.yml to install mysql server

4. Run playbook setup_tomcat.yml to install tomcat server
Assumptions: Java and tomcat installers are available in S3 drive and made public so installers can e downloaded by URL. Add S3 url's in main.yml roles>tomcat>defaults

5. Run playbook deploy_opencms.yml to download and deploy in tomcat server webapps folder 
Configure changes accordingly like DB etc.

