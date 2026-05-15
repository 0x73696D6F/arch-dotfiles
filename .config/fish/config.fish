if status is-interactive
    # Starship custom prompt
    starship init fish | source

    # Direnv + Zoxide
    command -v direnv &> /dev/null && direnv hook fish | source
    command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source

    # Better ls
    alias ls='eza --classify=auto --color --group-directories-first --sort=extension -A'
    alias la='eza --classify=auto --color --group-directories-first --sort=extension -a -l --octal-permissions --no-permissions'

    alias pi="echo 3.14149265358979323846264338327950288419716939937510"

    alias conf 'cd ~/.config/'
    alias home 'cd ~'
    alias update 'sudo pacman -Syu'
    alias install 'sudo pacman -S'
    alias remove 'sudo pacman -Rns'
    alias aurup 'yay -Syu'

    # Abbrs
    abbr lg 'lazygit'
    abbr gd 'git diff'
    abbr ga 'git add .'
    abbr gc 'git commit -m'
    abbr gl 'git log'
    abbr gs 'git status'
    abbr gst 'git stash'
    abbr gsp 'git stash pop'
    abbr gp 'git push'
    abbr gpl 'git pull'
    abbr gsw 'git switch'
    abbr gsm 'git switch main'
    abbr gb 'git branch'
    abbr gbd 'git branch -d'
    abbr gco 'git checkout'
    abbr gsh 'git show'

    abbr l 'ls'
    abbr ll 'ls -l'
    abbr la 'ls -a'
    abbr lla 'ls -la'

    abbr chx 'chmod +x'



    if test -f ~/.config/fish/completions/matugen_colors.fish
        source ~/.config/fish/completions/matugen_colors.fish
    end

    # For jumping between prompts in foot terminal
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end

end

# Created by `pipx` on 2026-04-14 20:28:42
set PATH $PATH /home/simo/.local/bin
