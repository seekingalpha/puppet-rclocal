# File::      <tt>params.pp</tt>
# Author::    S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl aka. UL HPC Management Team (hpc-sysadmins@uni.lu)
# Copyright:: Copyright (c) 2016 S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl aka. UL HPC Management Team
# License::   Gpl-3.0
#
# ------------------------------------------------------------------------------
# = Class: rclocal::params
#
# In this class are defined as variables values that are used in other
# rclocal classes.
# This class should be included, where necessary, and eventually be enhanced
# with support for more OS
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
# The usage of a dedicated param classe is advised to better deal with
# parametrized classes, see
# http://docs.puppetlabs.com/guides/parameterized_classes.html
#
# [Remember: No empty lines between comments and class definition]
#
class rclocal::params {

    #### MODULE INTERNAL VARIABLES  #########
    # (Modify to adapt to unsupported OSes)
    #######################################
    # The /etc/rc.local file
    $rc_localconf = $::operatingsystem ? {
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

