require "minitest/autorun"
require_relative "../lib/lvm"

class TestLVMVersionParsing < Minitest::Test
  def test_parses_classic_rhel_format
    assert_equal "2.03.28(2)",
      LVM::LVM.parse_version("2.03.28(2)-RHEL10 (2024-11-04)")
  end

  def test_parses_rhel10_inline_dist_format
    assert_equal "2.03.32(2)",
      LVM::LVM.parse_version("2.03.32(2-RHEL10) (2025-05-05)")
  end

  def test_parses_release_suffix_outside_parentheses
    assert_equal "2.03.32(2)",
      LVM::LVM.parse_version("2.03.32(2)-3.el10")
  end

  def test_parses_older_rhel7_style
    assert_equal "2.02.180(2)",
      LVM::LVM.parse_version("2.02.180(2)-RHEL7 (2018-07-20)")
  end

  def test_parses_plain_version_without_build_suffix
    assert_equal "2.03.40", LVM::LVM.parse_version("2.03.40")
  end

  def test_returns_input_unchanged_when_unparseable
    assert_equal "garbage", LVM::LVM.parse_version("garbage")
  end

  def test_handles_nil_input
    assert_equal "", LVM::LVM.parse_version(nil)
  end
end
