# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.3.6"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",    "1.0.1"
github "foreman",    "1.1.0"
github "gcc",        "2.0.1"
github "git",        "1.3.7"
github "go",         "1.1.0"
github "homebrew",   "1.6.0"
github "hub",        "1.3.0"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.3"
github "nodejs",     "3.5.0"
github "openssl",    "1.0.0"
github "phantomjs",  "2.1.0"
github "pkgconfig",  "1.0.0"
github "repository", "2.2.0"
github "ruby",       "7.1.6"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# puppet-ruby takes advantage of the below starting with v7.0.0
github "puppet-module-data", "0.0.1", :repo => "ripienaar/puppet-module-data"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "adium",             "1.3.0"
github "caffeine",          "1.0.0"
github "chrome",            "1.1.2"
github "cloudapp",          "1.0.0"
github "dropbox",           "1.2.0"
github "evernote",          "2.0.4"
github "firefox",           "1.1.6"
github "flux",              "1.0.0"
github "github_for_mac",    "1.0.1"
github "heroku",            "2.1.1"
github "hipchat",           "1.1.0"
github "imagemagick",       "1.2.1"
github "iterm2",            "1.0.5"
github "macvim",            "1.0.0"
github "mou",               "1.1.3"
github "osx",               "2.2.2"
github "redis",             "2.1.0"
github "sizeup",            "1.0.0"
github "skype",             "1.0.7"
github "spotify",           "1.0.1"
github "steam",             "1.0.1"
github "sublime_text_2",    "1.1.2"
github "textmate",          "1.1.0"
github "transmission",      "1.0.0"
github "vagrant",           "3.0.3"
github "virtualbox",        "1.0.9"
github "vlc",               "1.0.5"
github "vmware_fusion",     "1.1.0"
github "wget",              "1.0.0"
github "xquartz",           "1.1.0"
github "zsh",               "1.0.0"
