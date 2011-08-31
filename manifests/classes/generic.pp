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

    # Include basic modules
    include 'common'
    #include 'test'

    include 'generic'
    include 'rsync'
    include 'git'

    include 'ssh::client'

    # complete with basic packages
    #package { $generic::params::generic_packages:
    #    ensure  => present,
    #}

}


# ------------------------------------------------------------------------------
# = Class: generic::debian
#
# Specialization class for Debian systems
class generic::debian inherits generic::common {
    # log the boot process by putting BOOTLOGD_ENABLE=Yes in /etc/default/bootlogd
    # TODO : check squeeze version? 
    augeas { "${generic::params::bootlogd_defaultconf}/BOOTLOGD_ENABLE":
        context => "/files/${generic::params::bootlogd_defaultconf}",
        onlyif  => "get BOOTLOGD_ENABLE != 'Yes'",
        changes => "set BOOTLOGD_ENABLE 'Yes'"
    }



}

# ------------------------------------------------------------------------------
# = Class: generic::redhat
#
# Specialization class for Redhat systems
class generic::redhat inherits generic::common { }

