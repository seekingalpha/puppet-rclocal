-*- mode: markdown; mode: visual-line;  -*-

# Rclocal Puppet Module 

[![Puppet Forge](http://img.shields.io/puppetforge/v/ULHPC/rclocal.svg)](https://forge.puppetlabs.com/ULHPC/rclocal)
[![License](http://img.shields.io/:license-GPL3.0-blue.svg)](LICENSE)
![Supported Platforms](http://img.shields.io/badge/platform-debian-lightgrey.svg)
[![Documentation Status](https://readthedocs.org/projects/ulhpc-puppet-rclocal/badge/?version=latest)](https://readthedocs.org/projects/ulhpc-puppet-rclocal/?badge=latest)

Configure the rc.local file

      Copyright (c) 2016 S. Varrette, H. Cartiaux, V. Plugaru, S. Diehl aka. UL HPC Management Team <hpc-sysadmins@uni.lu>
      

| [Project Page](https://github.com/ULHPC/puppet-rclocal) | [Sources](https://github.com/ULHPC/puppet-rclocal) | [Documentation](https://ulhpc-puppet-rclocal.readthedocs.org/en/latest/) | [Issues](https://github.com/ULHPC/puppet-rclocal/issues) |

## Synopsis

Configure the rc.local file.

This module implements the following elements: 

* __Puppet classes__:
    * rclocal

* __Puppet definitions__: 
    * rclocal::fragment

All these components are configured through a set of variables you will find in
[`manifests/params.pp`](manifests/params.pp). 

_Note_: the various operations that can be conducted from this repository are piloted from a [`Rakefile`](https://github.com/ruby/rake) and assumes you have a running [Ruby](https://www.ruby-lang.org/en/) installation.
See `docs/contributing.md` for more details on the steps you shall follow to have this `Rakefile` working properly. 

## Dependencies

See [`metadata.json`](metadata.json). In particular, this module depends on 

* [puppetlabs/stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib)

## Overview and Usage

### Class `rclocal`

This is the main class defined in this module.
It accepts the following parameters: 

* `$fragments` - hash of line fragments to install in rc.local file

Use it as follows:
```puppet
    class { '::rclocal': }
# OR
    class { '::rclocal':
        fragments => {
            'do_something_in_rc_local' => {
                'content' => "echo noop /etc/some_file\n",
                'order'   => '51'
            }
        }
    }
```

See also [`tests/init.pp`](tests/init.pp)

### Resource `rclocal::fragment`
```puppet
 rclocal::fragment{ 'do_something_in_rc_local':
   content => "echo noop /etc/some_file\n"
 }

 rclocal::fragment{ 'do_something_in_rc_local':
   source => 'module_name/path/to/file',
   order  => '51',
 }
```

## Librarian-Puppet / R10K Setup

You can of course configure the rclocal module in your `Puppetfile` to make it available with [Librarian puppet](http://librarian-puppet.com/) or
[r10k](https://github.com/adrienthebo/r10k) by adding the following entry:

     # Modules from the Puppet Forge
     mod "ULHPC/rclocal"

or, if you prefer to work on the git version: 

     mod "ULHPC/rclocal", 
         :git => 'https://github.com/ULHPC/puppet-rclocal',
         :ref => 'production' 

## Issues / Feature request

You can submit bug / issues / feature request using the [ULHPC/rclocal Puppet Module Tracker](https://github.com/ULHPC/puppet-rclocal/issues). 

## Developments / Contributing to the code 

If you want to contribute to the code, you shall be aware of the way this module is organized. 
These elements are detailed on [`docs/contributing.md`](contributing/index.md).

You are more than welcome to contribute to its development by [sending a pull request](https://help.github.com/articles/using-pull-requests). 

## Puppet modules tests within a Vagrant box

The best way to test this module in a non-intrusive way is to rely on [Vagrant](http://www.vagrantup.com/).
The `Vagrantfile` at the root of the repository pilot the provisioning various vagrant boxes available on [Vagrant cloud](https://atlas.hashicorp.com/boxes/search?utf8=%E2%9C%93&sort=&provider=virtualbox&q=svarrette) you can use to test this module.

See [`docs/vagrant.md`](vagrant.md) for more details. 

## Online Documentation

[Read the Docs](https://readthedocs.org/) aka RTFD hosts documentation for the open source community and the [ULHPC/rclocal](https://github.com/ULHPC/puppet-rclocal) puppet module has its documentation (see the `docs/` directly) hosted on [readthedocs](http://ulhpc-puppet-rclocal.rtfd.org).

See [`docs/rtfd.md`](rtfd.md) for more details.

## Licence

This project and the sources proposed within this repository are released under the terms of the [GPL-3.0](LICENCE) licence.
