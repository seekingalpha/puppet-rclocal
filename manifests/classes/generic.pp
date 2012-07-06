# File::      <tt>generic.pp</tt>
# Author::    Sebastien Varrette (Sebastien.Varrette@uni.lu)
# Copyright:: Copyright (c) 2011 Sebastien Varrette
# License::   GPLv3
# ------------------------------------------------------------------------------
# = Class: generic
#
# This is the generic module that is applied to *ALL* nodes
#
# == Requires:
#
# see all the included classes
#
# == Sample Usage:
#
#     include generic
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
#
# [Remember: No empty lines between comments and class definition]
#
class generic inherits generic::params {

    case $::operatingsystem {
        debian, ubuntu:         { include generic::debian }
        redhat, fedora, centos: { include generic::redhat }
        default: {
            fail("Module $module_name is not supported on $operatingsystem")
        }
    }
}


# ------------------------------------------------------------------------------
# = Class: generic::common
#
# Base class to be inherited by the generic class
#
# Note: respect the Naming standard provided here[http://projects.puppetlabs.com/projects/puppet/wiki/Module_Standards]
class generic::common {
    # Load the variables used in this module. Check the ssh-server-params.pp file
    require generic::params

    #include common
    include augeas
    include puppet::agent
    include concat::setup
    #include 'test'
    include rsync
    include git
    include bash
    include kernel
    include vim
    include sudo
    include ssh::client

    # install useful utils
    package { $generic::params::utils_packages :
        ensure  => 'present',
    }

    file { '/etc/hostname':
        owner => root,
        group => root,
        mode=> 644,
        content => template("generic/hostname.erb");
    }

    # Ensure correct right on the root homedir
    file { '/root':
        ensure => 'directory',
        owner  => root,
        group  => root,
        mode   => '0700',
    }

    # Setup bash for the root user
    bash::setup { '/root':
        ensure => 'present',
        user   => 'root',
        group  => 'root',
    }

    # Prepare the manipulation of /etc/rc.local
    include concat::setup
    concat { "${generic::params::rc_localconf}":
        warn    => false,
        mode    => "${generic::params::rc_localconf_mode}",
        owner   => "${generic::params::rc_localconf_owner}",
        group   => "${generic::params::rc_localconf_group}"
    }
    # Header of the /etc/rc.local file
    $rc_local_header = $::operatingsystem ? {
        /(?i-mx:ubuntu|debian)/ => 'rc.local.debian_header',
        /(?i-mx:redhat|centos)/ => 'rc.local.redhat_header'
    }

    concat::fragment { "${generic::params::rc_localconf}_header":
        target  => "${generic::params::rc_localconf}",
        source  => "puppet:///modules/generic/etc/${rc_local_header}",
        ensure  => 'present',
        order   => 01,
    }




}


# ------------------------------------------------------------------------------
# = Class: generic::debian
#
# Specialization class for Debian systems
class generic::debian inherits generic::common {

    # Apt configuration management
    include apt

    # log the boot process by putting BOOTLOGD_ENABLE=Yes in /etc/default/bootlogd
    # TODO : check squeeze version?
    augeas { "${generic::params::bootlogd_defaultconf}/BOOTLOGD_ENABLE":
        context => "/files/${generic::params::bootlogd_defaultconf}",
        onlyif  => "get BOOTLOGD_ENABLE != 'Yes'",
        changes => "set BOOTLOGD_ENABLE 'Yes'"
    }

    # /etc/rc.local footer on Debian systems
    concat::fragment { "${generic::params::rc_localconf}_footer":
        target  => "${generic::params::rc_localconf}",
        source  => "puppet:///modules/generic/etc/rc.local.debian_footer",
        ensure  => 'present',
        order   => 99,
    }



}

# ------------------------------------------------------------------------------
# = Class: generic::redhat
#
# Specialization class for Redhat systems
class generic::redhat inherits generic::common { }

