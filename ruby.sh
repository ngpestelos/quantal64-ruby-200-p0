#!/bin/sh
 
# Install ruby 2.0
cd /tmp
wget http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
tar xvzf ruby-2.0.0-p0.tar.gz
cd ruby-2.0.0-p0
./configure --prefix=/opt/ruby CFLAGS="-O3 -funroll-loops -fomit-frame-pointer -pipe"
make
make install
cd ..
rm -rf ruby-2.0.0-p0
rm ruby-2.0.0-p0.tar.gz
 
# Install RubyGems
wget http://production.cf.rubygems.org/rubygems/rubygems-2.0.2.tgz
tar xvzf rubygems-2.0.2.tgz
cd rubygems-2.0.2
/opt/ruby/bin/ruby setup.rb
cd ..
rm -rf rubygems-2.0.2
 
# Install Bundler
/opt/ruby/bin/gem install bundler

# Add /opt/ruby/bin to the global path
echo 'PATH=$PATH:/opt/ruby/bin'> /etc/profile.d/vagrantruby.sh
