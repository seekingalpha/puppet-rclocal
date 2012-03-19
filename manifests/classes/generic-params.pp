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
    # (Modify to adapt to unsupported OSes)
    #######################################
    $utils_packages = $operatingsystem ? {
        /(?i-mx:redhat|centos)/ => [
                    'lsof',
                    'nmap',
                    'tcpdump',
                    'wget',
#                   'curl', # this is commented out because of funny dependencies with e2fs and as a consequence, glibc
                    'lynx',
                    'links',
                    'pwgen',
#                   'figlet', # this requires to have the rpmforge repo available, otherwise resolution fails
                    'bind-utils',
                    'iotop',
                    'ethtool',
                    'bzip2',
                    'zip'
                    ],
        default => [
                    'lsof',
                    'nmap',
                    'tcpdump',
                    'wget',
                    'curl',
                    'lynx',
                    'links',
                    'pwgen',
                    'figlet',
                    'dnsutils',
                    'iotop',
                    'ethtool',
                    'console-data',
                    'bzip2',
                    'zip',
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

