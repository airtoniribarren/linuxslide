#!/bin/bash

ROOT_UID=0

# check command avalibility
function has_command() {
    command -v $1 > /dev/null
}

# Load common properties and functions in the current script.
. ./common.sh
	if [ "$UID" -eq "$ROOT_UID" ]; then
	
	#running script inside chroot enviroment (https://askubuntu.com/questions/551195/scripting-chroot-how-to)
	cat << EOF | chroot $DIR/chroot 

#chroot tail /etc/apt/apt.conf.d/01_custom_slide
echo 'APT
{
  NeverAutoRemove
  {
	"^firmware-linux.*";
	"^linux-firmware$";
  };

  VersionedKernelPackages
  {
	# linux kernels
	"linux-image";
	"linux-headers";
	"linux-image-extra";
	"linux-signed-image";
	# kfreebsd kernels
	"kfreebsd-image";
	"kfreebsd-headers";
	# hurd kernels
	"gnumach-image";
	# (out-of-tree) modules
	".*-modules";
	".*-kernel";
	"linux-backports-modules-.*";
        # tools
        "linux-tools";
  };

  Never-MarkAuto-Sections
  {
	"metapackages";
	"contrib/metapackages";
	"non-free/metapackages";
	"restricted/metapackages";
	"universe/metapackages";
	"multiverse/metapackages";
  };

  Move-Autobit-Sections
  {
	"oldlibs";
	"contrib/oldlibs";
	"non-free/oldlibs";
	"restricted/oldlibs";
	"universe/oldlibs";
	"multiverse/oldlibs";
  };
};

APT::Install-Recommends "0" ;
APT::Install-Suggests "0" ;

Acquire::Languages { "none";

Apt::AutoRemove::SuggestsImportant "false";

Acquire::GzipIndexes "true";
Acquire::CompressionTypes::Order:: "gz";

DPkg::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };
APT::Update::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };
Dir::Cache::pkgcache "";
Dir::Cache::srcpkgcache "";' > /etc/apt/apt.conf.d/01_custom_slide


# no docs
echo "
path-exclude /usr/share/doc/*
# we need to keep copyright files for legal reasons
path-include /usr/share/doc/*/copyright
path-exclude /usr/share/man/*
path-exclude /usr/share/groff/*
path-exclude /usr/share/info/*
# lintian stuff is small, but really unnecessary
path-exclude /usr/share/lintian/*
path-exclude /usr/share/linda/*
path-exclude /usr/share/locale/*
path-include /usr/share/locale/en*
" > /etc/dpkg/dpkg.cfg.d/01_nodoc

#update /etc/apt/sources.list
echo "
deb http://ftp.us.debian.org/debian/ stretch main contrib non-free
deb-src http://ftp.us.debian.org/debian/ stretch main contrib non-free

deb http://security.debian.org/debian-security stretch/updates main contrib non-free
deb-src http://security.debian.org/debian-security stretch/updates main contrib non-free

# stretch-updates, previously known as 'volatile'
deb http://ftp.us.debian.org/debian/ stretch-updates main contrib non-free
deb-src http://ftp.us.debian.org/debian/ stretch-updates main contrib non-free

#get unstable software like firefox
#deb http://http.debian.net/debian unstable main
" > /etc/apt/sources.list


EOF

	else
		# Message  
		echo -e "Please run this script as root..."
	fi
