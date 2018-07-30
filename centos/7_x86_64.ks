install
text
lang en_US.UTF-8
keyboard --vckeymap=us --xlayouts='us'
timezone UTC --isUtc

repo --name=updates
#repo --name=updates-testing
url --url=http://mirror.centos.org/centos/7/os/x86_64

network  --bootproto=dhcp --device=link --ipv6=auto --activate --onboot=yes
network --hostname=localhost.localdomain

auth --enableshadow --passalgo=sha512
rootpw --iscrypted $6$va0dSJ1.eIBRWACD$2KDqogX7XwgS9JHtooVhOC/RKreausSWVuNc92vNDoF3RMO7.flX/UjtOmunhF8Q.hni7yEEW/ZUJg1tPw5xr/
user --groups=wheel --name=user --password=$6$va0dSJ1.eIBRWACD$2KDqogX7XwgS9JHtooVhOC/RKreausSWVuNc92vNDoF3RMO7.flX/UjtOmunhF8Q.hni7yEEW/ZUJg1tPw5xr/ --iscrypted

ignoredisk --only-use=sda
bootloader --append="console=ttyS0 verbose"
clearpart --all --initlabel
autopart --type=plain

firstboot --disable
skipx

%packages --nobase
@development
bc
git
openssl-devel
%end

poweroff
