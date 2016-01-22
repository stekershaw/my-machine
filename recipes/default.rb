#
# Cookbook Name:: my-machine
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# This recipe will install a number of essentials.
# Currently it is using chocolatey to do this on Windows.
# It is a way of doing what https://ninite.com/ does with chef and chocolatey.

include_recipe 'chocolatey'
 
# Package specific notes
#  Dropbox will bring up its 'link' screen after install but this does not block.
case node['platform_family']
when 'windows'
  %w{
    7zip
    adobereader
    atom
    bind-toolsonly
    cyberduck
    dropbox
    fiddler4
    git
    intellijidea-community
    mssqlservermanagementstudio2014express
    p4merge
    skype
    slack
    sourcetree
    sysinternals
    vlc
    wireshark
  }.each do |package|
    chocolatey package  # default action is install
  end
end

# The following are available through chocolatey but I will elect to install 
# manually:
#
#  golang:       I want to be able to update quicker that the chocolatey
#                package tends to
#  visualstudio: May need to be Express/Community/Web Edition etc depending on
#                circumstance. Also huge, so perhaps not always wanted.
#  yed:          broken on chocolatey at the time of writing (2016-01-21)
#
manual_chocolatey = %w{
    golang
    visualstudio2013expressweb
    yed
}

# The following I may elect to install, but not yet decided. TBC...
# Package specific notes:
#
#  Chef: will block on Wireshark, waiting for the libpcap license agreement.
#
tbc = %w{
    chefdk
    consul
    firefox
    googlechrome
    googledrive
    paint.net
    r.project
    recuva
}

# Need to install manually:
#  https://www.docker.com/docker-toolbox
