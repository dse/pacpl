# Sample MP5 codec - John Doe (johndoe@example.org)
#
# This is just a sample.

my $mp5 = {

        NAME => 'mp5',
	DEFAULT_ENCODER => 'ffmpeg',
        DEFAULT_DECODER => 'lame',
	TAGS => { READ => 0, WRITE => 0, MODULE => undef }, # do not change

        ENCODER => {
                     ffmpeg => {
		  	         NAME => 'ffmpeg',
			         ESTR => sub { "-y -i %i %o" },
			       },
 	           },

        DECODER => {
		     lame => {
			       NAME => 'lame',
			       DSTR => sub { "--decode %i %o" },
			     },
		   },
};

import_module($mp5);