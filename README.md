# ram_memory_mail_notification

this script will notify you when the set threshold is going to be exceeded .

Prerequisites

Use Linux, no matter which distro.

Install postfix and make it available to send emails. 

For CENTOS/RH distros.

yum install mailx -y

vi /etc/postfix/main.cf

Edit 2 lines

mydestination = $myhostname, localhost.$mydomain, localhost, YOUR_DESTINATION

inet_interfaces = loopback-only

Restart postfix 

systemctl restart postfix

For UBUNTU/DEBIAN distros.

yum install mailutils

During the installation give YOUR_SMTP_NAME and check internet-site option.

vi /etc/postfix/main.cf

Edit 2 lines

mydestination = $myhostname, localhost.$mydomain, localhost, YOUR_DESTINATION (this should be already in place)

inet_interfaces = loopback-only

Restart postfix 

systemctl restart postfix
