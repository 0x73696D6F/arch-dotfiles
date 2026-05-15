function fish_greeting
    set_color $fish_color_command
    echo ' ________ ___  ________  ___  ___     '
    echo '|\  _____\\  \|\   ____\|\  \|\  \    '
    echo '\ \  \__/\ \  \ \  \___|\ \  \\\  \   '
    echo ' \ \   __\\ \  \ \_____  \ \   __  \  '
    echo '  \ \  \_| \ \  \|____|\  \ \  \ \  \ '
    echo '   \ \__\   \ \__\____\_\  \ \__\ \__\\'
    echo '    \|__|    \|__|\_________\|__|\|__|'
    echo '                 \|_________|         '
    set_color normal
    fastfetch --key-padding-left 5
end
