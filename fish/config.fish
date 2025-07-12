source ~/.config/fish/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    echo ""
    fastfetch
    echo ""
    echo ""
end


alias dalarm="cd ~/Documents/projects/alarm && source bin/activate.fish && python main.py"
alias yay="paru"
alias anytype="~/Applications/Anytype.AppImage"

starship init fish | source
zoxide init fish | source
