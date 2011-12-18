# File::      <tt>update-rc_local.pp</tt>
# Author::    Sebastien Varrette (<Sebastien.Varrette@uni.lu>)
# Copyright:: Copyright (c) 2011 Sebastien Varrette (www[http://varrette.gforge.uni.lu])
# License::   GPLv3
#
# ------------------------------------------------------------------------------
# = Defines: update::rc_local
#
# Update the content of the file /etc/rc.local
#
# == Pre-requisites
#
# * The class 'generic' should have been instanciated
#
# == Parameters:
#
# [*ensure*]
#   default to 'present', can be 'absent'
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
#
# [*order*]
#  Set the order of the export entry (typically between 10 and 90).
#  Default: 50
#
# == Requires:
#
# n/a
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
define update::rc_local(
    $ensure        = 'present',
    $content       = '',
    $source        = '',
    $order         = '50'
)
{

    include generic::params

    # $name is provided by define invocation
    $entryname = $name

    if ! ($ensure in [ 'present', 'absent' ]) {
        fail("update::rc_local 'ensure' parameter must be set to either 'absent', or 'present'")
    }

    #TODO: check systems for which /etc/rc.local do not exists. 
    

    # if content is passed, use that, else if source is passed use that
    $real_content = $content ? {
        '' => $source ? {
            ''      => template('generic/rclocal_entry.erb'),
            default => ''
        },
        default => $content
    }
    $real_source = $source ? {
        '' => '',
        default => $content ? {
            ''      => $source,
            default => ''
        }
    }

    concat::fragment { "${generic::params::rc_localconf} ${entryname}":
        target  => "${generic::params::rc_localconf}",
        ensure  => "${ensure}",
        order   => $order,
        content => $real_content,
        source  => $real_source
    }
}




