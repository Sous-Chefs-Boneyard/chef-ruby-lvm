# Change log

## [0.4.4](https://github.com/sous-chefs/chef-ruby-lvm/compare/v0.4.3...v0.4.4) (2026-06-04)


### Bug Fixes

* Add release please ([#17](https://github.com/sous-chefs/chef-ruby-lvm/issues/17)) ([e1d174f](https://github.com/sous-chefs/chef-ruby-lvm/commit/e1d174f3b61f9434d2806d31550f0d1a52483419))

## 0.4.3

- Update open4 requirement

## 0.4.2

- Fix undefined variable error in `LVM::External::Module`

## 0.4.1 (2022-04-25)

- Use new minor version of chef-ruby-lvm-attrib
- Chefstyle fixes
- Optimize requires with require_relative & use __dir__ not __FILE__

## 0.4.0 (2018-07-23)

- Added additional_arguments option that allows passing options to commands

## 0.3.0 (2017-06-21)

- Depend on di-ruby-lvm-attrib ~0.2 to bring in the last few years of releases

## 0.2.2 (2016-12-13)

- Fork di-ruby-lvm as chef-ruby-lvm in order to unblock the Chef lvm cookbook support for the latest Linux distros
- Convert the readme to markdown and reword portions
- Resolve all chefstyle warnings
- Added a Gemfile/Rakefile for chefstyle linting

## 0.2.1 (2015-12-04)

- Fix failures calling the calling physical_volumes list method

## 0.2.0 (2015-12-01)

- Minor code refactoring
- Improve runtime with multiple VGs
- Use just a gemspec instead of hoe
- Require a newer di-ruby-lvm-attrib gem

## 0.1.1 (2008-07-21)

- A complete rewrite! We won't bother attempting to wrap complex lvm operations, but instead provide LVM.raw() command. The wrapper now focuses purely on translating lvm lv/vg/pv data into the most useful ruby objects possible. The arguments passed to the underlying binaries have been broken out into a ruby-lvm-attributes package.

## 0.0.1 (2008-05-28)

- 1 major enhancement

  - Birthday!
  - Test release.
