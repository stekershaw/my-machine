#
# Cookbook Name:: my-machine
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# This recipe will install a number of essentials.
# Currently it is using chocolatey to do this on Windows.
# It is a way of doing what https://ninite.com/ does with chef and chocolatey.

include_recipe 'chocolatey'
include_recipe 'webpi'
 
# Package specific notes
#  Dropbox will bring up its 'link' screen after install but this does not block.
case node['platform_family']
when 'windows'

  # Chocolatey install
  %w{
    7zip
    adobereader
    atom
    bind-toolsonly
    conemu
    cyberduck
    dropbox
    ethanbrown.conemuconfig
    fiddler4
    gimp
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

  # WebPI
  %w{
    IIS7
  }.each do |product|
    webpi_product product do
      accept_eula true
      action :install
    end
  end
end

# The following are available through chocolatey but I will elect to install 
# manually:
#
#  golang:       I want to be able to update quicker that the chocolatey
#                package tends to
#  robomongo:    Outdated on chocolatey
#  visualstudio: May need to be Express/Community/Web Edition etc depending on
#                circumstance. Also huge, so perhaps not always wanted.
#  yed:          broken on chocolatey at the time of writing (2016-01-21)
#
manual_chocolatey = %w{
    golang
    robomongo
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
#  http://docs.aws.amazon.com/cli/latest/userguide/installing.html


