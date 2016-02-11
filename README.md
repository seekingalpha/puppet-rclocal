<<<<<<< HEAD
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

* __Puppet definitions__: 

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

* `$ensure`: default to 'present', can be 'absent'

Use it as follows:

     include ' rclocal'

See also [`tests/init.pp`](tests/init.pp)



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


[![Licence](https://www.gnu.org/graphics/gplv3-88x31.png)](LICENSE)
=======
-*- mode: markdown; mode: auto-fill; fill-column: 80 -*-

     Time-stamp: <Lun 2014-08-25 23:31 svarrette>

-------------------------------------------

# ULHPC-generic 

Generic puppet module to install all default missing packages on a fresh new system

* Author(s): S. Varrette, H. Cartiaux
* Copyright: `Copyright (c) 2014 S. Varrette, H. Cartiaux`  
* [GPL-3.0 Licence](LICENSE)
* [Puppet Forge](https://forge.puppetlabs.com/)
* [Online Project Page](https://github.com/ULHPC/puppet-generic)  -- [Sources](https://github.com/ULHPC/puppet-generic) -- [Issues](https://github.com/ULHPC/puppet-generic/issues)

## Synopsis

This is the generic puppet module that is applied to *ALL* our nodes. 
In particular, this module is invoked to install all default missing packages on a fresh new system.

The various operations of this repository are piloted from a `Rakefile` which
assumes that you have [RVM](https://rvm.io/) installed on your system.

## Puppet Module Layout

       ulhpc-generic/       # Main directory for the 'ulhpc-generic' module
           `-- metadata.json     # Module configuration - cf [here](https://docs.puppetlabs.com/puppet/latest/reference/modules_publishing.html#write-a-metadatajson-file)
           `-- README.md         # This file
           `-- files/            # Contains static files, which managed nodes can download
           `-- manifests/
                `-- init.pp      # Main manifests file
                `-- classes/     # Hold manifest for ulhpc-generic classes/
                     `-- ulhpc-generic.pp         # defines the ulhpc-generic class
                     `-- ulhpc-generic-params.pp  # ulhpc-generic module variables 
                `-- definitions/ # Hold manifest for ulhpc-generic definitions
                     `-- ulhpc-generic-mydef.pp   # defines the ulhpc-generic::mydef definition               
           `-- templates/        # Module ERB template files
           `-- tests/            # Contains examples showing how to declare the module’s classes and defined type
           `-- spec/             # Contains spec tests for any plugins in the lib directory
           `-- Rakefile          # Definition of the [rake](https://github.com/jimweirich/rake) tasks
           `-- .ruby-{version,gemset}   # [RVM](https://rvm.io/) configuration
           `-- Gemfile[.lock]    # [Bundler](http://bundler.io/) configuration
           `-- .git/             # Hold git configuration

## Documentation

Please refer to the header of each manifest files to understand the usage of
classes and definitions associated to the 'ulhpc-generic' module.
 
Alternatively, generate automatically the documentation via
[`puppet doc`](http://docs.puppetlabs.com/man/doc.html) as follows:  

       $> rake doc   # Not yet implemented
       
For other information, please refer to the `metadata.json` file in this directory 

## Librarian-Puppet / R10K

You can of configure ulhpc-generic in your `Puppetfile` to make it
available with [Librarian puppet](http://librarian-puppet.com/) or [r10k](https://github.com/adrienthebo/r10k)

## Issues / Feature request

You can submit bug / issues / feature request using the 
[ulhpc-generic Tracker](https://github.com/ULHPC/puppet-generic/issues). 

-------------------------

## Implementation details

If you want to contribute to the code, you shall be aware of the way this module
is organized implementation details.   

### Git Branching Model

The Git branching model for this repository follows the guidelines of
[gitflow](http://nvie.com/posts/a-successful-git-branching-model/).  
In particular, the central repository holds two main branches with an infinite
lifetime:  

* `production`: the branch holding
  tags of the successive releases of this tutorial 
* `devel`: the main branch
  where the sources are in a state with the latest delivered development changes 
  for the next release. This is the *default* branch you get when you clone the
  repository, and the one on which developments will take places.  

You should therefore install [git-flow](https://github.com/nvie/gitflow), and
probably also its associated
[bash completion](https://github.com/bobthecow/git-flow-completion).  

### Ruby, [RVM](https://rvm.io/) and [Bundler](http://bundler.io/)

The various operations that can be conducted from this repository are piloted
from a `Rakefile` and assumes you have a running Ruby installation.

The bootstrapping of your repository is based on [RVM](https://rvm.io/), **thus
ensure this tools are installed on your system** -- see
[installation notes](https://rvm.io/rvm/install).

The ruby stuff part of this repository corresponds to the following files:

* `.ruby-{version,gemset}`: [RVM](https://rvm.io/) configuration, use the name of the
  project as [gemset](https://rvm.io/gemsets) name
* `Gemfile[.lock]`: used by `[bundle](http://bundler.io/)`

You should now be able to access the list of available tasks by running:

	$> rake -T

You probably wants to activate the bash-completion for rake tasks.
I personnaly use the one provided [here](https://github.com/ai/rake-completion)

Also, some of the tasks are hidden. 
Run `rake -T -A` to list all of them. 

### Repository Setup

Then, to make your local copy of the repository ready to use the
[git-flow](https://github.com/nvie/gitflow) workflow and the local
[RVM](https://rvm.io/)  setup, you have to run the following commands once you
cloned it for the first time: 

      $> rake setup 

### RSpec tests

I try to define a set of unitary tests to validate the different function of my
library using [Rspec](http://rspec.info/) 

You can run these tests by issuing:

	$> rake rspec
	
By conventions, you will find all the currently implemented tests in the `spec/`
directory, in files having the `_spec.rb` suffix. This is expected from the
`rspec` task of the `Rakefile`.    

**Important** Kindly stick to this convention, and feature tests for all
  definitions/classes/modules you might want to add to `FalkorLib`. 

### Releasing mechanism

The operation consisting of releasing a new version of this repository is
automated by a set of tasks within the `Rakefile`. 

In this context, a version number have the following format:

      <major>.<minor>.<patch>

where:

* `< major >` corresponds to the major version number
* `< minor >` corresponds to the minor version number
* `< patch >` corresponds to the patching version number

Example: `1.2.0`

The current version number is stored in the file `metadata.json`. 
For more information on the version, run:

     $> rake version:info

If a new  version number such be bumped, you simply have to run:

      $> rake version:bump:{major,minor,patch}

This will start the release process for you using `git-flow`.
Then, to make the release effective, just run:

      $> rake version:release

This will finalize the release using `git-flow`, create the appropriate tag and
merge all things the way they should be. 

# Contributing

This project is released under the terms of the [gpl-3.0 Licence](LICENSE). 
So you are more than welcome to contribute to its development as follows: 

1. Fork it
2. Create your feature branch (`git:feature:start[<feature_name>]`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git flow feature publish <feature_name>`)
5. Create new Pull Request

## Resources

### Git 

You should become familiar (if not yet) with Git. Consider these resources: 

* [Git book](http://book.git-scm.com/index.html)
* [Github:help](http://help.github.com/mac-set-up-git/)
* [Git reference](http://gitref.org/)

>>>>>>> 8003e899b76cdcf8bcac3c7d2c40195e3f66f31d
