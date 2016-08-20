cd /etc/yum.repos.d/
wget http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.2.1.0/ambari.repo
yum clean all
yum install -y ambari-server ambari-agent
ambari-server setup -s

ssh -oStrictHostKeyChecking=no namenode "/etc/init.d/supervisord stop"
ssh -oStrictHostKeyChecking=no namenode "pkill -u storm"
ssh -oStrictHostKeyChecking=no namenode "pkill -u mapred"
ssh -oStrictHostKeyChecking=no namenode "pkill -u yarn"
ssh -oStrictHostKeyChecking=no namenode "pkill -u hdfs"
ssh -oStrictHostKeyChecking=no namenode "yum remove -y hadoop-libhdfs hadoop-hdfs"
ssh -oStrictHostKeyChecking=no namenode "yum remove -y hadoop-yarn hadoop-mapreduce"
ssh -oStrictHostKeyChecking=no namenode "yum remove -y kafka storm kafka"
ssh -oStrictHostKeyChecking=no namenode "yum remove -y zookeeper"

ssh -oStrictHostKeyChecking=no resourcemanager "/etc/init.d/supervisord stop"
ssh -oStrictHostKeyChecking=no resourcemanager "pkill -u storm"
ssh -oStrictHostKeyChecking=no resourcemanager "pkill -u mapred"
ssh -oStrictHostKeyChecking=no resourcemanager "pkill -u yarn"
ssh -oStrictHostKeyChecking=no resourcemanager "pkill -u hdfs"
ssh -oStrictHostKeyChecking=no resourcemanager "yum remove -y hadoop-libhdfs hadoop-hdfs"
ssh -oStrictHostKeyChecking=no resourcemanager "yum remove -y hadoop-yarn hadoop-mapreduce"
ssh -oStrictHostKeyChecking=no resourcemanager "yum remove -y kafka storm kafka"
ssh -oStrictHostKeyChecking=no resourcemanager "yum remove -y zookeeper"

ssh -oStrictHostKeyChecking=no node1 "/etc/init.d/supervisord stop"
ssh -oStrictHostKeyChecking=no node1 "pkill -u storm"
ssh -oStrictHostKeyChecking=no node1 "pkill -u mapred"
ssh -oStrictHostKeyChecking=no node1 "pkill -u yarn"
ssh -oStrictHostKeyChecking=no node1 "pkill -u hdfs"
ssh -oStrictHostKeyChecking=no node1 "yum remove -y hadoop-libhdfs hadoop-hdfs"
ssh -oStrictHostKeyChecking=no node1 "yum remove -y hadoop-yarn hadoop-mapreduce"
ssh -oStrictHostKeyChecking=no node1 "yum remove -y kafka storm kafka"
ssh -oStrictHostKeyChecking=no node1 "yum remove -y zookeeper"

ssh -oStrictHostKeyChecking=no node2 "/etc/init.d/supervisord stop"
ssh -oStrictHostKeyChecking=no node2 "pkill -u storm"
ssh -oStrictHostKeyChecking=no node2 "pkill -u mapred"
ssh -oStrictHostKeyChecking=no node2 "pkill -u yarn"
ssh -oStrictHostKeyChecking=no node2 "pkill -u hdfs"
ssh -oStrictHostKeyChecking=no node2 "yum remove -y hadoop-libhdfs hadoop-hdfs"
ssh -oStrictHostKeyChecking=no node2 "yum remove -y hadoop-yarn hadoop-mapreduce"
ssh -oStrictHostKeyChecking=no node2 "yum remove -y kafka storm kafka"
ssh -oStrictHostKeyChecking=no node2 "yum remove -y zookeeper"

sed -i "s|/usr/java/default/|/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.71.x86_64|g" /etc/ambari-server/conf/ambari.properties
ambari-server restart
echo "Completed clean up"