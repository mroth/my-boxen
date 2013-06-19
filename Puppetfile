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

github "boxen", "2.3.3"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",    "1.0.0"
github "gcc",        "1.0.0"
github "git",        "1.2.4"
github "homebrew",   "1.1.2"
github "hub",        "1.0.0"
github "inifile",    "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.2.4"
github "repository", "2.2.0"
github "ruby",       "5.2.1"
github "stdlib",     "4.0.2", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "vagrant",         "2.0.7"
github "vmware_fusion",   "1.0.0"
github "virtualbox",      "1.0.3"
github "macvim",          "1.0.0"
github "chrome",          "1.1.0"
github "firefox",         "1.1.0"
github "hipchat",         "1.0.6"
github "skype",           "1.0.2"
github "dropbox",         "1.1.0"
github "sizeup",          "1.0.0"
github "iterm2",          "1.0.2"
github "caffeine",        "1.0.0"
github "flux",            "0.0.1"
github "vlc",             "1.0.0"
github "sublime_text_2",  "1.1.1"
github "textmate",        "1.1.0"
github "mou",             "1.0.0"
github "wget",            "1.0.0"
github "xquartz",         "1.1.0"
github "imagemagick",     "1.2.0"
github "zsh",             "1.0.0"
github "heroku",          "2.0.0"
github "redis",           "1.0.0"
github "osx",             "1.2.0"
github "adium",			      "1.1.1"
# github "github_for_mac",  "1.0.0" #no bueno? try again with 1.0.1?
github "github_for_mac",  "1.2.0", :repo => "dieterdemeyer/puppet-github_for_mac"
github "transmission",    "1.0.0"

#postgres stuff
# mod "postgresql", :ref => "v9.2.4", :git => "https://github.com/mroth/puppet-postgresql.git"
# github "sysctl",              "1.0.0"
