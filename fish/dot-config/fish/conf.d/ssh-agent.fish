# Only run in interactive shells
status --is-interactive; or exit

# Expose systemd ssh-agent socket
if test -z "$SSH_AUTH_SOCK"
    set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
end

# Add key (if none loaded)
if not ssh-add -l >/dev/null 2>&1
    ssh-add ~/.ssh/id_ed25519 >/dev/null 2>&1
end

