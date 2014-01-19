require 'ffi-swig-generator'

module FFI
  module Generator
    TYPES['a().p.char'] = ':pointer' #deal with (char *argv[]) types
    TYPES['in_addr_t'] = ':in_addr_t'

    class Constant < Node
      def initialize(params = { })
        super
        @name, @value, @rawval = get_attr('sym_name'), get_attr('value'), get_attr('rawval')
      end

      def to_s
        @indent_str + "#{@name} = #{sanitized_val}"
      end

      private
      def sanitized_val
        return @rawval.gsub('\\\\', '\\') unless @rawval.nil?

        if @value.match(/\d+U$/) or @value.match(/\d+L$/)
          @value.chop
        elsif @value.match(/\d+UL$/)
          @value.chop.chop
        else
          @value
        end
      end
    end

    class Parser
      def fixme(code, message)
        comment('FIXME: ' + message) << code #I think that the nested structure order is fine for rfb.h
      end
    end
  end
end

desc 'Build the FFI file'
task :build do
  `cd ./swig-build && gcc -o ./generated_types ./generated_types.c && ./generated_types`
  `swig -I/usr/local/include -I/usr/include -I/usr/include/x86_64-linux-gnu $(pkg-config --cflags libvncserver) -xml -o ./swig-build/rfb.xml ./swig-build/rfb.i`
  parser = FFI::Generator::Parser.new

  #add ignored items
  parser.ignore('rfbLogProc', 'defaultNewClientHook')

  #write it
  File.open('./lib/ffi_rfb.rb', 'w') do |file|

    head = <<-EOF
require 'ffi'
require 'ffi_rfb/version'

module FfiRfb
  extend FFI::Library
  ffi_lib 'libvncserver'
    EOF
    file << head

    file << parser.generate(Nokogiri::XML(File.open('./swig-build/rfb.xml')))

    tail = <<-EOF
end
    EOF
    file << tail

  end
end
