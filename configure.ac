# Process this file with autoconf to produce a configure script.
#
# Copyright (C) 2007-2009 Philip Lyons (viiron@gmail.com)

AC_PROG_PERL_VERSION(5.6.0)
AC_PREREQ(2.61)
AC_INIT(pacpl,4.0.5)

AC_SUBST(INSTALL_AMAROK)
AC_SUBST(INSTALL_KONQ)
AC_SUBST(INSTALL_DOLP)
AC_SUBST(INSTALL_D3LP)
AC_SUBST(KDEDIR)

AC_PREFIX_DEFAULT(/usr)

AC_PROG_INSTALL

AC_PATH_PROG(RM, rm, rm)
AC_PATH_PROG(PERL, perl, perl)
AC_PATH_PROG(POD2MAN, pod2man, pod2man)
AC_PATH_PROG(POD2HTML, pod2html, pod2man)
AC_PATH_PROG(GZIP, gzip, gzip)

########################################
# check for supported encoder/decoders #
########################################
echo ""
AC_CHECK_PROG(LAME, lame, yes)
AC_CHECK_PROG(TOOLAME, toolame, yes)
AC_CHECK_PROG(GOGO, gogo, yes)
AC_CHECK_PROG(BLADEENC, bladeenc, yes)
AC_CHECK_PROG(OGGENC, oggenc, yes)
AC_CHECK_PROG(OGGDEC, oggdec, yes)
AC_CHECK_PROG(SPEEXENC, speexenc, yes)
AC_CHECK_PROG(SPEEXDEC, speexdec, yes)
AC_CHECK_PROG(FLAC, flac, yes)
AC_CHECK_PROG(MAC, mac, yes)
AC_CHECK_PROG(SHORTEN, shorten, yes)
AC_CHECK_PROG(SOX, sox, yes)
AC_CHECK_PROG(FAAC, faac, yes)
AC_CHECK_PROG(FAAD, faad, yes)
AC_CHECK_PROG(FFMPEG, ffmpeg, yes)
AC_CHECK_PROG(MPLAYER, mplayer, yes)
AC_CHECK_PROG(LA, la, yes)
AC_CHECK_PROG(BONK, bonk, yes)
AC_CHECK_PROG(MPPENC, mppenc, yes)
AC_CHECK_PROG(MPPDEC, mppdec, yes)
AC_CHECK_PROG(OFR, ofr, yes)
AC_CHECK_PROG(OFS, ofs, yes)
AC_CHECK_PROG(LPAC, lpac, yes)
AC_CHECK_PROG(TTAENC, ttaenc, yes)
AC_CHECK_PROG(WAVPACK, wavpack, yes)
AC_CHECK_PROG(WVUNPACK, wvunpack, yes)

###################################
# Check for required perl modules #
###################################

echo ""
echo "checking for required perl modules..."
echo ""

AC_PROG_PERL_MODULES(	Switch
			strict
			warnings 
			Getopt::Long 
			File::Basename 
			File::Find 
			File::Spec::Functions 
			CDDB_get
			Ogg::Vorbis::Header 
			Audio::Musepack 
			Audio::APETags 
			Audio::WMA 
			MP3::Tag
			MP4::Info 
			Audio::FLAC::Header, ,
AC_MSG_ERROR(missing: $ac_perl_module.  try running the mod-install.sh script located in the extra directory, or you can install them manually using: perl -MCPAN -e 'install Module::Name'))

echo ""
echo "determining which plugins should be installed..."
echo ""

AC_ARG_WITH(amarok,
        AC_HELP_STRING([--without-amarok],[disable amarok plugin.]),
	[inc_amarok=$withval],
	[inc_amarok=yes]
)
                        
if test "$inc_amarok" != "no"; then
                       
	INSTALL_AMAROK="yes"
	plugins=1
	AC_CHECK_PROG(AMAROK, amarok, yes)
                       
	if test x$AMAROK != xyes; then
	INSTALL_AMAROK="no"
	plugins=0
	fi
fi
                                                                                
AC_ARG_WITH(dolphin,
	AC_HELP_STRING([--without-dolphin],[disable dolphin service menu.]),
	[inc_dolp=$withval],
	[inc_dolp=yes]
)

if test "$inc_dolp" != "no"; then
	
	INSTALL_DOLP="yes"
	plugins=1
	AC_CHECK_PROG(DOLP, dolphin, yes)
	
	if test x$DOLP != xyes; then
	INSTALL_DOLP="no"
	plugins=0
	fi
fi
	
AC_ARG_WITH(d3lphin,
	AC_HELP_STRING([--without-d3lphin],[disable d3lphin service menu.]),
	[inc_d3lp=$withval],
	[inc_d3lp=yes]
)

if test "$inc_d3lp" != "no"; then

	INSTALL_D3LP="yes"
	plugins=1
	AC_CHECK_PROG(D3LP, d3lphin, yes)
	
	if test x$D3LP != xyes; then
	INSTALL_D3LP="no"
	plugins=0
	fi
fi

AC_ARG_WITH(konq,
	AC_HELP_STRING([--without-konq],[disable konqueror service menu.]),
	[inc_konq=$withval],
	[inc_konq=yes]
)

if test "$inc_konq" != "no"; then

	INSTALL_KONQ="yes"
	plugins="1"
	AC_CHECK_PROG(KONQ, konqueror, yes)
	
	if test x$KONQ != xyes; then
	INSTALL_KONQ="no"
	plugins=0
	fi
fi

AC_ARG_ENABLE([all],
	[AS_HELP_STRING([--enable-all],[force installation of all included plugins.  This option is intended to help developers installing pacpl in a chroot.])],
	[],
	[enable_all=check]
)

if test x$enable_all = xyes; then

	echo ""
	echo "forcing installation of all service menus and plugins."
	echo ""
	
	INSTALL_KONQ="yes"
	INSTALL_DOLP="yes"
	INSTALL_D3LP="yes"
	INSTALL_AMAROK="yes"
	plugins=1

fi
	
if test "$plugins" = "1"; then

	AC_CHECK_PROG(KDIALOG, kdialog, yes)
	
	if test "$KDIALOG" != "yes"; then
	echo ""
	echo "WARNING:"
	echo ""
	echo "kdialog could not be found in your PATH."
	echo ""
	echo "this application can be found in the kdebase package."
	echo "service menus and the amarok plugin will not work correctly"
	echo "without this program."	
	echo ""
	echo "If you are building pacpl in a chroot environment, or if you"
	echo "are certain kdialog is installed, you can ignore this warning."
	echo ""
	fi
fi

AC_ARG_VAR([KDEDIR], [root directory of your KDE installation (default /usr)])
AC_ARG_VAR([DESTDIR], [root installation directory (default /)])

AC_OUTPUT(Makefile)

if test x$plugins = x1; then

	echo ""

	echo "--------------------"
	echo "| Included Plugins |"
	echo "--------------------"
	echo ""

	if test x$INSTALL_KONQ = xyes; then
		echo "- Konqueror service menu"
	fi
	
	if test x$INSTALL_DOLP = xyes; then
		echo "- Dolphin service menu"
	fi

	if test x$INSTALL_D3LP = xyes; then
		echo "- D3lphin service menu"
	fi

	if test x$INSTALL_AMAROK = xyes; then
		echo "- Amarok plugin"
	fi
	
fi

if test x$plugins = x0; then

	echo ""
	echo "----------------------------------"
	echo "| all plugins have been disabled |"
	echo "----------------------------------"
	echo ""
fi

echo ""
echo "Good - your configure finished. Start make now"
echo ""

