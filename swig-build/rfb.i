%module rfb

%include "stdint.i"
%include "generated_types.i"

/*would like to do this, but %apply only gets applied when swig goes from xml to target language*/
/*%apply char* { char *[] };*/
/*%apply void* { char* };*/
/*%apply struct z_stream_s { z_stream };*/

#define LIBVNCSERVER_HAVE_LIBPTHREAD
#define LIBVNCSERVER_HAVE_LIBZ
#define LIBVNCSERVER_HAVE_LIBPNG
#define LIBVNCSERVER_HAVE_LIBJPEG

%{
  #include "rfb/rfbproto.h"
%}
%include "rfb/rfbproto.h"

%{
  #include "rfb/rfb.h"
%}
%include "rfb/rfb.h"
