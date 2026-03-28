
function tmux-auto
    tmux new-session -d -s auto_session
    tmux attach-session -t auto_session
    tmux kill-server
end
