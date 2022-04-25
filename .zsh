export ZSH="/Users/<user>/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(
	git
)

source $ZSH/oh-my-zsh.sh

#proxy
function setproxy() {
	PROXY_URL=$(scutil --proxy | grep ProxyAutoConfigURLString | grep -Eo '(http|https)://[^/"]+')
	export {http,https,ftp,all}_proxy=$PROXY_URL':<port>'
	export {HTTP,HTTPS,FTP,ALL}_PROXY=$PROXY_URL':<port>'
}

setproxy

#kube
function setaliaskube() {
	alias k="kubectl"
	alias kg="kubectl get"
    alias kl=$k "logs"
    source /path/to/kube-ps1.sh ## context plugin
    PROMPT='$(kube_ps1)'$PROMPT
}

setalias