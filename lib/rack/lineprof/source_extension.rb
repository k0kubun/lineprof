require 'rack/lineprof'

module Rack
  class Lineprof
    module SourceExtension
      def source_lines
        return [] if file_name == '(eval)'
        return [] if file_name.end_with?('module_eval')
        super
      end
    end

    Source.send(:prepend, SourceExtension)
  end
end
