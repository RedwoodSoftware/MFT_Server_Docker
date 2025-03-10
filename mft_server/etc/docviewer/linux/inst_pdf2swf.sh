#!/bin/sh
# 20120903 - dvd

which pdf2swf > /dev/null 2>&1
if [ $? -eq 0 ]
then
   echo -e "pdf2swf binary already installed."
   exit 1
fi

ID=`id -un`
if [ $ID != "root" ]
then
   echo -e "You must be root to run this script."
   exit 1
fi

OS=`uname -s`

SWFTOOLSURL=http://www.swftools.org/swftools-0.9.2.tar.gz
LIBJPEGURL=http://www.ijg.org/files/jpegsrc.v8d.tar.gz
LIBFREETYPEURL=http://download.savannah.gnu.org/releases/freetype/freetype-2.4.10.tar.gz

TMPDIR=`mktemp -d /tmp/js.XXXXXXXX`
cd $TMPDIR

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
       echo -e "wget and curl missing, can't download SWFTOOLS source code."
       exit 2
    fi
fi

echo -e "\nDownloading SWFTOOLS source code.....\n"
$DLOADCMD $SWFTOOLSURL
if [ $? -ne 0 ]
then
   echo -e "Error downloading $SWFTOOLSURL"
   exit 2
fi

tar xvfz swftools-0.9.2.tar.gz > /dev/null 2>&1
if [ $? -ne 0 ]
then
   echo -e "Error expanding $TMPDIR/swftools-0.9.2.tar.gz"
   exit 3
fi

TMPCONFLOG=`mktemp $TMPDIR/buildlog.XXXXXX`
cd swftools-0.9.2

./configure > $TMPCONFLOG 2>&1
if [ $? -ne 0 ]
then
   echo -e "swftools ./configure returned an error. Please check $TMPDIR/swftools-0.9.2/config.log for details."
   exit 4
fi

# determine if ./configure did not find libjpeg and/or freetype
JPEGLIB=
FREETYPELIB=
grep -q "The following headers/libraries are missing" $TMPCONFLOG
if [ $? -eq 0 ]
then
   grep -q "The following headers/libraries are missing" $TMPCONFLOG | grep "jpeglib"
   JPEGLIB=$?
   grep -q "The following headers/libraries are missing" $TMPCONFLOG | grep "freetype"
   FREETYPELIB=$?
else
   JPEGLIB=0
   FREETYPELIB=0
fi

# is libjpeg missing?
if [ $JPEGLIB -ne 0 ]
then
   cd $TMPDIR
   echo -e "\nDownloading missing pre-requisite jpeg library source code.....\n"
   $DLOADCMD $LIBJPEGURL
   if [ $? -ne 0 ]
   then
       echo -e "Error downloading libjpeg source at $LIBJPEGURL"
       exit 5
   fi
   
   tar xvfz jpegsrc.v8d.tar.gz > /dev/null 2>&1
   if [ $? -ne 0 ]
   then
      echo -e "Error expanding $TMPDIR/jpegsrc.v8d.tar.gz"
      exit 6
   fi

   /bin/echo -e -n "\nBuilding missing pre-requisite jpeg library....."
   cd jpeg-8d
   ./configure > /dev/null 2>&1
   if [ $? -ne 0 ]
   then
       echo -e "\nlibjpeg ./configure returned an error. Please check $TMPDIR/jpeg-8d/config.log for details."
       exit 7
   fi
   make > $TMPCONFLOG 2>&1
   if [ $? -ne 0 ]
   then
      echo -e "\nlibjpeg \"make\" failed. please check $TMPCONFLOG for details."
      exit 8
   fi
   make install > $TMPCONFLOG 2>&1
   if [ $? -ne 0 ]
   then
      echo -e "\nlibjpeg \"make install\" failed. please check $TMPCONFLOG for details."
      exit 9
   fi

   if [ "$OS" = "Linux" ]
   then
      ranlib /usr/local/lib/libjpeg.a
      ldconfig /usr/local/lib   
   fi

   echo
fi

# is freetype missing?
if [ $FREETYPELIB -ne 0 ]
then
   cd $TMPDIR
   echo -e "\n\nDownloading missing pre-requisite freetype library source code.....\n"
   $DLOADCMD $LIBFREETYPEURL
   if [ $? -ne 0 ]
   then
       echo -e "Error downloading freetype source at $LIBFREETYPEURL"
       exit 5
   fi
   
   tar xvfz freetype-2.4.10.tar.gz > /dev/null 2>&1
   if [ $? -ne 0 ]
   then
      echo -e "Error expanding $TMPDIR/freetype-2.4.10.tar.gz"
      exit 6
   fi

   /bin/echo -e -n "\nBuilding missing pre-requisite freetype library....."
   cd freetype-2.4.10
   ./configure > /dev/null 2>&1
   if [ $? -ne 0 ]
   then
       echo -e "\nfreetype ./configure returned an error. Please check $TMPDIR/freetype-2.4.10/config.log for details."
       exit 7
   fi
   make > $TMPCONFLOG 2>&1
   if [ $? -ne 0 ]
   then
      echo -e "\nfreetype \"make\" failed. please check $TMPCONFLOG for details."
      exit 8
   fi
   make install > $TMPCONFLOG 2>&1
   if [ $? -ne 0 ]
   then
      echo -e "\nfreetype \"make install\" failed. please check $TMPCONFLOG for details."
      exit 9
   fi
   
   echo
fi

/bin/echo -e -n "\nBuilding PDF2SWF....."
cd $TMPDIR/swftools-0.9.2
make distclean > /dev/null 2>&1
./configure > /dev/null 2>&1
if [ $? -ne 0 ]
then
    echo -e "swftools ./configure returned an error. Please check $TMPDIR/swftools-0.9.2/config.log for details."
    exit 7
fi
make > $TMPCONFLOG 2>&1
if [ $? -ne 0 ]
then
    echo -e "swftools \"make\" failed. please check $TMPCONFLOG for details."
    exit 8
fi
make install > $TMPCONFLOG 2>&1
if [ $? -ne 0 ]
then
   which pdf2swf > /dev/null 2>&1
   if [ $? -ne 0 ]
   then
      echo -e "swftools \"make install\" failed. please check $TMPCONFLOG for details."
      exit 9
   fi
fi

rm -rf $TMPDIR > /dev/null 2>&1

echo -e "\nPDF2SWF successfully built and installed: `which pdf2swf`\n"
