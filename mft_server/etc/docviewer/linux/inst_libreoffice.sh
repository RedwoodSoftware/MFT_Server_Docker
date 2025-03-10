#!/bin/sh
# 20120903 - dvd

OS=`uname -s`
if [ $OS != "Linux" ]
then
   echo -e "This script will only work for Linux systems."
   exit 1
fi

if [ -d /opt/libreoffice3.6 ]
then
   echo -e "The directory /opt/libreoffice3.6 exists. LibreOffice may already have been installed."
   exit 1
fi

ID=`id -un`
if [ $ID != "root" ]
then
   echo -e "You must be root to run this script."
   exit 1
fi

# check kernel version. must be 2.6.18 or higher
K=`uname -r | cut -d - -f 1`
KERNEL=`echo $K | cut -d . -f 1`
KERNELMAJOR=`echo $K | cut -d . -f 2`
KERNELMINOR=`echo $K | cut -d . -f 3`

if [ ! \( $KERNEL -gt 2 -o \( $KERNEL -eq 2 -a $KERNELMAJOR -gt 6 \) -o \( $KERNEL -eq 2 -a $KERNELMAJOR -eq 6 -a $KERNELMINOR -ge 18 \) \) ]
then
   echo -e "Kernel version does not meet the LibreOffice requirement, which is v2.6.18 or higher."
   exit 2
fi

# check glibc version. must be 2.5 or higher
G=`getconf GNU_LIBC_VERSION | cut -d " " -f 2`
GLIBCMAJOR=`echo $G | cut -d . -f 1`
GLIBCMINOR=`echo $G | cut -d . -f 2`

if [ ! \( $GLIBCMAJOR -gt 2 -o \( $GLIBCMAJOR -eq 2 -a $GLIBCMINOR -ge 5 \) \) ]
then
   echo -e "glibc version does not meet the LibreOffice requirement, which is v2.5 or higher."
   exit 2
fi

# determine which command to use for downloading, wget or curl.
DLOADCMD=
which wget > /dev/null 2>&1
if [ $? -eq 0 ]
then
   DLOADCMD="wget"
else
    which curl > /dev/null 2>&1
    if [ $? -eq 0 ]
    then
       DLOADCMD="curl -L -O"
    else
       echo -e "wget and curl is missing, can't download LibreOffice binaries."
       exit 3
    fi
fi


# determine package manager/distro to set which install command to use
INSTCMD=
PKGTYPE=rpm
PKGDIR=RPMS
which dpkg > /dev/null 2>&1
if [ $? -eq 0 ]
then
   INSTCMD="dpkg -i *.deb"
   PKGTYPE=deb
   PKGDIR=DEBS
elif [ -f /etc/fedora-release ]
then
   INSTCMD="yum install *.rpm"
elif [ -f /etc/mandriva-release ]
then
   INSTCMD="urpmi *.rpm"
else
   which rpm > /dev/null 2>&1
   if [ $? -eq 0 ]
   then
      INSTCMD="rpm -Uvh *.rpm"
   else
      echo -e "Can't determine package manager"
      exit 3
   fi
fi

# determine if x86 or x86_64 machine to come up with download URL of correct installer file
MARCH=`uname -m`
if [ $MARCH = "i386" -o $MARCH = "i586" -o $MARCH = "i586" ]
then
   MARCH=x86
fi
DLOADFNAME=LibO_3.6.1_Linux_`echo ${MARCH}|sed 's/_/-/g'`_install-${PKGTYPE}_en-US
DLOADURL=http://download.documentfoundation.org/libreoffice/stable/3.6.1/${PKGTYPE}/${MARCH}/$DLOADFNAME.tar.gz

# download LibreOffice binary archive into a temp directory
TMPDIR=`mktemp -d /tmp/js.XXXXXXXX`
cd $TMPDIR
echo -e "\nDownloading LibreOffice binary archive into $TMPDIR. This could take awhile.....\n"
$DLOADCMD $DLOADURL

# Unpack LibreOffice binary archive if download was successful
if [ $? -eq 0 ]
then
    TARXOUT=`mktemp $TMPDIR/tarx.XXXXXX`
    /bin/echo -e -n "\nUnpacking LibreOffice binary archive....."
    tar xvfz $DLOADFNAME.tar.gz > $TARXOUT 2>&1

    if [ $? -ne 0 ]
    then
       echo -e "\nUnpack of LibreOffice binary archive failed! Please check details here $TARXOUT"
       exit 4
    fi
else
   echo -e "\nDownload failed!!!\n"
   exit 3
fi

# install LibreOffice
UNPACKDIR=`cat $TARXOUT | head -1`
cd $UNPACKDIR/$PKGDIR
echo -e "\nInstalling LibreOffice now....."
$INSTCMD

if [ $? -eq 0 ]
then
   echo -e "\nInstallation of LibreOffice was successful. LibreOffice home should be under /opt/libreoffice3.6"
else
   cat <<EOF
\nInstallation of LibreOffice failed!!!

The command used to try and install LibreOffice was \"$INSTCMD\", executed inside $TMPDIR/$UNPACKDIR/$PKGDIR
EOF
fi
