# ~/.config/fish/config.fish

if status is-interactive
    if not set -q TMUX
        exec ~/.local/bin/tmux-wrapper.sh
    end
end

# Histórico de comandos
set -U fish_history_max_count 10000

# Alias e bindings
alias history='history | tac | nl'
fish_vi_key_bindings

