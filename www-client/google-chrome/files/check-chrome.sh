#!/bin/zsh

setopt -e 

amd64=$(mktemp)
i386=$(mktemp)

wget -qO $amd64 http://dl.google.com/linux/chrome/deb/dists/stable/main/binary-amd64/Packages
wget -qO $i386 http://dl.google.com/linux/chrome/deb/dists/stable/main/binary-i386/Packages

descr() { sed -n -e "/^Package: google-chrome-$CHAN/,/^$/p" }
version() { sed -n -e '/^Version: /{s|Version: || ; s:-r:_p: ; p}' }
size() { sed -n -e '/^Size: /{s|Size: || ; p}' }
filename() { sed -n -e '/^Filename: /{s|Filename: || ; p}' }
SHA1() { sed -n -e '/^SHA1: /{s|SHA1: || ; p}' }

cd /var/lib/xmw-overlay/www-client/google-chrome

update() {
    for CHAN in stable unstable ; do
	ebuild=$(grep -l "CHAN=\"$CHAN\"" *.ebuild)
	ebuild_ver=$(echo $ebuild | sed -e 's:^google-chrome-::' -e 's:.ebuild$::')
	upstream_amd64=$(cat $amd64 | descr | version)
	upstream_i386=$(cat $i386 | descr | version)
	echo "tree  $CHAN "$ebuild_ver
	echo "amd64 $CHAN "$upstream_amd64
	echo "i386  $CHAN "$upstream_i386

	if [ $upstream_amd64 != $upstream_i386 ] ; then
		echo "different versions for arches, skip"
		continue
	fi
	upstream=$upstream_amd64

	if [ $ebuild_ver = $upstream ] ; then
		echo "up-to-date, done"
		continue
	fi
	new_ebuild="google-chrome-$upstream.ebuild"
	git mv $ebuild $new_ebuild
	echangelog "Automated version bump"
	repoman manifest
    done
}

check() {
    for CHAN in stable unstable ; do 
	for ARCH in amd64 i386 ; do
	    if [ $ARCH = amd64 ] ; then
		file=$amd64
	    elif [ $ARCH = i386 ] ; then
		file=$i386
	    else
		echo unsupported arch $ARCH
		exit 1
	    fi
	    deb=$(basename $(descr < $file | filename))
	    echo $deb
	    if [ $(sed -n "/^DIST $deb/p" Manifest | cut -d ' ' -f 3) != $(descr < $file | size) ] ; then 
		echo size error
	    else
		echo size ok
	    fi
	    if [ $(sed -n "/^DIST $deb/p" Manifest | cut -d ' ' -f 7) != $(descr < $file | SHA1) ] ; then 
		echo SHA1 error
	    else
		echo SHA1 ok
	    fi
	done
    done
}

status() {
    cd /var/lib/xmw-overlay/www-client/google-chrome
    GIT_PAGER=cat git diff --exit-code >/dev/null
    if [ $? ] ; then
	echo google-chrome ok
    else
	echo google-chrome update me
    fi
}

eval $1

rm $amd64 $i386
