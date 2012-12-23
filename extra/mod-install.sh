#!/bin/bash
#
# Run this script to install the required modules for 
# the Perl Audio Converter.

cpan="perl -MCPAN -e"

$cpan 'install Parse::RecDescent'
$cpan 'install Carp'
$cpan 'install Inline'
$cpan 'install Inline::C'
$cpan 'install Devel::Symdump'
$cpan 'install Switch'
$cpan 'install Pod::Coverage'
$cpan 'install Test::Pod::Coverage'
$cpan 'install MP3::Info'
$cpan 'install Audio::Musepack'
$cpan 'install Audio::WMA'
$cpan 'force install Audio::FLAC::Header'
$cpan 'install MP3::Tag'
$cpan 'install Ogg::Vorbis::Header'
$cpan 'install IO::String'
$cpan 'install MP4::Info'
$cpan 'install Audio::APETags'
$cpan 'install CDDB_get'