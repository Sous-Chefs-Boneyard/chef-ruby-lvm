require_relative "lvm/external"
require_relative "lvm/userland"
require_relative "lvm/logical_volumes"
require_relative "lvm/volume_groups"
require_relative "lvm/physical_volumes"
require_relative "lvm/version"

module LVM
  class LVM
    attr_reader :command
    attr_reader :logical_volumes
    attr_reader :volume_groups
    attr_reader :physical_volumes
    attr_reader :additional_arguments

    VALID_OPTIONS = %i{
      command
      version
      debug
      additional_arguments
    }.freeze

    DEFAULT_COMMAND = "/sbin/lvm".freeze

    def initialize(options = {})
      # handy, thanks net-ssh!
      invalid_options = options.keys - VALID_OPTIONS
      if invalid_options.any?
        raise ArgumentError, "invalid option(s): #{invalid_options.join(", ")}"
      end

      @command = options[:command] || DEFAULT_COMMAND

      # default to loading attributes for the current version
      options[:version] ||= version
      options[:debug] ||= false

      @logical_volumes = LogicalVolumes.new(options)
      @volume_groups = VolumeGroups.new(options)
      @physical_volumes = PhysicalVolumes.new(options)

      if block_given?
        yield self
      else
        self
      end
    end

    def raw(args)
      output = []
      External.cmd("#{@command} #{args}") do |line|
        output << line
      end
      if block_given?
        output.each { |l| yield l }
      else
        output.join
      end
    end

    def version
      self.class.parse_version(userland.lvm_version)
    end

    # Extract the canonical X.Y.Z or X.Y.Z(N) version key used by
    # chef-ruby-lvm-attrib attribute directories.
    def self.parse_version(raw)
      match = raw.to_s.match(/(\d+\.\d+\.\d+)(?:\((\d+))?/)
      return raw.to_s if match.nil?

      match[2] ? "#{match[1]}(#{match[2]})" : match[1]
    end

    # helper methods
    def userland
      userland = UserLand.new
      raw("version") do |line|
        case line
        when /^\s+LVM version:\s+([0-9].*)$/
          userland.lvm_version = $1
        when /^\s+Library version:\s+([0-9].*)$/
          userland.library_version = $1
        when /^\s+Driver version:\s+([0-9].*)$/
          userland.driver_version = $1
        end
      end

      userland
    end
  end
end
