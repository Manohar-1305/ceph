# #Run on Ceph0 .Update Below Hostnames and IPs according to your infra
cephadm bootstrap --mon-ip 192.168.0.30 \
--initial-dashboard-user "ceph-admin" \
--initial-dashboard-password "ADMIN_123" \
--dashboard-password-noupdate \
--cluster-network=192.168.0.0/24 \
--allow-fqdn-hostname

ssh-copy-id -f -i /etc/ceph/ceph.pub root@ceph1
ssh-copy-id -f -i /etc/ceph/ceph.pub root@ceph2

ceph orch host add ceph1.manohar.in 192.168.0.31
ceph orch host add ceph2.manohar.in 192.168.0.32

ceph orch apply mon --placement="ceph0.manohar.in,ceph1.manohar.in,ceph2.manohar.in"
ceph orch apply mgr --placement="ceph0.manohar.in,ceph1.manohar.in,ceph2.manohar.in"

ceph orch host label add ceph0.manohar.in osd-node
ceph orch host label add ceph1.manohar.in osd-node
ceph orch host label add ceph2.manohar.in osd-node

ceph orch host label add ceph0.manohar.in mon
ceph orch host label add ceph1.manohar.in mon
ceph orch host label add ceph2.manohar.in mon

ceph orch host label add ceph0.manohar.in mgr
ceph orch host label add ceph1.manohar.in mgr
ceph orch host label add ceph2.manohar.in mgr
