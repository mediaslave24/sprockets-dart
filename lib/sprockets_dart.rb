require "tilt"

module Sprockets
  class DartTemplate < Tilt::Template
    self.default_mime_type = "application/javascript"

    module Dart
      module Dart2Js
        def self.command; "dart2js" end
        def self.exec(input_path, output_path)
          stdout = `#{command} --out=#{output_path} #{input_path}`
          return stdout, $?.success?
        end
      end

      class Dart2JsError < Exception; end

      def self.compile(path)
        dartfile = File.open(path)
        dartpath = dartfile.path
        jspath = "#{dartpath}.js"

        msg, success = Dart2Js.exec(dartpath, jspath)

        if !success
          raise Dart2JsError, msg
        end

        result = IO.read(jspath)
        result
      ensure
        dartfile.close
      end
    end

    def prepare
    end

    def evaluate(context, locals, &block)
      @output ||= Dart.compile(file)
    end
  end
end
