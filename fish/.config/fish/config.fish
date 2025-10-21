function fish_prompt -d "Write out the prompt"
    # Managed by Starship
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end

starship init fish | source
fish_vi_key_bindings
# if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
#     cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
# end

# Set Clang as the default C and C++ compiler
set -x CC clang
set -x CXX clang++

#############
## Aliases
###########

alias yayes 'yay --answerclean All --answerdiff All --answerupgrade All --noconfirm'

# ls
alias ls 'eza --icons'
alias la 'eza --icons -la'
alias tree 'eza --icons --tree'

# Map editors to nvim
alias vi nvim
alias vim nvim
alias nano nvim

# Monitor Manager
alias monitor '$HOME/.config/hypr/hyprland/scripts/monitor-manager.py read $HOME/.config/hypr/hyprland/monitor.conf'
alias resinc '$HOME/.config/hypr/hyprland/scripts/monitor-manager.py resinc $HOME/.config/hypr/hyprland/monitor.conf'
alias resdec '$HOME/.config/hypr/hyprland/scripts/monitor-manager.py resdec $HOME/.config/hypr/hyprland/monitor.conf'
alias scaleinc '$HOME/.config/hypr/hyprland/scripts/monitor-manager.py scaleinc $HOME/.config/hypr/hyprland/monitor.conf'
alias scaledec '$HOME/.config/hypr/hyprland/scripts/monitor-manager.py scaledec $HOME/.config/hypr/hyprland/monitor.conf'

# Cmake compile commands
alias ccmake 'cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..'

# man
alias mann tldr

# Clear
alias clear "printf '\033[2J\033[3J\033[1;1H'"

# Created by `pipx` on 2025-06-30 23:43:06
set PATH $PATH /home/daniele/.local/bin

# Flutter
set PATH $PATH $HOME/.pub-cache/bin

set -x JAVA_HOME /usr/lib/jvm/java-17-openjdk
set -x PATH $JAVA_HOME/bin $PATH

set -x ANDROID_HOME $HOME/android-sdk/
set -x PATH $ANDROID_HOME/bin $PATH
set -x PATH $ANDROID_HOME/platform-tools $PATH

# Melos
set -x PATH $HOME/.pub-cache/bin $PATH

# Chrome
set -x CHROME_EXECUTABLE /usr/bin/google-chrome-stable
set -x BROWSER firefox
