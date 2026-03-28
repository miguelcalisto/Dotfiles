function tmux_auto_start
    if type -q tmux; and not set -q TMUX
        set -l last_id (tmux list-sessions -F "#S" 2>/dev/null | grep -oP '(?<=tmux-)\d+' | sort -n | tail -1)

        if test -z "$last_id"
            set NEXT_ID 0
        else
            set NEXT_ID (math $last_id + 1)
        end

        tmux new-session -s "tmux-$NEXT_ID"
    end
end

if status --is-interactive
    tmux_auto_start
end


set fish_greeting ""
set -U fish_history_max_count 10000

functions -e fish_greeting
alias history='history | tac | nl'
alias ls='lsd'
alias py='python3'
alias vi='nvim'
alias ll='ls -lah'
alias l='ls -lah'
alias v='nvim'
alias vi='nvim'

alias vim='nvim'
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



