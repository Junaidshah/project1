curl -L https://www.opscode.com/chef/install.sh | bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
git clone https://github.com/Junaidshah/teralytics.git /var/chef-solo
mkdir -p /var/log/chef
touch /var/log/chef/client.log
/usr/bin/chef-solo -c /var/chef-solo/solo.rb -j /var/chef-solo/solo_slave2.json > /var/log/chef/client.log 2>&1
echo 10.0.1.116 | sudo tee /etc/mesos-slave/ip
echo zk://10.0.1.117:2181/mesos | sudo tee /etc/mesos/zk
echo 10.0.1.117 | sudo tee /etc/mesos-slave/hostname
service mesos-slave restart
