ffi-rfb
=======

Ruby FFI wrapper of libvncserver

## Installation

Add this line to your application's Gemfile:

    gem 'ffi-rfb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ffi-rfb

## Usage

First, become familiar with the libvncserver library: http://libvncserver.sourceforge.net/doc/html/libvncserver_doc.html

Next let's' write a simple server:

    require 'ffi'
    require 'ffi_rfb'
    require 'RMagick'
    
    image = Magick::Image.read('foo.png')[0]
    
    p = FFI::MemoryPointer.new(:int, 1)
    p.write_array_of_int([0])
    screen = FfiRfb.rfbGetScreen(p, nil, 1024, 768, 8, 3, 4)
    screen = FfiRfb::RfbScreenInfo.new(screen)
    screen[:desktopName] = FFI::MemoryPointer.from_string('Ruby VNC FTW!')
    frame_buffer = FFI::MemoryPointer.new(:char, 1024 * 768 * 4)
    frame_buffer.put_bytes(0, image.export_pixels_to_str(0, 0, 1024, 768, 'RGBA'))
    screen[:frameBuffer] = frame_buffer
    screen[:alwaysShared] = 1
    
    FfiRfb.rfbInitServerWithPthreadsAndZRLE(screen)
    while (FfiRfb.rfbIsActive(screen))
      usec = screen[:deferUpdateTime] * 1000
      FfiRfb.rfbProcessEvents(screen, usec)
    end

Finally, build on the above and create something awesome!

## Known issues:

1. Functionality provided by libvncserver that is not included with this wrapper:

    **rfbLogProc** - ffi doesn't support varargs in callbacks.  see https://github.com/ffi/ffi/issues/161

    **defaultNewClientHook** - I was having trouble getting ffi to match this method definition.  If someone can get it working, please submit a pull request.

2. Platform support - this wrapper was built and tested on 64bit linux.  it should work on any 64bit operating system, but I haven't tested it.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/ffi-rfb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
