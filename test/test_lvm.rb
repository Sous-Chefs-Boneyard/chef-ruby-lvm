require "minitest/autorun"
require_relative "../lib/lvm"

class TestLVMVersionParsing < Minitest::Test
  # Classic format used by lvm2 prior to RHEL 10.
  def test_parses_classic_rhel_format
    assert_equal "2.03.28(2)",
      LVM::LVM.parse_version("2.03.28(2)-RHEL10 (2024-11-04)")
  end

  # RHEL 10 format moved the dist tag inside the build parentheses.
  # See: https://github.com/sous-chefs/chef-ruby-lvm-attrib/issues/90
  def test_parses_rhel10_inline_dist_format
    assert_equal "2.03.32(2)",
      LVM::LVM.parse_version("2.03.32(2-RHEL10) (2025-05-05)")
  end

  def test_parses_older_rhel7_style
    assert_equal "2.02.180(2)",
      LVM::LVM.parse_version("2.02.180(2)-RHEL7 (2018-07-20)")
  end

  def test_parses_plain_version_without_build_suffix
    assert_equal "2.03.40",
      LVM::LVM.parse_version("2.03.40")
  end

  def test_returns_input_unchanged_when_unparseable
    assert_equal "garbage",
      LVM::LVM.parse_version("garbage")
  end

  def test_handles_nil_input
    assert_equal "", LVM::LVM.parse_version(nil)
  end
end
