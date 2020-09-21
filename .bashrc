### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### FRONTEND REDIRECT
profile_youtube="/home/user/.mozilla/firefox/hduch7j9.youtube"
profile_sns="/home/user/.mozilla/firefox/e2ru4ul5.social-media"

first_parties=('youtube.com' 'twitter.com' 'instagram.com')
third_parties=('invidious.tube' 'nitter.net' 'bibliogram.art')

case ${1} in
    *"${first_parties[0]}"*) # access youtube via invidious
        firefox --profile "${profile_youtube}" "${1/${first_parties[0]}/${third_parties[0]}}"
        ;;
    *"${first_parties[1]}"*) # access twitter via nitter
        firefox --profile "${profile_sns}" "${1/${first_parties[1]}/${third_parties[1]}}"
        ;;
    *"${first_parties[2]}"*) # access instagram via bibliogram
        firefox --profile "${profile_sns}" "${1/${first_parties[2]}/${third_parties[2]}}"
        ;;
    *)
        ;;
esac

### ALIASES ###

# navigation
alias ..="cd .." 
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias cdc="cd ~/Documents/codium"

# dnf
# alias dnfi="sudo dnf install"
# alias dnfr="sudo dnf remove"
# alias dnfs="dnf search"

# pacman and yay
alias pacs="sudo pacman -S"
alias pacsyu="sudo pacman -Syyu"                 # update only standard pkgs
alias yaysua="yay -Sua --noconfirm"              # update only AUR pkgs
alias yaysyu="yay -Syu --noconfirm"              # update standard pkgs and AUR pkgs
alias unlock="sudo rm /var/lib/pacman/db.lck"    # remove pacman lock
alias cleanup="sudo pacman -Rns $(pacman -Qtdq)" # remove orphaned packages

# Changing "ls" to "lsd"
alias ls="lsd"

# Sort by image dimensions
alias lss="find . -exec exiftool -S -t -q -FileName -ImageSize  {} + | sort -k2n,2 > dir-dimensions_tmp.txt ; sed '0~2d' dir-dimensions_tmp.txt > dir-dimensions.txt ; rm dir-dimensions_tmp.txt"

# git
alias clone="git clone"

# shutdown or reboot
alias shutdown="sudo shutdown now"
alias reboot="sudo reboot"

# youtube-dl
alias ytdb="youtube-dl -f bestvideo+bestaudio"

# redshift
alias rs="redshift -x ; redshift -O"

# sublime text
alias sublime="/opt/sublime_text/sublime_text"

# frontend-redirect
alias fr="sh .bashrc-extension_frontend-redirect.sh"

# randomizing wallpapers
alias bg-rng="feh --bg-fill --randomize ~/Pictures/wallpapers/japan"