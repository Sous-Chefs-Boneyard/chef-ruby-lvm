# chef-ruby-lvm

DEPRECATED! This gem is no longer needed for the lvm cookbook v7.x+. Please migrate to using the latest version of the cookbook.

[![Gem Version](https://badge.fury.io/rb/chef-ruby-lvm.svg)](https://badge.fury.io/rb/chef-ruby-lvm)

This is a fork of the chef-ruby-lvm gem found at <https://github.com/gregsymons/di-ruby-lvm>. The primary difference from upstream is that it depends on chef-ruby-lvm-attrib instead of di-ruby-lvm-attrib. It was in turn forked from ruby-lvm. This adds support for lvm version 2.02.66(2) and later.

This is a wrapper for the LVM2 administration utility, lvm. Its primary function is to convert physical volumes, logical volumes and volume groups into easy-to-use ruby objects. It also provides a simple wrapper for typical create/delete/etc operations.

Due to a lack of LVM2 api this is a best effort attempt at ruby integration but subject to complete replacement in the future.

## Features and Issues

- Exposes all possible data from the lvs/vgs/pvs commands. Data is grouped sensibly (I hope).
- Doesn't nicely wrap creation/deletion/etc operations, they must be created by hand and passed as raw commands.

## Usage

```ruby
require 'lvm'

LVM::LVM.new(command: '/usr/bin/sudo /sbin/lvm') do |lvm|
  puts "lvm version: #{lvm.version}\n"

  lvm.volume_groups.each do |vg|
    puts "vg: #{vg.name}"
  end
end
```

## Requirements

- chef-ruby-lvm-attrib
- popen4

## Installation

```bash
sudo gem install chef-ruby-lvm
```

## License

(The MIT License)

Copyright (c) 2008 Matthew Kent, Bravenet Web Services Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
