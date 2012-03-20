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
                    'lsof', 'nmap', 'tcpdump', 'iotop', 'htop', 'sysstat', 'telnet',
# Installation helpers
                    'wget', 'lynx', 'links',
                    'curl.x86_64', # the 32bit version has a funny dependency on e2fs and as a consequence, glibc
# Code versioning tools
                    'rcs', 'cvs', 'hg',
                    'subversion.x86_64', # the 32bit version has a funny dependency on e2fs and as a consequence, glibc
                    # 'git', # not needed explicitly since module exists
# Popular editors
                    'joe', 'nano',
                    # 'vim-enhanced', # not needed explicitly since module exists
# Popular shells
                    'tcsh', 'ksh', 'zsh',
                    # 'bash', 'csh', # not needed explicitly
# Archivers & compressors
                    'bzip2', 'rzip', 'unzip', 'zip', 'lzip', 'arc', 'pax',
                    # 'cpio', 'gzip', # not needed explicitly
# Commonly setup by default install, but put here just in case
                    'at', 'bc', 'ed', 'file', 'm4', 'make', 'patch',
                    'screen', 'time', 'strace',
                    # 'procps', # not needed explicitly
##                    'ntpdate', # Not needed, this arrives via the ntp package on modern RHEL compatible distros
# Other
                    'pwgen', 'jwhois', 'man', 'gdb', 'ethtool', 'gawk',
                    'bind-utils', # dig & host utils come with this one
                    'nc',
##                   'figlet', # this requires to have the rpmforge repo available, otherwise package resolution fails
                    'redhat-lsb.x86_64', # the 32bit version has a funny dependency on e2fs and as a consequence, glibc
                    'util-linux', # this brings script, very handy for creating typescript files
                    'binutils',   # this brings gprof
                    'yum-utils'   # this brings repoquery
                    ],
        default => [
# Inspection tools
                    'lsof', 'nmap', 'tcpdump', 'iotop', 'htop', 'sysstat', 'telnet',
# Installation helpers
                    'wget', 'lynx', 'links', 'curl',
# Code versioning tools
                    'rcs', 'cvs', 'subversion', 'mercurial',
                    # 'git', # not needed explicitly since module exists
# Popular editors
                    'joe', 'nano',
                    # 'vim', # not needed explicitly since module exists
# Popular shells
                    'tcsh', 'ksh', 'zsh',
                    # 'bash', 'csh', # not needed explicitly
# Archivers & compressors
                    'bzip2', 'rzip', 'unzip', 'zip', 'lzip', 'arc', 'pax',
                    # 'cpio', 'gzip', # not needed explicitly
# Commonly setup by default install, but put here just in case
                    'at', 'bc', 'ed', 'file', 'm4', 'make', 'patch',
                    'screen', 'time', 'strace',
                    # 'procps', # not needed explicitly
                    'ntpdate',
# Other
                    'pwgen', 'jwhois', 'man', 'gdb', 'ethtool', 'gawk',
                    'dnsutils',
                    'netcat-traditional',
                    'figlet',
                    'console-data',
                    'lsb-release'
                    ]
    }

    $bootlogd_defaultconf = $operatingsystem ? {
        debian  => "/etc/default/bootlogd",
        default => ''
    }

    # The /etc/rc.local file
    $rc_localconf = $operatingsystem ? {
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

