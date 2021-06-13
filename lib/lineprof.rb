require 'rblineprof'
require 'rack/lineprof/source_extension'

class Lineprof
  IGNORE_PATTERN  = /lib\/lineprof\.rb$/
  DEFAULT_PATTERN = /./

  class << self
    def profile(filename = caller_filename(caller), &block)
      value  = nil
      result = lineprof(filename) { value = block.call }

      puts Term::ANSIColor.blue("\n[Lineprof] #{'=' * 70}")
      puts "\n#{format(result)}\n"
      value
    end

    private

    def caller_filename(caller_lines)
      filename = caller_lines.first.split(':').first

      if filename
        # Don't add \A because filename may not be an absolute path
        /#{Regexp.escape(filename)}\z/
      else
        DEFAULT_PATTERN
      end
    end

    def format(result)
      sources = result.map do |filename, samples|
        next if filename =~ IGNORE_PATTERN
        Rack::Lineprof::Source.new(filename, samples)
      end
      sources.compact.map(&:format).join("\n")
    end
  end
end
