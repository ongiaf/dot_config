if status --is-login
    # set XDG path
    set -gx XDG_CONFIG_HOME $HOME/.config
    set -gx XDG_DATA_HOME $HOME/.local/share
    set -gx XDG_CACHE_HOME $HOME/.cache
    set -gx EDITOR nvim
    # set PATH
    set -gx PATH $PATH $HOME/.cargo/bin
    if test (uname) = Darwin
        set -gx PATH $PATH /Applications/Keka.app/Contents/MacOS/
        set -gx PATH $PATH /Applications/WezTerm.app/Contents/MacOS/
        set -gx PATH $PATH /Applications/Vivaldi.app/Contents/MacOS/
        set -gx PATH $PATH /opt/homebrew/bin
    end
end

if status is-interactive
    # some abbr
    abbr -a .. 'cd ..'
    abbr -a cp 'cp -i'
    abbr -a mv 'mv -i'
    abbr -a rm 'rm -i'
    abbr -a mkdir 'mkdir -p'
    abbr -a g git
    abbr -a gc 'git commit -S -v'
    abbr -a gl 'git pull'

    # FZF OPTS
    set -gx FZF_DEFAULT_OPTS "\
      --height ~60% \
      --color=fg:#F8F8F2,hl:#9580FF \
      --color=fg+:#F8F8F2,hl+:#9580FF \
      --color=info:#FFCA80,prompt:#8AFF80,pointer:#FF80BF \
      --color=marker:#FF80BF,spinner:#FFCA80,header:#9580FF"

    # UV OPTS
    if command -q uv
      # tuna pypi mirror
      set -gx UV_INDEX https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple
      test (uname) = "Darwin" && set -gx UV_PYTHON /opt/homebrew/bin/python3
    end

    # set LS Colors
    command -q vivid && set -gx LS_COLORS (vivid generate dracula)

    # Some useful applications
    if command -q eza
        abbr -a l eza
        abbr -a ls eza
        abbr -a ll "eza -lbF --git --group-directories-first"
        abbr -a lt "eza --git --tree --level=2"
        abbr -a llt "eza --git --tree -l"
    end

    if command -q bat
        abbr -a ee "bat --wrap=never --style=numbers,grid"
        abbr -a ca "bat --wrap=never --style=plain"
    end

    if command -q uv
        abbr -a uvr "uv run"
        abbr -a uvp "uv pip"
    end

    command -q rg && abbr -a rg 'rg --smart-case --hidden --glob=!.git --follow --color=always --vimgrep'
    command -q btop && alias m="btop"
    command -q nvim && alias vim="nvim" && alias e="nvim"
    command -q zoxide && zoxide init fish | source
    command -q starship && starship init fish | source
    command -q atuin && atuin init fish --disable-up-arrow | source

    # completion
    command -q op && op completion fish | source
end

function fish_greeting
    echo
    if test (uname) = Darwin
        echo -e "\\e[1mOS:\\e[0m" (sw_vers -productVersion)
        echo -e "\\e[1mUptime:\\e[0m" (uptime | awk -F', ' '{print $1}' | sed 's/^.*up //')
        echo -e "\\e[1mDisk Usage:\\e[0m"
        echo -ne (\
            df -l -h | grep -E '(/Volumes/Data| /Volumes)' | \
            awk '{printf "  %20s\\\\t%4s / %4s  %s\\\\n\n", $9, $3, $2, $5}' | \
            sed -e 's/^\(.*\([8][5-9]\|[9][0-9]\)%.*\)$/\\\\e[0;31m\1\\\\e[0m/' -e 's/^\(.*\([7][5-9]\|[8][0-4]\)%.*\)$/\\\\e[0;33m\1\\\\e[0m/'  | paste -
        )
        echo -e "\\e[1mNetwork:\\e[0m"
        echo (ifconfig lo0 | grep "inet " | awk '{print "  lo0\\t" $2}')
        echo (ifconfig en0 | grep "inet " | awk '{print "  en0\\t" $2}')
    else if test (uname) = Linux
        echo -e (uname -ro | awk '{print "\\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
        echo -e (uptime -p | sed 's/^up //' | awk '{print "\\\\e[1mUptime: \\\\e[0;32m"$0"\\\\e[0m"}')
        echo -e "\\e[1mDisk usage:\\e[0m"
        btrfs filesystem usage / 2>&1 | grep -v WARNING | grep -v Size | grep -v Overall | grep -v "^\$"
        echo -e "\\e[1mNetwork:\\e[0m"
        echo -ne (\
            ip addr show up scope global | \
            grep -E ': <|inet' | \
            sed -e 's/^[[:digit:]]\+: //' \
                -e 's/: <.*//' \
                -e 's/.*inet[[:digit:]]* //' \
                -e 's/\/.*//'| \
            awk 'BEGIN {i=""} /\.|:/ {print i" "$0"\\\n"; next} // {i = $0}' | \
            sort | \
            column -t -R1 | \
            sed 's/ \([^ ]\+\)$/ \\\e[4m\1/' | \
            sed 's/m\(\(10\.\|172\.\(1[6-9]\|2[0-9]\|3[01]\)\|192\.168\.\).*\)/m\\\e[24m\1/' | \
            sed 's/^\( *[^ ]\+\)/\\\e[36m\1/' | \
            sed 's/\(\(en\|em\|eth\)[^ ]* .*\)/\\\e[39m\1/' | \
            sed 's/\(wl[^ ]* .*\)/\\\e[35m\1/' | \
            sed 's/\(ww[^ ]* .*\).*/\\\e[33m\1/' | \
            sed 's/$/\\\e[0m/' | \
            sed 's/^/\t/' \
            )

    end
    echo
    echo -e "\\e[35m中指立ててけ！\\e[0m"
    echo
end
