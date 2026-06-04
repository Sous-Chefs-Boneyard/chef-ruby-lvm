#!/usr/bin/ruby

# Demonstration of the creation of an lvm snapshot, using sudo, and reading its
# attributes.

$: << __dir__ + "/../lib"

require "lvm"

vol = "sys.vg/tmp.lv"
snap = "demo_snap"

lvm = LVM::LVM.new(command: "/usr/bin/sudo /sbin/lvm")

if lvm.logical_volumes[snap]
  puts "#{snap} exists! Remove it"
  exit(1)
end

lvm.raw("lvcreate --snapshot --size 10M --name #{snap} #{vol}")
lv = lvm.logical_volumes[snap]

out = <<~MSG
  snapshot of #{vol}, #{snap}, created
  - uuid: #{lv.uuid}
  - major,minor: #{lv.kernel_major},#{lv.kernel_minor}
MSG
puts out
