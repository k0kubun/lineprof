require 'rblineprof'
require 'rack/lineprof'

class Lineprof
  IGNORE_PATTERN = /lib\/lineprof\.rb$/

  class << self
    def profile(&block)
      value = nil
      result = lineprof(/./) { value = block.call }

      puts Term::ANSIColor.blue("\n[Lineprof] #{'=' * 70}")
      puts "\n#{format(result)}\n"
      value
    end

    private

    def format(result)
      sources = result.map do |filename, samples|
        next if filename =~ IGNORE_PATTERN
        Rack::Lineprof::Source.new(filename, samples)
      end
      sources.compact.map(&:format).join("\n")
    end
  end
end
