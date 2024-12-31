if not status -i
    exit
end

set -gx EDITOR 'nvim'

set -gx LS_COLORS (vivid generate ayu)

# general 
abbr -a .. 'cd ..'
abbr -a cp 'cp -i'
abbr -a mv 'mv -i'
abbr -a rm 'rm -i'
abbr -a mkdir 'mkdir -p'

# exa
abbr -a l 'eza'
abbr -a ll 'eza -lbF --git --group-directories-first'
abbr -a lt 'eza --git --tree --level=2'
abbr -a llt 'eza --git --tree -l'

# editor: neovim and emacs
abbr -a e '$EDITOR'
abbr -a vim 'nvim'

# git
abbr -a g git
abbr -a gc 'git commit -S -v'
abbr -a gl 'git pull'

# bat
abbr -a ee 'bat --wrap=never --style=numbers,grid'
abbr -a ca 'bat --wrap=never --style=plain'

# ripgrep
abbr -a rg 'rg --smart-case --hidden --glob=!.git --follow --color=always --vimgrep'

# no fish greeting
set -gx fish_greeting ''

# some apps
zoxide init fish | source
starship init fish | source
atuin init fish --disable-up-arrow | source
