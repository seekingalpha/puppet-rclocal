# File::      <tt>params.pp</tt>
# Author::    S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl aka. UL HPC Management Team (hpc-sysadmins@uni.lu)
# Copyright:: Copyright (c) 2016 S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl aka. UL HPC Management Team
# License::   Gpl-3.0
#
# ------------------------------------------------------------------------------
# You need the 'future' parser to be able to execute this manifest (that's
# required for the each loop below).
#
# Thus execute this manifest in your vagrant box as follows:
#
#      sudo puppet apply -t --parser future /vagrant/tests/params.pp
#
#

include 'rclocal::params'

$names = ["ensure", "rc_localconf", "rc_localconf_mode", "rc_localconf_owner", "rc_localconf_group"]

notice("rclocal::params::ensure = ${rclocal::params::ensure}")
notice("rclocal::params::rc_localconf = ${rclocal::params::rc_localconf}")
notice("rclocal::params::rc_localconf_mode = ${rclocal::params::rc_localconf_mode}")
notice("rclocal::params::rc_localconf_owner = ${rclocal::params::rc_localconf_owner}")
notice("rclocal::params::rc_localconf_group = ${rclocal::params::rc_localconf_group}")

#each($names) |$v| {
#    $var = "rclocal::params::${v}"
#    notice("${var} = ", inline_template('<%= scope.lookupvar(@var) %>'))
#}
