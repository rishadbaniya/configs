alias ls="exa"
alias cat="bat"
alias c="clear"
alias tree="et"

set -x FNM_DIR $HOME/.local/share/fnm
set -x LOGSEQ_DIR $HOME/.local/logseq
set -x FLUTTER_DIR $HOME/hdd/flutter/bin
set -x ANDROID_STUDIO $HOME/hdd/android/android-studio/bin
set -x PLATFORM_TOOLS $HOME/hdd/android/sdk/platform-tools

set -x PATH $PATH $FNM $LOGSEQ_DIR $FLUTTER_DIR $ANDROID_STUDIO $PLATFORM_TOOLS

#if status is-interactive
#    # Commands to run in interactive sessions can go here
#end


