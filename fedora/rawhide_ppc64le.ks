install
text
lang en_US.UTF-8
keyboard --vckeymap=us --xlayouts='us'
timezone UTC --isUtc

# https://pagure.io/fedora-kickstarts/blob/master/f/fedora-repo-rawhide.ks
repo --name=rawhide --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=rawhide&arch=$basearch
url --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=rawhide&arch=$basearch

network  --bootproto=dhcp --device=link --ipv6=auto --activate --onboot=yes
network --hostname=localhost.localdomain

auth --enableshadow --passalgo=sha512
rootpw --iscrypted $6$va0dSJ1.eIBRWACD$2KDqogX7XwgS9JHtooVhOC/RKreausSWVuNc92vNDoF3RMO7.flX/UjtOmunhF8Q.hni7yEEW/ZUJg1tPw5xr/
user --groups=wheel --name=user --password=$6$va0dSJ1.eIBRWACD$2KDqogX7XwgS9JHtooVhOC/RKreausSWVuNc92vNDoF3RMO7.flX/UjtOmunhF8Q.hni7yEEW/ZUJg1tPw5xr/ --iscrypted

ignoredisk --only-use=sda
bootloader --append="console=hvc0 verbose"
clearpart --all --initlabel
autopart --type=plain

firstboot --disable
skipx

%packages
@development-tools
@c-development
@rpm-development-tools
bc
git
openssl-devel
%end

poweroff
