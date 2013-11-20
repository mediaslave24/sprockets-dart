module Sprockets
  module DartTemplate
    module Dart
      module Dart2Js
        def self.command; "dart2js" end
        def self.exec(input_path, output_path)
          `#{command} --out=#{output_path} #{input_path}`
        end
      end

      def self.compile(content)
        dartfile = Tempfile.new("dart")
        dartfile.write(content)
        dartfile.close
        dartpath = dartfile.path
        jspath = "#{dartpath}.js"

        Dart2Js.exec(dartpath, jspath)
        result = IO.read(jspath)
        result
      end
    end

    def prepare
    end

    def evaluate(context, locals, &block)
      @output ||= Dart.compile(data)
    end
  end
end
