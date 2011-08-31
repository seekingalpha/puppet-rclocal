# File::      <tt>generic-params.pp</tt>
# Author::    Sebastien Varrette (Sebastien.Varrette@uni.lu)
# Copyright:: Copyright (c) 2011 Sebastien Varrette
# License::   GPLv3
#
# Time-stamp: <Wed 2011-08-31 11:29 svarrette>
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
    $generic_packages = $operatingsystem ? {
        debian  => [],
        default => []
    }

    $bootlogd_defaultconf = $operatingsystem ? {
        debian  => "/etc/default/bootlogd",
        default => ''
    }



}

