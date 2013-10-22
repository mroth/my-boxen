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

github "boxen",      "3.0.2"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "autoconf",   "1.0.0"
github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.3.2"
github "homebrew",   "1.4.1"
github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.3.0"
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.3.4"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "adium",             "1.2.0"
github "caffeine",          "1.0.0"
github "chrome",            "1.1.1"
github "cloudapp",          "1.0.0"
github "dropbox",           "1.1.1"
github "evernote",          "2.0.4"
github "firefox",           "1.1.3"
github "flux",              "1.0.0"
github "github_for_mac",    "1.0.1"
github "go",                "1.0.1"
github "heroku",            "2.0.0"
github "hipchat",           "1.0.8"
github "imagemagick",       "1.2.1"
github "iterm2",            "1.0.3"
github "macvim",            "1.0.0"
github "mou",               "1.1.3"
github "osx",               "1.6.0"
github "property_list_key", "0.1.0" #for puppet-osx
github "redis",             "1.0.0"
github "sizeup",            "1.0.0"
github "skype",             "1.0.6"
github "spotify",           "1.0.1"
github "steam",             "1.0.1"
github "sublime_text_2",    "1.1.2"
github "textmate",          "1.1.0"
github "transmission",      "1.0.0"
github "vagrant",           "2.0.14"
github "virtualbox",        "1.0.7"
github "vlc",               "1.0.5"
github "vmware_fusion",     "1.0.0"
github "wget",              "1.0.0"
github "xquartz",           "1.1.0"
github "zsh",               "1.0.0"
