# zsh
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi
export CDPATH=.:~
alias watch="watch "
# OS X colours
export LSCOLORS=ExGxFxdaCxDaDahbadacec
# Linux colours
alias ls="gls --color=auto"
LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.cfg=00;32:*.conf=00;32:*.diff=00;32:*.doc=00;32:*.ini=00;32:*.log=00;32:*.patch=00;32:*.pdf=00;32:*.ps=00;32:*.tex=00;32:*.txt=00;32:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
# GNU versions
export PATH=/usr/local/Cellar/coreutils/8.28_1/libexec/gnubin:$PATH
# sbin
export PATH="/usr/local/sbin:$PATH"

# history
export HISTSIZE=1000000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE

# keybindings
bindkey "^[[3~" delete-char

# gcloud
source /usr/local/opt/google-cloud-sdk/completion.zsh.inc
source /usr/local/opt/google-cloud-sdk/path.zsh.inc
export CLOUDSDK_PYTHON=/usr/bin/python

# go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH
export CDPATH=$GOPATH/src:$CDPATH

# git
alias g="git"
alias gs="git status"
alias gb="git branch"
alias gc="git checkout"
alias gm="git merge"
alias ga="git add"
alias gr="git rebase"
alias gd="git diff"
alias gl="git log --graph --oneline --decorate --all"
alias gcm="git commit -m"
alias gph="git push"
alias gpl="git pull"
alias gcb="git checkout -b"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"

# vault
export VAULT_ADDR=https://vault.lukeaddison.co.uk:8200
export VAULT_CACERT=~/.vault.d/home/ca.crt
export VAULT_CLIENT_CERT=~/.vault.d/home/client.crt
export VAULT_CLIENT_KEY=~/.vault.d/home/client.key

# consul
export CONSUL_HTTP_ADDR=consul.lukeaddison.co.uk:8501
export CONSUL_HTTP_SSL=true
export CONSUL_CACERT=~/.consul/ca.crt
export CONSUL_CLIENT_CERT=~/.consul/client.crt
export CONSUL_CLIENT_KEY=~/.consul/client.key

# virtualenv
export WORKON_HOME=~/virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# editor
export EDITOR=nano

# kubernetes
source <(kubectl completion zsh)
alias k='kubectl'
alias kg='kubectl get'
alias kc='kubectl create'
alias kd='kubectl describe'
alias kr='kubectl replace'
alias ke='kubectl edit'
alias ku='kubectl update'
alias ka='kubectl apply'
alias kl='kubectl logs'
alias kx='kubectl exec'
alias kdel='kubectl delete'
# kubectx
alias kctx='kubectx'
alias kns='kubens'
# kubebuilder
export PATH=$PATH:/usr/local/kubebuilder/bin
alias kb='kubebuilder'
# zsh-kubectl-prompt
autoload -U colors; colors
source /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh
RPROMPT='%{$fg_bold[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
# root
alias koot='kubectl run koot --restart=Never -t -i -n kube-system --image overridden --overrides '"'"'{"spec":{"hostPID": true, "hostNetwork": true, "hostIPC": true, "containers":[{"name":"alpine","image":"alpine:3.10","command":["nsenter","--mount=/proc/1/ns/mnt","--","/bin/bash"],"stdin": true,"tty":true,"securityContext":{"privileged":true}}]}}'"'"' --rm --attach'
# gke rbac
alias gkerbac='kubectl create clusterrolebinding $(gcloud config get-value account)-cluster-admin --clusterrole cluster-admin --user $(gcloud config get-value account)'
# port-forward
alias sonarr='kubectl port-forward -n sonarr service/sonarr 8989 | /usr/bin/sed -e "1 i\\
http://127.0.0.1:8989"'
alias radarr='kubectl port-forward -n radarr service/radarr 7878 | /usr/bin/sed -e "1 i\\
http://127.0.0.1:7878"'
alias kubeflow='kubectl port-forward -n kubeflow service/ambassador 8080:80 | /usr/bin/sed -e "1 i\\
http://127.0.0.1:8080"'

# tarmak
alias t='tarmak'
alias tk='tarmak kubectl'
alias ts='tarmak cluster ssh'
alias tc='tarmak clusters list'
alias tl='tarmak clusters instances list'
alias ta='tarmak clusters apply'
alias tp='tarmak clusters plan'
alias ti='tarmak init'

# aws
export PATH=$PATH:/Users/luke/Library/Python/2.7/bin

# istio
export PATH=$PATH:/opt/istio/istio-0.8.0/bin
alias i='istioctl'

# chrome
alias chrome='open -a "Google Chrome"'

# vpn
export PATH=/usr/local/opt/openvpn/sbin:$PATH
alias vpn-home="sudo openvpn --config ~/.openvpn/home.opvn"

# puppet
export BUNDLE_DIR=$HOME/.bundle

# docker
alias docker-start='open --background -a Docker'
alias docker-stop='osascript -e '"'"'quit app "Docker"'"'"
