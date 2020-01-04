class Wraith::Server::Hook
  include com.sun.jna.platform.win32.WinUser::LowLevelKeyboardProc
  attr_accessor :user, :kl, :hook_handle
  def callback( n_code, w_param, l_param )
    if n_code >= 0
      case w_param.int_value
      when 0x101, 0x105
        self.kl.handle_key_up( l_param.vkCode )
      when 0x100, 0x104
        self.kl.handle_key_down( l_param.vkCode )
      end
    end
    return self.user.call_next_hook_ex( self.hook_handle, n_code, w_param, l_param.get_pointer )
  end
end