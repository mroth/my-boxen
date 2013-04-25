# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

# github "boxen", "1.3.2"
github "boxen", "2.1.0"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",  "1.0.0"
github "gcc",      "1.0.0"
github "git",      "1.2.2"
# mod    "git",      :ref => "fix-git-options", :git => "https://github.com/bradleywright/puppet-git"
github "homebrew", "1.1.2"
github "hub",      "1.0.0"
github "inifile",  "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"
github "nginx",    "1.4.0"
github "nodejs",   "2.1.0"
# github "nvm",      "1.0.0" #it seems like nodejs 2.0 above made this obsolete
github "repository", "2.0.2"
github "ruby",     "4.0.0"
github "stdlib",   "4.0.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",     "1.0.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "vagrant",         "2.0.6"
github "vmware_fusion",   "1.0.0"
github "virtualbox",      "1.0.1"
github "macvim",          "1.0.0"
github "chrome",          "1.1.0"
github "firefox",         "1.0.5"
github "hipchat",         "1.0.2"
github "skype",           "1.0.2"
github "dropbox",         "1.1.0"
github "sizeup",          "1.0.0"
github "iterm2",          "1.0.2" #iterm2:stable or iterm2:dev
github "caffeine",        "1.0.0"
github "flux",            "0.0.1"
github "vlc",             "1.0.0"
github "sublime_text_2",  "1.1.0"
github "textmate",        "1.1.0"
github "mou",             "1.0.0"
github "wget",            "1.0.0"
github "xquartz",         "1.1.0"
github "imagemagick",     "1.2.0"
github "zsh",             "1.0.0"
github "heroku",          "2.0.0"
github "redis",           "1.0.0"
github "osx",             "1.1.0" #required for zsh, vmware, lots of stuff
github "adium",			      "1.1.1"
# github "github_for_mac",  "1.0.0" #no bueno? try again with 1.0.1?
github "github_for_mac", "1.2.0", :repo => "dieterdemeyer/puppet-github_for_mac"
