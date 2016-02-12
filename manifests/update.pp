# File::      <tt>update.pp</tt>
# Author::    S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl aka. UL HPC Management Team (hpc-sysadmins@uni.lu)
# Copyright:: Copyright (c) 2016 S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl aka. UL HPC Management Team
# License::   Gpl-3.0
#
# ------------------------------------------------------------------------------
# = Defines: rclocal::update
#
# Update the content of the file /etc/rc.local
#
# == Pre-requisites
#
# * The class 'rclocal' should have been instanciated
#
# == Parameters:
#
# [*ensure*]
#   default to 'present', can be 'absent'.
#   Default: 'present'
#
# [*content*]
#  Specify the contents of the export entry as a string. Newlines, tabs,
#  and spaces can be specified using the escaped syntax (e.g., \n for a newline)
#
# [*source*]
#  Copy a file as the content of the export entry.
#  Uses checksum to determine when a file should be copied.
#  Valid values are either fully qualified paths to files, or URIs. Currently
#  supported URI types are puppet and file.
#  In neither the 'source' or 'content' parameter is specified, then the
#  following parameters can be used to set the console entry.
#
# [*order*]
#  Set the order of the export entry (typically between 10 and 90).
#  Default: 50
#
# == Sample Usage:
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
# [Remember: No empty lines between comments and class definition]
#
define rclocal::update(
    $ensure         = 'present',
    $content        = undef,
    $source         = undef,
    $order          = '50'
)
{
    include rclocal::params

    # $name is provided by define invocation
    $entryname = $name

    if ! ($ensure in [ 'present', 'absent' ]) {
        fail("rclocal::update 'ensure' parameter must be set to either 'absent', or 'present'")
    }

    $real_content = $content ? { 
        '' => undef, 
        default => $source ? { 
            ''      => $content,
            default => undef
        }   
    }   

    $real_source = $source ? { 
        '' => undef, 
        default => $content ? { 
            ''      => $source,
            default => undef
        }   
    }   

   concat::fragment { "${rclocal::params::rc_localconf} ${entryname}":
        ensure  => $ensure,
        target  => $rclocal::params::rc_localconf,
        order   => $order,
        content => $real_content,
        source  => $real_source
    }
}



