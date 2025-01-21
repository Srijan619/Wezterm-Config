local platform = require('utils.platform')

local options = {
   default_prog = {},
   launch_menu = {},
}

if platform.is_win then
   options.default_prog = { 'pwsh', '-NoLogo' }
   options.launch_menu = {
      { label = 'PowerShell Core', args = { 'pwsh', '-NoLogo' } },
      { label = 'PowerShell Desktop', args = { 'powershell' } },
      { label = 'Command Prompt', args = { 'cmd' } },
      { label = 'Nushell', args = { 'nu' } },
      { label = 'Msys2', args = { 'ucrt64.cmd' } },
      {
         label = 'Git Bash',
         args = { 'C:\\Users\\kevin\\scoop\\apps\\git\\current\\bin\\bash.exe' },
      },
   }
elseif platform.is_mac then
   -- For macOS, using Zsh (which is default on macOS) or Oh My Zsh if installed
   options.default_prog = { '/bin/zsh', '-l' } -- Default to Zsh
   options.launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Zsh', args = { '/bin/zsh', '-l' } },
      { label = 'Nushell', args = { '/opt/homebrew/bin/nu', '-l' } },
   }
elseif platform.is_linux then
   -- For Linux, assuming you use Zsh
   options.default_prog = { 'zsh', '-l' } -- Default to Zsh
   options.launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Zsh', args = { 'zsh', '-l' } },
   }
end

return options
