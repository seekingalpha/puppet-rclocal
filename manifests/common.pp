# File::      <tt>common.pp</tt>
# Author::    S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl aka. UL HPC Management Team (hpc-sysadmins@uni.lu)
# Copyright:: Copyright (c) 2016 S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl aka. UL HPC Management Team
# License::   Gpl-3.0
#
# ------------------------------------------------------------------------------
# = Class: rclocal::common
#
# Base class to be inherited by the other rclocal classes, containing the common code.
#
# Note: respect the Naming standard provided here[http://projects.puppetlabs.com/projects/puppet/wiki/Module_Standards]

class rclocal::common {

    # Load the variables used in this module. Check the params.pp file
    require rclocal::params

    concat { $rclocal::params::rc_localconf:
        warn  => false,
        mode  => $rclocal::params::rc_localconf_mode,
        owner => $rclocal::params::rc_localconf_owner,
        group => $rclocal::params::rc_localconf_group
    }

    # Header of the /etc/rc.local file
    $rc_local_header = $::operatingsystem ? {
        /(?i-mx:ubuntu|debian)/ => 'rc.local.debian_header',
        /(?i-mx:redhat|centos)/ => 'rc.local.redhat_header'
    }

    concat::fragment { "${rclocal::params::rc_localconf}_header":
        target => $rclocal::params::rc_localconf,
        source => "puppet:///modules/rclocal/etc/${rc_local_header}",
        order  => 01,
    }

}
