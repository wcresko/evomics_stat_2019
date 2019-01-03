# # # # # # # # # # # # # # # # # # # # # # # # #
#
# .profile file for Bradnam/Korf Unix/Perl course
#
# # # # # # # # # # # # # # # # # # # # # # # # # 

# tell Unix to treat the USB drive as the home directory
# if you are using Cygwin under Windows, or are running Linux
# this command will probably need to be changed.
HOME="/Volumes/USB/Unix_and_Perl_course"
cd $HOME

# # # # # # # # # # # # # # # # # # #
# Set up paths
# # # # # # # # # # # # # # # # # # #

# Add local code directories to path
PATH=$PATH":$HOME/Code"

# add local code directory to Perl library path
export PERL5LIB=$PERL5LIB:$HOME/Code

############
#
# ALIASES
#
############

# general command line short-cuts

# better display of directories
alias ls="ls -p"

# make sure we don't accidentally delete or overwrite anything
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i" 

# want to keep a clean screen?
alias cls="clear;ls"


