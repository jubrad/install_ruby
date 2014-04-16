#!/bin/bash -ex


install() #this instal method takes care of yes and what nots
{
    apt-get update
    DEBIAN_FRONTEND=noninteractive sudo apt-get -y \
        -o DPkg::Options::=--force-confdef \
        -o DPkg::Options::=--force-confold \
        install $@
}

sudo echo '

myip()
{ 
 echo $(curl -ss http://169.254.169.254/latest/meta-data/public-ipv4)
}
'  > ~/.bashrc


#####################installing rvm to manage rubys############
cd $HOME

echo "installing latest verson of rvm" #could install ruby during this

\curl -L https://get.rvm.io | bash #runs the rvm setup.  
    #could isntall ruby during this process

#do not run rvm requirements they're not needed and cause errors for some reason

#this is needed to load the rvm env to your current bash session
echo 'source /home/ubuntu/.rvm/scripts/rvm' | cat >> .bash_profile

################### from here we need to set bash environment ######

echo "setting the export path"
# this isn't needed but prevenets a warning from displaying
echo 'export rvmsudo_secure_path=1' | cat >> .bashrc

#applies setting and chagnes .bash_profile
echo 'applying changes'
source ~/.bash_profile
source ~/.bashrc


################### installing appropriate version of ruby ########

echo "installing newest version of ruby"

#these should be changed to install a specific ruby
rvm install 2.1.0 #this should work without a sudo command(hopefully)

#uses whichever ruby version was installed
rvm use 2.1.0



############### install git...we can change this to be local ####

#install git

################## END ####################################

