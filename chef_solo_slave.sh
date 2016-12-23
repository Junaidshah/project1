curl -L https://www.opscode.com/chef/install.sh | bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
git clone https://github.com/Junaidshah/teralytics.git /var/chef-solo
mkdir -p /var/log/chef
touch /var/log/chef/client.log
/usr/bin/chef-solo -c /var/chef-solo/solo.rb -j /var/chef-solo/solo_slave.json > /var/log/chef/client.log 2>&1 
