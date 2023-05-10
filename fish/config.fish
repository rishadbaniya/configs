alias ls="exa"
alias cat="bat"
alias c="clear"
alias tree="et"

set -gx FNM_DIR $HOME/.local/share/fnm
set -gx LOGSEQ_DIR $HOME/.local/logseq
set -gx FLUTTER_DIR $HOME/hdd/flutter/bin
set -gx ANDROID_STUDIO $HOME/hdd/android/android-studio/bin
set -gx PLATFORM_TOOLS $HOME/hdd/android/sdk/platform-tools
set -gx RUSTFLAGS "$RUSTFLAGS -A unused_imports -A dead_code"
set -gx POSTGRES_BIN /usr/local/pgsql/bin
set -gx PATH $PATH $FNM $LOGSEQ_DIR $FLUTTER_DIR $ANDROID_STUDIO $PLATFORM_TOOLS $POSTGRES_BIN

# Sets up conda right here
set -gx __conda_setup (eval "/home/rishad/anaconda3/bin/conda shell.fish hook 2>/dev/null")
