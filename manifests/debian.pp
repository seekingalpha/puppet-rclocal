# File::      <tt>rclocal/debian.pp</tt>
# Author::    UL HPC Team aka. S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl (hpc-sysadmins@uni.lu)
# Copyright:: Copyright (c) 2015 UL HPC Team aka. S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl
# License::   Gpl-3.0
#
# ------------------------------------------------------------------------------
# = Class: rclocal::debian
#
# Specialization class for Debian systems
class rclocal::debian inherits rclocal::common {

    # /etc/rc.local footer on Debian systems
    concat::fragment { "${rclocal::params::rc_localconf}_footer":
        target => $rclocal::params::rc_localconf,
        source => 'puppet:///modules/rclocal/etc/rc.local.debian_footer',
        order  => 99,
    }

}
