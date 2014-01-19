require 'ffi'
require 'ffi_rfb/version'

module FfiRfb
  extend FFI::Library
  ffi_lib 'libvncserver'

#include <stdint.h>  // Use the C99 official header
  class SockaddrIn < FFI::Struct
    layout(
           :inner_sockaddr_in, [:char, 16]
    )
  end
  class Timeval < FFI::Struct
    layout(
           :inner_timeval, [:char, 16]
    )
  end
  class ZStreamS < FFI::Struct
    layout(
           :inner_z_stream_s, [:char, 112]
    )
  end

  #include "rfb/rfbproto.h"
  FALSE = 0
  TRUE = -1
  MAX_ENCODINGS = 21
  class RfbRectangle < FFI::Struct
    layout(
           :x, :ushort,
           :y, :ushort,
           :w, :ushort,
           :h, :ushort
    )
  end
  sz_rfbRectangle = 8
  class RfbPixelFormat < FFI::Struct
    layout(
           :bitsPerPixel, :uchar,
           :depth, :uchar,
           :bigEndian, :uchar,
           :trueColour, :uchar,
           :redMax, :ushort,
           :greenMax, :ushort,
           :blueMax, :ushort,
           :redShift, :uchar,
           :greenShift, :uchar,
           :blueShift, :uchar,
           :pad1, :uchar,
           :pad2, :ushort
    )
  end
  sz_rfbPixelFormat = 16
  rfbPFFullColors = 0
  rfbPF256Colors = 1
  rfbPF64Colors = 2
  rfbPF8Colors = 3
  rfbPF8GreyColors = 4
  rfbPF4GreyColors = 5
  rfbPF2GreyColors = 6
  rfbProtocolVersionFormat = "RFB %03d.%03d\n"
  rfbProtocolMajorVersion = 3
  rfbProtocolMinorVersion = 8
  sz_rfbProtocolVersionMsg = 12
  rfbSecTypeInvalid = 0
  rfbSecTypeNone = 1
  rfbSecTypeVncAuth = 2
  rfbConnFailed = 0
  rfbNoAuth = 1
  rfbVncAuth = 2
  rfbRA2 = 5
  rfbRA2ne = 6
  rfbSSPI = 7
  rfbSSPIne = 8
  rfbTight = 16
  rfbUltra = 17
  rfbTLS = 18
  rfbVeNCrypt = 19
  rfbARD = 30
  rfbMSLogon = 0xfffffffa
  rfbVeNCryptPlain = 256
  rfbVeNCryptTLSNone = 257
  rfbVeNCryptTLSVNC = 258
  rfbVeNCryptTLSPlain = 259
  rfbVeNCryptX509None = 260
  rfbVeNCryptX509VNC = 261
  rfbVeNCryptX509Plain = 262
  rfbVeNCryptX509SASL = 263
  rfbVeNCryptTLSSASL = 264
  rfbVncAuthOK = 0
  rfbVncAuthFailed = 1
  rfbVncAuthTooMany = 2
  class RfbClientInitMsg < FFI::Struct
    layout(
           :shared, :uchar
    )
  end
  sz_rfbClientInitMsg = 1
  class RfbServerInitMsg < FFI::Struct
    layout(
           :framebufferWidth, :ushort,
           :framebufferHeight, :ushort,
           :format, RfbPixelFormat,
           :nameLength, :uint
    )
  end
  sz_rfbServerInitMsg = (8+16)
  rfbFramebufferUpdate = 0
  rfbSetColourMapEntries = 1
  rfbBell = 2
  rfbServerCutText = 3
  rfbResizeFrameBuffer = 4
  rfbPalmVNCReSizeFrameBuffer = 0xF
  rfbSetPixelFormat = 0
  rfbFixColourMapEntries = 1
  rfbSetEncodings = 2
  rfbFramebufferUpdateRequest = 3
  rfbKeyEvent = 4
  rfbPointerEvent = 5
  rfbClientCutText = 6
  rfbFileTransfer = 7
  rfbSetScale = 8
  rfbSetServerInput = 9
  rfbSetSW = 10
  rfbTextChat = 11
  rfbPalmVNCSetScaleFactor = 0xF
  rfbXvp = 250
  rfbEncodingRaw = 0
  rfbEncodingCopyRect = 1
  rfbEncodingRRE = 2
  rfbEncodingCoRRE = 4
  rfbEncodingHextile = 5
  rfbEncodingZlib = 6
  rfbEncodingTight = 7
  rfbEncodingTightPng = 0xFFFFFEFC
  rfbEncodingZlibHex = 8
  rfbEncodingUltra = 9
  rfbEncodingZRLE = 16
  rfbEncodingZYWRLE = 17
  rfbEncodingCache = 0xFFFF0000
  rfbEncodingCacheEnable = 0xFFFF0001
  rfbEncodingXOR_Zlib = 0xFFFF0002
  rfbEncodingXORMonoColor_Zlib = 0xFFFF0003
  rfbEncodingXORMultiColor_Zlib = 0xFFFF0004
  rfbEncodingSolidColor = 0xFFFF0005
  rfbEncodingXOREnable = 0xFFFF0006
  rfbEncodingCacheZip = 0xFFFF0007
  rfbEncodingSolMonoZip = 0xFFFF0008
  rfbEncodingUltraZip = 0xFFFF0009
  rfbEncodingXvp = 0xFFFFFECB
  rfbEncodingFineQualityLevel0 = 0xFFFFFE00
  rfbEncodingFineQualityLevel100 = 0xFFFFFE64
  rfbEncodingSubsamp1X = 0xFFFFFD00
  rfbEncodingSubsamp4X = 0xFFFFFD01
  rfbEncodingSubsamp2X = 0xFFFFFD02
  rfbEncodingSubsampGray = 0xFFFFFD03
  rfbEncodingSubsamp8X = 0xFFFFFD04
  rfbEncodingSubsamp16X = 0xFFFFFD05
  rfbEncodingCompressLevel0 = 0xFFFFFF00
  rfbEncodingCompressLevel1 = 0xFFFFFF01
  rfbEncodingCompressLevel2 = 0xFFFFFF02
  rfbEncodingCompressLevel3 = 0xFFFFFF03
  rfbEncodingCompressLevel4 = 0xFFFFFF04
  rfbEncodingCompressLevel5 = 0xFFFFFF05
  rfbEncodingCompressLevel6 = 0xFFFFFF06
  rfbEncodingCompressLevel7 = 0xFFFFFF07
  rfbEncodingCompressLevel8 = 0xFFFFFF08
  rfbEncodingCompressLevel9 = 0xFFFFFF09
  rfbEncodingXCursor = 0xFFFFFF10
  rfbEncodingRichCursor = 0xFFFFFF11
  rfbEncodingPointerPos = 0xFFFFFF18
  rfbEncodingLastRect = 0xFFFFFF20
  rfbEncodingNewFBSize = 0xFFFFFF21
  rfbEncodingQualityLevel0 = 0xFFFFFFE0
  rfbEncodingQualityLevel1 = 0xFFFFFFE1
  rfbEncodingQualityLevel2 = 0xFFFFFFE2
  rfbEncodingQualityLevel3 = 0xFFFFFFE3
  rfbEncodingQualityLevel4 = 0xFFFFFFE4
  rfbEncodingQualityLevel5 = 0xFFFFFFE5
  rfbEncodingQualityLevel6 = 0xFFFFFFE6
  rfbEncodingQualityLevel7 = 0xFFFFFFE7
  rfbEncodingQualityLevel8 = 0xFFFFFFE8
  rfbEncodingQualityLevel9 = 0xFFFFFFE9
  rfbEncodingKeyboardLedState = 0xFFFE0000
  rfbEncodingSupportedMessages = 0xFFFE0001
  rfbEncodingSupportedEncodings = 0xFFFE0002
  rfbEncodingServerIdentity = 0xFFFE0003
  class RfbFramebufferUpdateMsg < FFI::Struct
    layout(
           :type, :uchar,
           :pad, :uchar,
           :nRects, :ushort
    )
  end
  sz_rfbFramebufferUpdateMsg = 4
  class RfbFramebufferUpdateRectHeader < FFI::Struct
    layout(
           :r, RfbRectangle,
           :encoding, :uint
    )
  end
  sz_rfbFramebufferUpdateRectHeader = (8+4)
  class RfbSupportedMessages < FFI::Struct
    layout(
           :client2server, [:uchar, 32],
           :server2client, [:uchar, 32]
    )
  end
  sz_rfbSupportedMessages = 64
  rfbKeyboardMaskShift = 1
  rfbKeyboardMaskCapsLock = 2
  rfbKeyboardMaskControl = 4
  rfbKeyboardMaskAlt = 8
  rfbKeyboardMaskMeta = 16
  rfbKeyboardMaskSuper = 32
  rfbKeyboardMaskHyper = 64
  rfbKeyboardMaskNumLock = 128
  rfbKeyboardMaskScrollLock = 256
  rfbKeyboardMaskAltGraph = 512
  class RfbCopyRect < FFI::Struct
    layout(
           :srcX, :ushort,
           :srcY, :ushort
    )
  end
  sz_rfbCopyRect = 4
  class RfbRREHeader < FFI::Struct
    layout(
           :nSubrects, :uint
    )
  end
  sz_rfbRREHeader = 4
  class RfbCoRRERectangle < FFI::Struct
    layout(
           :x, :uchar,
           :y, :uchar,
           :w, :uchar,
           :h, :uchar
    )
  end
  sz_rfbCoRRERectangle = 4
  rfbHextileRaw = (1 << 0)
  rfbHextileBackgroundSpecified = (1 << 1)
  rfbHextileForegroundSpecified = (1 << 2)
  rfbHextileAnySubrects = (1 << 3)
  rfbHextileSubrectsColoured = (1 << 4)
  class RfbZlibHeader < FFI::Struct
    layout(
           :nBytes, :uint
    )
  end
  sz_rfbZlibHeader = 4
  rfbTightExplicitFilter = 0x04
  rfbTightFill = 0x08
  rfbTightJpeg = 0x09
  rfbTightNoZlib = 0x0A
  rfbTightPng = 0x0A
  rfbTightMaxSubencoding = 0x0A
  rfbTightFilterCopy = 0x00
  rfbTightFilterPalette = 0x01
  rfbTightFilterGradient = 0x02
  class RfbXCursorColors < FFI::Struct
    layout(
           :foreRed, :uchar,
           :foreGreen, :uchar,
           :foreBlue, :uchar,
           :backRed, :uchar,
           :backGreen, :uchar,
           :backBlue, :uchar
    )
  end
  sz_rfbXCursorColors = 6
  class RfbZRLEHeader < FFI::Struct
    layout(
           :length, :uint
    )
  end
  sz_rfbZRLEHeader = 4
  rfbZRLETileWidth = 64
  rfbZRLETileHeight = 64
  rfbHextileZlibRaw = (1 << 5)
  rfbHextileZlibHex = (1 << 6)
  rfbHextileZlibMono = (1 << 7)
  class RfbSetColourMapEntriesMsg < FFI::Struct
    layout(
           :type, :uchar,
           :pad, :uchar,
           :firstColour, :ushort,
           :nColours, :ushort
    )
  end
  sz_rfbSetColourMapEntriesMsg = 6
  class RfbBellMsg < FFI::Struct
    layout(
           :type, :uchar
    )
  end
  sz_rfbBellMsg = 1
  class RfbServerCutTextMsg < FFI::Struct
    layout(
           :type, :uchar,
           :pad1, :uchar,
           :pad2, :ushort,
           :length, :uint
    )
  end
  sz_rfbServerCutTextMsg = 8
  class RfbFileTransferMsg < FFI::Struct
    layout(
           :type, :uchar,
           :contentType, :uchar,
           :contentParam, :uchar,
           :pad, :uchar,
           :size, :uint,
           :length, :uint
    )
  end
  sz_rfbFileTransferMsg = 12
  rfbFileTransferVersion = 2
  rfbDirContentRequest = 1
  rfbDirPacket = 2
  rfbFileTransferRequest = 3
  rfbFileHeader = 4
  rfbFilePacket = 5
  rfbEndOfFile = 6
  rfbAbortFileTransfer = 7
  rfbFileTransferOffer = 8
  rfbFileAcceptHeader = 9
  rfbCommand = 10
  rfbCommandReturn = 11
  rfbFileChecksums = 12
  rfbFileTransferAccess = 14
  rfbRDirContent = 1
  rfbRDrivesList = 2
  rfbRDirRecursiveList = 3
  rfbRDirRecursiveSize = 4
  rfbADirectory = 1
  rfbAFile = 2
  rfbADrivesList = 3
  rfbADirCreate = 4
  rfbADirDelete = 5
  rfbAFileCreate = 6
  rfbAFileDelete = 7
  rfbAFileRename = 8
  rfbADirRename = 9
  rfbADirRecursiveListItem = 10
  rfbADirRecursiveSize = 11
  rfbCDirCreate = 1
  rfbCDirDelete = 2
  rfbCFileCreate = 3
  rfbCFileDelete = 4
  rfbCFileRename = 5
  rfbCDirRename = 6
  rfbRErrorUnknownCmd = 1
  rfbRErrorCmd = 0xFFFFFFFF
  sz_rfbBlockSize = 8192
  rfbZipDirectoryPrefix = "!UVNCDIR-"
  sz_rfbZipDirectoryPrefix = 9
  rfbDirPrefix = "[ "
  rfbDirSuffix = " ]"
  class RfbTextChatMsg < FFI::Struct
    layout(
           :type, :uchar,
           :pad1, :uchar,
           :pad2, :ushort,
           :length, :uint
    )
  end
  sz_rfbTextChatMsg = 8
  rfbTextMaxSize = 4096
  rfbTextChatOpen = 0xFFFFFFFF
  rfbTextChatClose = 0xFFFFFFFE
  rfbTextChatFinished = 0xFFFFFFFD
  class RfbXvpMsg < FFI::Struct
    layout(
           :type, :uchar,
           :pad, :uchar,
           :version, :uchar,
           :code, :uchar
    )
  end
  sz_rfbXvpMsg = (4)
  rfbXvp_Fail = 0
  rfbXvp_Init = 1
  rfbXvp_Shutdown = 2
  rfbXvp_Reboot = 3
  rfbXvp_Reset = 4
  class RfbResizeFrameBufferMsg < FFI::Struct
    layout(
           :type, :uchar,
           :pad1, :uchar,
           :framebufferWidth, :ushort,
           :framebufferHeigth, :ushort
    )
  end
  sz_rfbResizeFrameBufferMsg = 6
  class RfbPalmVNCReSizeFrameBufferMsg < FFI::Struct
    layout(
           :type, :uchar,
           :pad1, :uchar,
           :desktop_w, :ushort,
           :desktop_h, :ushort,
           :buffer_w, :ushort,
           :buffer_h, :ushort,
           :pad2, :ushort
    )
  end
  sz_rfbPalmVNCReSizeFrameBufferMsg = (12)
  class RfbServerToClientMsg < FFI::Union
    layout(
           :type, :uchar,
           :fu, RfbFramebufferUpdateMsg,
           :scme, RfbSetColourMapEntriesMsg,
           :b, RfbBellMsg,
           :sct, RfbServerCutTextMsg,
           :rsfb, RfbResizeFrameBufferMsg,
           :prsfb, RfbPalmVNCReSizeFrameBufferMsg,
           :ft, RfbFileTransferMsg,
           :tc, RfbTextChatMsg,
           :xvp, RfbXvpMsg
    )
  end
  class RfbCacheRect < FFI::Struct
    layout(
           :special, :ushort
    )
  end
  sz_rfbCacheRect = 2
  class RfbSetPixelFormatMsg < FFI::Struct
    layout(
           :type, :uchar,
           :pad1, :uchar,
           :pad2, :ushort,
           :format, RfbPixelFormat
    )
  end
  sz_rfbSetPixelFormatMsg = (16+4)
  class RfbFixColourMapEntriesMsg < FFI::Struct
    layout(
           :type, :uchar,
           :pad, :uchar,
           :firstColour, :ushort,
           :nColours, :ushort
    )
  end
  sz_rfbFixColourMapEntriesMsg = 6
  class RfbSetEncodingsMsg < FFI::Struct
    layout(
           :type, :uchar,
           :pad, :uchar,
           :nEncodings, :ushort
    )
  end
  sz_rfbSetEncodingsMsg = 4
  class RfbFramebufferUpdateRequestMsg < FFI::Struct
    layout(
           :type, :uchar,
           :incremental, :uchar,
           :x, :ushort,
           :y, :ushort,
           :w, :ushort,
           :h, :ushort
    )
  end
  sz_rfbFramebufferUpdateRequestMsg = 10
  class RfbKeyEventMsg < FFI::Struct
    layout(
           :type, :uchar,
           :down, :uchar,
           :pad, :ushort,
           :key, :uint
    )
  end
  sz_rfbKeyEventMsg = 8
  class RfbPointerEventMsg < FFI::Struct
    layout(
           :type, :uchar,
           :buttonMask, :uchar,
           :x, :ushort,
           :y, :ushort
    )
  end
  rfbButton1Mask = 1
  rfbButton2Mask = 2
  rfbButton3Mask = 4
  rfbButton4Mask = 8
  rfbButton5Mask = 16
  rfbWheelUpMask = 8
  rfbWheelDownMask = 16
  sz_rfbPointerEventMsg = 6
  class RfbClientCutTextMsg < FFI::Struct
    layout(
           :type, :uchar,
           :pad1, :uchar,
           :pad2, :ushort,
           :length, :uint
    )
  end
  sz_rfbClientCutTextMsg = 8
  class RfbSetScaleMsg < FFI::Struct
    layout(
           :type, :uchar,
           :scale, :uchar,
           :pad, :ushort
    )
  end
  sz_rfbSetScaleMsg = 4
  class RfbPalmVNCSetScaleFactorMsg < FFI::Struct
    layout(
           :type, :uchar,
           :scale, :uchar,
           :pad2, :ushort
    )
  end
  sz_rfbPalmVNCSetScaleFactorMsg = (4)
  class RfbSetServerInputMsg < FFI::Struct
    layout(
           :type, :uchar,
           :status, :uchar,
           :pad, :ushort
    )
  end
  sz_rfbSetServerInputMsg = 4
  class RfbSetSWMsg < FFI::Struct
    layout(
           :type, :uchar,
           :status, :uchar,
           :x, :ushort,
           :y, :ushort
    )
  end
  sz_rfbSetSWMsg = 6
  class RfbClientToServerMsg < FFI::Union
    layout(
           :type, :uchar,
           :spf, RfbSetPixelFormatMsg,
           :fcme, RfbFixColourMapEntriesMsg,
           :se, RfbSetEncodingsMsg,
           :fur, RfbFramebufferUpdateRequestMsg,
           :ke, RfbKeyEventMsg,
           :pe, RfbPointerEventMsg,
           :cct, RfbClientCutTextMsg,
           :ssc, RfbSetScaleMsg,
           :pssf, RfbPalmVNCSetScaleFactorMsg,
           :sim, RfbSetServerInputMsg,
           :ft, RfbFileTransferMsg,
           :sw, RfbSetSWMsg,
           :tc, RfbTextChatMsg,
           :xvp, RfbXvpMsg
    )
  end
  MAXPWLEN = 8
  CHALLENGESIZE = 16
  attach_function :rfbEncryptAndStorePasswd, [ :string, :string ], :int
  attach_function :rfbDecryptPasswdFromFile, [ :string ], :string
  attach_function :rfbRandomBytes, [ :pointer ], :void
  attach_function :rfbEncryptBytes, [ :pointer, :string ], :void

  #include "rfb/rfb.h"
  RFB_CLIENT_ACCEPT = 0
  RFB_CLIENT_ON_HOLD = 1
  RFB_CLIENT_REFUSE = 2

  RFB_SOCKET_INIT = 0
  RFB_SOCKET_READY = 1
  RFB_SOCKET_SHUTDOWN = 2

  callback(:rfbKbdAddEventProcPtr, [ :char, :uint, :pointer ], :void)
  callback(:rfbKbdReleaseAllKeysProcPtr, [ :pointer ], :void)
  callback(:rfbPtrAddEventProcPtr, [ :int, :int, :int, :pointer ], :void)
  callback(:rfbSetXCutTextProcPtr, [ :string, :int, :pointer ], :void)
  callback(:rfbGetCursorProcPtr, [ :pointer ], :pointer)
  callback(:rfbSetTranslateFunctionProcPtr, [ :pointer ], :char)
  callback(:rfbPasswordCheckProcPtr, [ :pointer, :string, :int ], :char)
  callback(:rfbNewClientHookPtr, [ :pointer ], :int)
  callback(:rfbDisplayHookPtr, [ :pointer ], :void)
  callback(:rfbDisplayFinishedHookPtr, [ :pointer, :int ], :void)
  callback(:rfbGetKeyboardLedStateHookPtr, [ :pointer ], :int)
  callback(:rfbXvpHookPtr, [ :pointer, :uchar, :uchar ], :char)
  callback(:rfbSetSingleWindowProcPtr, [ :pointer, :int, :int ], :void)
  callback(:rfbSetServerInputProcPtr, [ :pointer, :int ], :void)
  callback(:rfbFileTransferPermitted, [ :pointer ], :int)
  callback(:rfbSetTextChat, [ :pointer, :int, :string ], :void)
  class RfbColourMapData < FFI::Union
    layout(
           :bytes, :pointer,
           :shorts, :pointer
    )
  end
# FIXME: Nested structures are not correctly supported at the moment.
# Please check the order of the declarations in the structure below.
  class RfbColourMap < FFI::Struct
    layout(
           :count, :uint,
           :is16, :char,
           :data, RfbColourMapData
    )
  end
  class RfbSecurity < FFI::Struct
    layout(
           :type, :uchar,
           :handler, callback([ :pointer ], :void),
           :next, :pointer
    )
    def handler=(cb)
      @handler = cb
      self[:handler] = @handler
    end
    def handler
      @handler
    end

  end
  class RfbProtocolExtension < FFI::Struct
    layout(
           :newClient, callback([ :pointer, :pointer ], :char),
           :init, callback([ :pointer, :pointer ], :char),
           :pseudoEncodings, :pointer,
           :enablePseudoEncoding, callback([ :pointer, :pointer, :int ], :char),
           :handleMessage, callback([ :pointer, :pointer, :pointer ], :char),
           :close, callback([ :pointer, :pointer ], :void),
           :usage, callback([  ], :void),
           :processArgument, callback([ :int, :pointer ], :int),
           :next, :pointer
    )
    def newClient=(cb)
      @newClient = cb
      self[:newClient] = @newClient
    end
    def newClient
      @newClient
    end
    def init=(cb)
      @init = cb
      self[:init] = @init
    end
    def init
      @init
    end
    def enablePseudoEncoding=(cb)
      @enablePseudoEncoding = cb
      self[:enablePseudoEncoding] = @enablePseudoEncoding
    end
    def enablePseudoEncoding
      @enablePseudoEncoding
    end
    def handleMessage=(cb)
      @handleMessage = cb
      self[:handleMessage] = @handleMessage
    end
    def handleMessage
      @handleMessage
    end
    def close=(cb)
      @close = cb
      self[:close] = @close
    end
    def close
      @close
    end
    def usage=(cb)
      @usage = cb
      self[:usage] = @usage
    end
    def usage
      @usage
    end
    def processArgument=(cb)
      @processArgument = cb
      self[:processArgument] = @processArgument
    end
    def processArgument
      @processArgument
    end

  end
  class RfbExtensionData < FFI::Struct
    layout(
           :extension, :pointer,
           :data, :pointer,
           :next, :pointer
    )
  end
  class RfbScreenInfo < FFI::Struct
    layout(
           :scaledScreenNext, :pointer,
           :scaledScreenRefCount, :int,
           :width, :int,
           :paddedWidthInBytes, :int,
           :height, :int,
           :depth, :int,
           :bitsPerPixel, :int,
           :sizeInBytes, :int,
           :blackPixel, :uint,
           :whitePixel, :uint,
           :screenData, :pointer,
           :serverFormat, RfbPixelFormat,
           :colourMap, RfbColourMap,
           :desktopName, :pointer,
           :thisHost, [:char, 255],
           :autoPort, :char,
           :port, :int,
           :listenSock, :int,
           :maxSock, :int,
           :maxFd, :int,
           :allFds, [:char, 128],
           :socketState, :int,
           :inetdSock, :int,
           :inetdInitDone, :char,
           :udpPort, :int,
           :udpSock, :int,
           :udpClient, :pointer,
           :udpSockConnected, :char,
           :udpRemoteAddr, SockaddrIn,
           :maxClientWait, :int,
           :httpInitDone, :char,
           :httpEnableProxyConnect, :char,
           :httpPort, :int,
           :httpDir, :pointer,
           :httpListenSock, :int,
           :httpSock, :int,
           :passwordCheck, :rfbPasswordCheckProcPtr,
           :authPasswdData, :pointer,
           :authPasswdFirstViewOnly, :int,
           :maxRectsPerUpdate, :int,
           :deferUpdateTime, :int,
           :alwaysShared, :char,
           :neverShared, :char,
           :dontDisconnect, :char,
           :clientHead, :pointer,
           :pointerClient, :pointer,
           :cursorX, :int,
           :cursorY, :int,
           :underCursorBufferLen, :int,
           :underCursorBuffer, :pointer,
           :dontConvertRichCursorToXCursor, :char,
           :cursor, :pointer,
           :frameBuffer, :pointer,
           :kbdAddEvent, :rfbKbdAddEventProcPtr,
           :kbdReleaseAllKeys, :rfbKbdReleaseAllKeysProcPtr,
           :ptrAddEvent, :rfbPtrAddEventProcPtr,
           :setXCutText, :rfbSetXCutTextProcPtr,
           :getCursorPtr, :rfbGetCursorProcPtr,
           :setTranslateFunction, :rfbSetTranslateFunctionProcPtr,
           :setSingleWindow, :rfbSetSingleWindowProcPtr,
           :setServerInput, :rfbSetServerInputProcPtr,
           :getFileTransferPermission, :rfbFileTransferPermitted,
           :setTextChat, :rfbSetTextChat,
           :newClientHook, :rfbNewClientHookPtr,
           :displayHook, :rfbDisplayHookPtr,
           :getKeyboardLedStateHook, :rfbGetKeyboardLedStateHookPtr,
           :backgroundLoop, :char,
           :ignoreSIGPIPE, :char,
           :progressiveSliceHeight, :int,
           :listenInterface, :in_addr_t,
           :deferPtrUpdateTime, :int,
           :handleEventsEagerly, :char,
           :versionString, :pointer,
           :protocolMajorVersion, :int,
           :protocolMinorVersion, :int,
           :permitFileTransfer, :char,
           :displayFinishedHook, :rfbDisplayFinishedHookPtr,
           :xvpHook, :rfbXvpHookPtr,
           :ipv6port, :int,
           :listen6Interface, :pointer,
           :listen6Sock, :int,
           :http6Port, :int,
           :httpListen6Sock, :int
    )
    def desktopName=(str)
      @desktopName = FFI::MemoryPointer.from_string(str)
      self[:desktopName] = @desktopName
    end
    def desktopName
      @desktopName.get_string(0)
    end
    def httpDir=(str)
      @httpDir = FFI::MemoryPointer.from_string(str)
      self[:httpDir] = @httpDir
    end
    def httpDir
      @httpDir.get_string(0)
    end
    def passwordCheck=(cb)
      @passwordCheck = cb
      self[:passwordCheck] = @passwordCheck
    end
    def passwordCheck
      @passwordCheck
    end
    def underCursorBuffer=(str)
      @underCursorBuffer = FFI::MemoryPointer.from_string(str)
      self[:underCursorBuffer] = @underCursorBuffer
    end
    def underCursorBuffer
      @underCursorBuffer.get_string(0)
    end
    def frameBuffer=(str)
      @frameBuffer = FFI::MemoryPointer.from_string(str)
      self[:frameBuffer] = @frameBuffer
    end
    def frameBuffer
      @frameBuffer.get_string(0)
    end
    def kbdAddEvent=(cb)
      @kbdAddEvent = cb
      self[:kbdAddEvent] = @kbdAddEvent
    end
    def kbdAddEvent
      @kbdAddEvent
    end
    def kbdReleaseAllKeys=(cb)
      @kbdReleaseAllKeys = cb
      self[:kbdReleaseAllKeys] = @kbdReleaseAllKeys
    end
    def kbdReleaseAllKeys
      @kbdReleaseAllKeys
    end
    def ptrAddEvent=(cb)
      @ptrAddEvent = cb
      self[:ptrAddEvent] = @ptrAddEvent
    end
    def ptrAddEvent
      @ptrAddEvent
    end
    def setXCutText=(cb)
      @setXCutText = cb
      self[:setXCutText] = @setXCutText
    end
    def setXCutText
      @setXCutText
    end
    def getCursorPtr=(cb)
      @getCursorPtr = cb
      self[:getCursorPtr] = @getCursorPtr
    end
    def getCursorPtr
      @getCursorPtr
    end
    def setTranslateFunction=(cb)
      @setTranslateFunction = cb
      self[:setTranslateFunction] = @setTranslateFunction
    end
    def setTranslateFunction
      @setTranslateFunction
    end
    def setSingleWindow=(cb)
      @setSingleWindow = cb
      self[:setSingleWindow] = @setSingleWindow
    end
    def setSingleWindow
      @setSingleWindow
    end
    def setServerInput=(cb)
      @setServerInput = cb
      self[:setServerInput] = @setServerInput
    end
    def setServerInput
      @setServerInput
    end
    def getFileTransferPermission=(cb)
      @getFileTransferPermission = cb
      self[:getFileTransferPermission] = @getFileTransferPermission
    end
    def getFileTransferPermission
      @getFileTransferPermission
    end
    def setTextChat=(cb)
      @setTextChat = cb
      self[:setTextChat] = @setTextChat
    end
    def setTextChat
      @setTextChat
    end
    def newClientHook=(cb)
      @newClientHook = cb
      self[:newClientHook] = @newClientHook
    end
    def newClientHook
      @newClientHook
    end
    def displayHook=(cb)
      @displayHook = cb
      self[:displayHook] = @displayHook
    end
    def displayHook
      @displayHook
    end
    def getKeyboardLedStateHook=(cb)
      @getKeyboardLedStateHook = cb
      self[:getKeyboardLedStateHook] = @getKeyboardLedStateHook
    end
    def getKeyboardLedStateHook
      @getKeyboardLedStateHook
    end
    def versionString=(str)
      @versionString = FFI::MemoryPointer.from_string(str)
      self[:versionString] = @versionString
    end
    def versionString
      @versionString.get_string(0)
    end
    def displayFinishedHook=(cb)
      @displayFinishedHook = cb
      self[:displayFinishedHook] = @displayFinishedHook
    end
    def displayFinishedHook
      @displayFinishedHook
    end
    def xvpHook=(cb)
      @xvpHook = cb
      self[:xvpHook] = @xvpHook
    end
    def xvpHook
      @xvpHook
    end
    def listen6Interface=(str)
      @listen6Interface = FFI::MemoryPointer.from_string(str)
      self[:listen6Interface] = @listen6Interface
    end
    def listen6Interface
      @listen6Interface.get_string(0)
    end

  end
  callback(:rfbTranslateFnType, [ :string, :pointer, :pointer, :string, :string, :int, :int, :int ], :void)
  callback(:ClientGoneHookPtr, [ :pointer ], :void)
  class RfbFileTransferData < FFI::Struct
    layout(
           :fd, :int,
           :compressionEnabled, :int,
           :fileSize, :int,
           :numPackets, :int,
           :receiving, :int,
           :sending, :int
    )
  end
  class RfbStatList < FFI::Struct
    layout(
           :type, :uint,
           :sentCount, :uint,
           :bytesSent, :uint,
           :bytesSentIfRaw, :uint,
           :rcvdCount, :uint,
           :bytesRcvd, :uint,
           :bytesRcvdIfRaw, :uint,
           :Next, :pointer
    )
  end
  RFB_PROTOCOL_VERSION = 0
  RFB_SECURITY_TYPE = 1
  RFB_AUTHENTICATION = 2
  RFB_INITIALISATION = 3
  RFB_NORMAL = 4
  RFB_INITIALISATION_SHARED = 5

  UPDATE_BUF_SIZE = 30000
  class RfbClientRec < FFI::Struct
    layout(
           :screen, :pointer,
           :scaledScreen, :pointer,
           :PalmVNC, :char,
           :clientData, :pointer,
           :clientGoneHook, :ClientGoneHookPtr,
           :sock, :int,
           :host, :pointer,
           :protocolMajorVersion, :int,
           :protocolMinorVersion, :int,
           :client_thread, [:char, 8],
           :state, :int,
           :reverseConnection, :char,
           :onHold, :char,
           :readyForSetColourMapEntries, :char,
           :useCopyRect, :char,
           :preferredEncoding, :int,
           :correMaxWidth, :int,
           :correMaxHeight, :int,
           :viewOnly, :char,
           :authChallenge, [:uchar, 16],
           :copyRegion, :pointer,
           :copyDX, :int,
           :copyDY, :int,
           :modifiedRegion, :pointer,
           :requestedRegion, :pointer,
           :startDeferring, Timeval,
           :startPtrDeferring, Timeval,
           :lastPtrX, :int,
           :lastPtrY, :int,
           :lastPtrButtons, :int,
           :translateFn, :rfbTranslateFnType,
           :translateLookupTable, :pointer,
           :format, RfbPixelFormat,
           :updateBuf, [:char, 30000],
           :ublen, :int,
           :statEncList, :pointer,
           :statMsgList, :pointer,
           :rawBytesEquivalent, :int,
           :bytesSent, :int,
           :compStream, ZStreamS,
           :compStreamInited, :char,
           :zlibCompressLevel, :uint,
           :tightQualityLevel, :int,
           :zsStruct, [ZStreamS, 4],
           :zsActive, [:char, 4],
           :zsLevel, [:int, 4],
           :tightCompressLevel, :int,
           :compStreamInitedLZO, :char,
           :lzoWrkMem, :pointer,
           :fileTransfer, RfbFileTransferData,
           :lastKeyboardLedState, :int,
           :enableSupportedMessages, :char,
           :enableSupportedEncodings, :char,
           :enableServerIdentity, :char,
           :enableKeyboardLedState, :char,
           :enableLastRectEncoding, :char,
           :enableCursorShapeUpdates, :char,
           :enableCursorPosUpdates, :char,
           :useRichCursorEncoding, :char,
           :cursorWasChanged, :char,
           :cursorWasMoved, :char,
           :cursorX, :int,
           :cursorY, :int,
           :useNewFBSize, :char,
           :newFBSizePending, :char,
           :prev, :pointer,
           :next, :pointer,
           :refCount, :int,
           :zrleData, :pointer,
           :zywrleLevel, :int,
           :zywrleBuf, [:int, 64*64],
           :progressiveSliceY, :int,
           :extensions, :pointer,
           :zrleBeforeBuf, :pointer,
           :paletteHelper, :pointer,
           :beforeEncBuf, :pointer,
           :beforeEncBufSize, :int,
           :afterEncBuf, :pointer,
           :afterEncBufSize, :int,
           :afterEncBufLen, :int,
           :tightEncoding, :uint,
           :turboSubsampLevel, :int,
           :turboQualityLevel, :int
    )
    def clientGoneHook=(cb)
      @clientGoneHook = cb
      self[:clientGoneHook] = @clientGoneHook
    end
    def clientGoneHook
      @clientGoneHook
    end
    def host=(str)
      @host = FFI::MemoryPointer.from_string(str)
      self[:host] = @host
    end
    def host
      @host.get_string(0)
    end
    def translateFn=(cb)
      @translateFn = cb
      self[:translateFn] = @translateFn
    end
    def translateFn
      @translateFn
    end
    def translateLookupTable=(str)
      @translateLookupTable = FFI::MemoryPointer.from_string(str)
      self[:translateLookupTable] = @translateLookupTable
    end
    def translateLookupTable
      @translateLookupTable.get_string(0)
    end
    def lzoWrkMem=(str)
      @lzoWrkMem = FFI::MemoryPointer.from_string(str)
      self[:lzoWrkMem] = @lzoWrkMem
    end
    def lzoWrkMem
      @lzoWrkMem.get_string(0)
    end
    def zrleBeforeBuf=(str)
      @zrleBeforeBuf = FFI::MemoryPointer.from_string(str)
      self[:zrleBeforeBuf] = @zrleBeforeBuf
    end
    def zrleBeforeBuf
      @zrleBeforeBuf.get_string(0)
    end
    def beforeEncBuf=(str)
      @beforeEncBuf = FFI::MemoryPointer.from_string(str)
      self[:beforeEncBuf] = @beforeEncBuf
    end
    def beforeEncBuf
      @beforeEncBuf.get_string(0)
    end
    def afterEncBuf=(str)
      @afterEncBuf = FFI::MemoryPointer.from_string(str)
      self[:afterEncBuf] = @afterEncBuf
    end
    def afterEncBuf
      @afterEncBuf.get_string(0)
    end

  end
  attach_function :rfbInitSockets, [ :pointer ], :void
  attach_function :rfbShutdownSockets, [ :pointer ], :void
  attach_function :rfbDisconnectUDPSock, [ :pointer ], :void
  attach_function :rfbCloseClient, [ :pointer ], :void
  attach_function :rfbReadExact, [ :pointer, :string, :int ], :int
  attach_function :rfbReadExactTimeout, [ :pointer, :string, :int, :int ], :int
  attach_function :rfbPeekExactTimeout, [ :pointer, :string, :int, :int ], :int
  attach_function :rfbWriteExact, [ :pointer, :string, :int ], :int
  attach_function :rfbCheckFds, [ :pointer, :long ], :int
  attach_function :rfbConnect, [ :pointer, :string, :int ], :int
  attach_function :rfbConnectToTcpAddr, [ :string, :int ], :int
  attach_function :rfbListenOnTCPPort, [ :int, :in_addr_t ], :int
  attach_function :rfbListenOnTCP6Port, [ :int, :string ], :int
  attach_function :rfbListenOnUDPPort, [ :int, :in_addr_t ], :int
  attach_function :rfbStringToAddr, [ :string, :pointer ], :int
  attach_function :rfbSetNonBlocking, [ :int ], :char
  attach_function :rfbClientListInit, [ :pointer ], :void
  attach_function :rfbGetClientIterator, [ :pointer ], :pointer
  attach_function :rfbClientIteratorNext, [ :pointer ], :pointer
  attach_function :rfbReleaseClientIterator, [ :pointer ], :void
  attach_function :rfbIncrClientRef, [ :pointer ], :void
  attach_function :rfbDecrClientRef, [ :pointer ], :void
  attach_function :rfbNewClientConnection, [ :pointer, :int ], :void
  attach_function :rfbNewClient, [ :pointer, :int ], :pointer
  attach_function :rfbNewUDPClient, [ :pointer ], :pointer
  attach_function :rfbReverseConnection, [ :pointer, :string, :int ], :pointer
  attach_function :rfbClientConnectionGone, [ :pointer ], :void
  attach_function :rfbProcessClientMessage, [ :pointer ], :void
  attach_function :rfbClientConnFailed, [ :pointer, :string ], :void
  attach_function :rfbNewUDPConnection, [ :pointer, :int ], :void
  attach_function :rfbProcessUDPInput, [ :pointer ], :void
  attach_function :rfbSendFramebufferUpdate, [ :pointer, :pointer ], :char
  attach_function :rfbSendRectEncodingRaw, [ :pointer, :int, :int, :int, :int ], :char
  attach_function :rfbSendUpdateBuf, [ :pointer ], :char
  attach_function :rfbSendServerCutText, [ :pointer, :string, :int ], :void
  attach_function :rfbSendCopyRegion, [ :pointer, :pointer, :int, :int ], :char
  attach_function :rfbSendLastRectMarker, [ :pointer ], :char
  attach_function :rfbSendNewFBSize, [ :pointer, :int, :int ], :char
  attach_function :rfbSendSetColourMapEntries, [ :pointer, :int, :int ], :char
  attach_function :rfbSendBell, [ :pointer ], :void
  attach_function :rfbProcessFileTransferReadBuffer, [ :pointer, :uint ], :string
  attach_function :rfbSendFileTransferChunk, [ :pointer ], :char
  attach_function :rfbSendDirContent, [ :pointer, :int, :string ], :char
  attach_function :rfbSendFileTransferMessage, [ :pointer, :uchar, :uchar, :uint, :uint, :string ], :char
  attach_function :rfbProcessFileTransferReadBuffer, [ :pointer, :uint ], :string
  attach_function :rfbProcessFileTransfer, [ :pointer, :uchar, :uchar, :uint, :uint ], :char
  attach_function :rfbGotXCutText, [ :pointer, :string, :int ], :void
  attach_function :rfbTranslateNone, [ :string, :pointer, :pointer, :string, :string, :int, :int, :int ], :void
  attach_function :rfbSetTranslateFunction, [ :pointer ], :char
  attach_function :rfbSetClientColourMap, [ :pointer, :int, :int ], :char
  attach_function :rfbSetClientColourMaps, [ :pointer, :int, :int ], :void
  attach_function :rfbHttpInitSockets, [ :pointer ], :void
  attach_function :rfbHttpShutdownSockets, [ :pointer ], :void
  attach_function :rfbHttpCheckFds, [ :pointer ], :void
  attach_function :rfbAuthNewClient, [ :pointer ], :void
  attach_function :rfbProcessClientSecurityType, [ :pointer ], :void
  attach_function :rfbAuthProcessClientMessage, [ :pointer ], :void
  attach_function :rfbRegisterSecurityHandler, [ :pointer ], :void
  attach_function :rfbUnregisterSecurityHandler, [ :pointer ], :void
  attach_function :rfbSendRectEncodingRRE, [ :pointer, :int, :int, :int, :int ], :char
  attach_function :rfbSendRectEncodingCoRRE, [ :pointer, :int, :int, :int, :int ], :char
  attach_function :rfbSendRectEncodingHextile, [ :pointer, :int, :int, :int, :int ], :char
  ULTRA_MAX_RECT_SIZE = (128*256)
  attach_function :rfbSendRectEncodingUltra, [ :pointer, :int, :int, :int, :int ], :char
  VNC_ENCODE_ZLIB_MIN_COMP_SIZE = (17)
  ZLIB_MAX_RECT_SIZE = (128*256)
  attach_function :rfbSendRectEncodingZlib, [ :pointer, :int, :int, :int, :int ], :char
  TIGHT_DEFAULT_COMPRESSION = 6
  TURBO_DEFAULT_SUBSAMP = 0
  attach_function :rfbNumCodedRectsTight, [ :pointer, :int, :int, :int, :int ], :int
  attach_function :rfbSendRectEncodingTight, [ :pointer, :int, :int, :int, :int ], :char
  attach_function :rfbSendRectEncodingTightPng, [ :pointer, :int, :int, :int, :int ], :char
  class RfbCursor < FFI::Struct
    layout(
           :cleanup, :char,
           :cleanupSource, :char,
           :cleanupMask, :char,
           :cleanupRichSource, :char,
           :source, :pointer,
           :mask, :pointer,
           :width, :ushort,
           :height, :ushort,
           :xhot, :ushort,
           :yhot, :ushort,
           :foreRed, :ushort,
           :foreGreen, :ushort,
           :foreBlue, :ushort,
           :backRed, :ushort,
           :backGreen, :ushort,
           :backBlue, :ushort,
           :richSource, :pointer,
           :alphaSource, :pointer,
           :alphaPreMultiplied, :char
    )
  end
  attach_function :rfbSendCursorShape, [ :pointer ], :char
  attach_function :rfbSendCursorPos, [ :pointer ], :char
  attach_function :rfbConvertLSBCursorBitmapOrMask, [ :int, :int, :pointer ], :void
  attach_function :rfbMakeXCursor, [ :int, :int, :string, :string ], :pointer
  attach_function :rfbMakeMaskForXCursor, [ :int, :int, :string ], :string
  attach_function :rfbMakeMaskFromAlphaSource, [ :int, :int, :pointer ], :string
  attach_function :rfbMakeXCursorFromRichCursor, [ :pointer, :pointer ], :void
  attach_function :rfbMakeRichCursorFromXCursor, [ :pointer, :pointer ], :void
  attach_function :rfbFreeCursor, [ :pointer ], :void
  attach_function :rfbSetCursor, [ :pointer, :pointer ], :void
  attach_function :rfbDefaultPtrAddEvent, [ :int, :int, :int, :pointer ], :void
  attach_function :rfbSendRectEncodingZRLE, [ :pointer, :int, :int, :int, :int ], :char
  attach_function :rfbResetStats, [ :pointer ], :void
  attach_function :rfbPrintStats, [ :pointer ], :void
  class RfbFontData < FFI::Struct
    layout(
           :data, :pointer,
           :metaData, :pointer
    )
  end
  attach_function :rfbDrawChar, [ :pointer, :pointer, :int, :int, :uchar, :uint ], :int
  attach_function :rfbDrawString, [ :pointer, :pointer, :int, :int, :string, :uint ], :void
  attach_function :rfbDrawCharWithClip, [ :pointer, :pointer, :int, :int, :uchar, :int, :int, :int, :int, :uint, :uint ], :int
  attach_function :rfbDrawStringWithClip, [ :pointer, :pointer, :int, :int, :string, :int, :int, :int, :int, :uint, :uint ], :void
  attach_function :rfbWidthOfString, [ :pointer, :string ], :int
  attach_function :rfbWidthOfChar, [ :pointer, :uchar ], :int
  attach_function :rfbFontBBox, [ :pointer, :uchar, :pointer, :pointer, :pointer, :pointer ], :void
  attach_function :rfbWholeFontBBox, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void
  attach_function :rfbLoadConsoleFont, [ :string ], :pointer
  attach_function :rfbFreeFont, [ :pointer ], :void
  attach_function :rfbFillRect, [ :pointer, :int, :int, :int, :int, :uint ], :void
  attach_function :rfbDrawPixel, [ :pointer, :int, :int, :uint ], :void
  attach_function :rfbDrawLine, [ :pointer, :int, :int, :int, :int, :uint ], :void
  callback(:SelectionChangedHookPtr, [ :int ], :void)
  attach_function :rfbSelectBox, [ :pointer, :pointer, :pointer, :int, :int, :int, :int, :uint, :uint, :int, :SelectionChangedHookPtr ], :int
  attach_function :rfbUsage, [  ], :void
  attach_function :rfbPurgeArguments, [ :pointer, :pointer, :int, :pointer ], :pointer
  attach_function :rfbProcessArguments, [ :pointer, :pointer, :pointer ], :pointer
  attach_function :rfbProcessSizeArguments, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :pointer
  attach_function :rfbLogEnable, [ :int ], :void
  attach_function :rfbLogPerror, [ :string ], :void
  attach_function :rfbScheduleCopyRect, [ :pointer, :int, :int, :int, :int, :int, :int ], :void
  attach_function :rfbScheduleCopyRegion, [ :pointer, :pointer, :int, :int ], :void
  attach_function :rfbDoCopyRect, [ :pointer, :int, :int, :int, :int, :int, :int ], :void
  attach_function :rfbDoCopyRegion, [ :pointer, :pointer, :int, :int ], :void
  attach_function :rfbMarkRectAsModified, [ :pointer, :int, :int, :int, :int ], :void
  attach_function :rfbMarkRegionAsModified, [ :pointer, :pointer ], :void
  attach_function :rfbDoNothingWithClient, [ :pointer ], :void
  attach_function :rfbRegisterProtocolExtension, [ :pointer ], :void
  attach_function :rfbUnregisterProtocolExtension, [ :pointer ], :void
  attach_function :rfbGetExtensionIterator, [  ], :pointer
  attach_function :rfbReleaseExtensionIterator, [  ], :void
  attach_function :rfbEnableExtension, [ :pointer, :pointer, :pointer ], :char
  attach_function :rfbDisableExtension, [ :pointer, :pointer ], :char
  attach_function :rfbGetExtensionClientData, [ :pointer, :pointer ], :pointer
  attach_function :rfbCheckPasswordByList, [ :pointer, :string, :int ], :char
  attach_function :rfbGetScreen, [ :pointer, :pointer, :int, :int, :int, :int, :int ], :pointer
  attach_function :rfbInitServerWithPthreadsAndZRLE, [ :pointer ], :void
  attach_function :rfbShutdownServer, [ :pointer, :char ], :void
  attach_function :rfbNewFramebuffer, [ :pointer, :string, :int, :int, :int, :int, :int ], :void
  attach_function :rfbScreenCleanup, [ :pointer ], :void
  attach_function :rfbSetServerVersionIdentity, [ :pointer, :string, :varargs ], :void
  attach_function :rfbStartOnHoldClient, [ :pointer ], :void
  attach_function :rfbRefuseOnHoldClient, [ :pointer ], :void
  attach_function :rfbRunEventLoop, [ :pointer, :long, :char ], :void
  attach_function :rfbProcessEvents, [ :pointer, :long ], :char
  attach_function :rfbIsActive, [ :pointer ], :char
  attach_function :rfbRegisterTightVNCFileTransferExtension, [  ], :void
  attach_function :rfbUnregisterTightVNCFileTransferExtension, [  ], :void
  attach_function :messageNameServer2Client, [ :uint, :string, :int ], :string
  attach_function :messageNameClient2Server, [ :uint, :string, :int ], :string
  attach_function :encodingName, [ :uint, :string, :int ], :string
  attach_function :rfbStatLookupEncoding, [ :pointer, :uint ], :pointer
  attach_function :rfbStatLookupMessage, [ :pointer, :uint ], :pointer
  attach_function :rfbStatRecordEncodingSent, [ :pointer, :uint, :int, :int ], :void
  attach_function :rfbStatRecordEncodingSentAdd, [ :pointer, :uint, :int ], :void
  attach_function :rfbStatRecordEncodingRcvd, [ :pointer, :uint, :int, :int ], :void
  attach_function :rfbStatRecordMessageSent, [ :pointer, :uint, :int, :int ], :void
  attach_function :rfbStatRecordMessageRcvd, [ :pointer, :uint, :int, :int ], :void
  attach_function :rfbResetStats, [ :pointer ], :void
  attach_function :rfbPrintStats, [ :pointer ], :void
  attach_function :rfbStatGetSentBytes, [ :pointer ], :int
  attach_function :rfbStatGetSentBytesIfRaw, [ :pointer ], :int
  attach_function :rfbStatGetRcvdBytes, [ :pointer ], :int
  attach_function :rfbStatGetRcvdBytesIfRaw, [ :pointer ], :int
  attach_function :rfbStatGetMessageCountSent, [ :pointer, :uint ], :int
  attach_function :rfbStatGetMessageCountRcvd, [ :pointer, :uint ], :int
  attach_function :rfbStatGetEncodingCountSent, [ :pointer, :uint ], :int
  attach_function :rfbStatGetEncodingCountRcvd, [ :pointer, :uint ], :int
  attach_function :rfbSetProtocolVersion, [ :pointer, :int, :int ], :void
  attach_function :rfbSendTextChatMessage, [ :pointer, :uint, :string ], :char
  attach_function :rfbProcessNewConnection, [ :pointer ], :char
  attach_function :rfbUpdateClient, [ :pointer ], :char
end
