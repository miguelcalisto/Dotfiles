# ~/.config/fish/config.fish

if status is-interactive
    if not set -q TMUX
         ~/.local/bin/tmux-wrapper.sh
    end
end
# Desativa a mensagem de boas-vindas do fish
set fish_greeting ""
# Histórico de comandos
set -U fish_history_max_count 10000

functions -e fish_greeting
# Alias e bindings
alias history='history | tac | nl'
alias ls='lsd'
alias py='python3'
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes

set -g theme_git_worktree_support yes
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes

fish_vi_key_bindings
