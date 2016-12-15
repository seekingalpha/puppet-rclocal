# File::      <tt>init.pp</tt>
# Author::    S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl aka. UL HPC Management Team (hpc-sysadmins@uni.lu)
# Copyright:: Copyright (c) 2016 S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl aka. UL HPC Management Team
# License::   Gpl-3.0
#
# ------------------------------------------------------------------------------
# = Class: rclocal
#
# Configure the rc.local file
#
# == Parameters:
#
# $ensure:: *Default*: 'present'. Ensure the presence (or absence) of rclocal
#
# == Actions:
#
# Install and configure rclocal
#
# == Requires:
#
# n/a
#
# == Sample Usage:
#
#     include 'rclocal'
#
# You can then specialize the various aspects of the configuration,
# for instance:
#
#         class { 'rclocal':
#             ensure => 'present'
#         }
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
#
# [Remember: No empty lines between comments and class definition]
#
class rclocal(
  $fragments = undef,
) inherits rclocal::params {

  case $::operatingsystem {
    debian, ubuntu:         { include rclocal::debian }
    redhat, fedora, centos: { include rclocal::redhat }
    default: {
      fail("Module ${module_name} is not supported on $::{operatingsystem}")
    }
  }

  if ! empty($fragments) {
    validate_hash($fragments)
    $fragment_defaults = {
      'order' => '50'
    }
    create_resources('::rclocal::fragment',
      hiera_hash($fragments,{}),
      $fragment_defaults
    )
  }
}



