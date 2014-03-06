# File::      <tt>generic-params.pp</tt>
# Author::    Sebastien Varrette (Sebastien.Varrette@uni.lu)
# Copyright:: Copyright (c) 2011 Sebastien Varrette
# License::   GPLv3
#
# ------------------------------------------------------------------------------
# = Class: generic::params
#
# In this class are defined as variables values that are used in the
# generic classes.
# This class should be included, where necessary, and eventually be enhanced
# with support for more OS
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
# [Remember: No empty lines between comments and class definition]
#
class generic::params {

    #### MODULE INTERNAL VARIABLES  #########
    # (Modify to adapt unsupported OSes)
    #######################################
    $utils_packages = $operatingsystem ? {
        /(?i-mx:redhat|centos)/ => [
                    # Inspection tools
                    'lsof', 'nmap', 'tcpdump', 'telnet',
                    'iotop', 'htop', 'dstat',
                    # Installation helpers
                    'wget', 'lynx',
                    'elinks',      # this is the name for this package on RHEL distros
                    'curl.x86_64',
                    # Code versioning tools
                    'mercurial',
                    'subversion.x86_64',
                    # Popular editors
                    'nano',
                    # Archivers & compressors
                    'bzip2', 'unzip', 'zip',
                    # Commonly setup by default install, but put here just in case
                    'at', 'bc', 'ed', 'file', 'm4', 'make', 'patch',
                    'screen', 'time', 'strace',
                    # Other
                    'finger',
                    'pwgen', 'man', 'ethtool', 'gawk',
                    'bind-utils', # dig & host utils come with this one
                    'nc',
                    'binutils',   # this brings gprof
                    'yum-utils',  # this brings repoquery
                    'redhat-lsb.x86_64'
                    ],
        default => [
                    'debian-keyring', 'deborphan',
                    # Inspection tools
                    'lsof', 'nmap', 'tcpdump', 'telnet',
                    'iotop', 'htop', 'dstat',
                    # Installation helpers
                    'wget', 'lynx', 'links', 'curl',
                    # Code versioning tools
                    'subversion', 'mercurial',
                    # Popular editors
                    'nano',
                    # Archivers & compressors
                    'bzip2', 'unzip', 'zip',
                    # Commonly setup by default install, but put here just in case
                    'at', 'bc', 'ed', 'file', 'm4', 'make', 'patch',
                    'screen', 'time', 'strace',
                    'ntpdate',
                    # Other
                    'finger',
                    'unison',
                    'pwgen', 'man-db', 'ethtool', 'gawk',
                    'dnsutils',
                    'netcat-traditional',
                    'figlet', 'cowsay',
                    'console-data',
                    'xauth',
                    'lsb-release'
                    ]
    }

    $bootlogd_defaultconf = $operatingsystem ? {
        debian  => "/etc/default/bootlogd",
        default => ''
    }

    # The /etc/rc.local file
    $rc_localconf = $operatingsystem ? {
        /(?i-mx:redhat|centos|fedora)/ => '/etc/rc.d/rc.local',
        default => '/etc/rc.local'
    }
    $rc_localconf_mode = $::operatingsystem ? {
        default => '0755',
    }
    $rc_localconf_owner = $::operatingsystem ? {
        default => 'root',
    }
    $rc_localconf_group = $::operatingsystem ? {
        default => 'root',
    }


}

