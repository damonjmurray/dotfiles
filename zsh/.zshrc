# ALIASES

# allow aliases to be sudo’ed
alias sudo='sudo '

# quicker nav
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# quicker nav to specific places
alias ws="cd $HOME/Workspace"
alias dsk="cd $HOME/Desktop"
alias dls="cd $HOME/Downloads"
alias dfs="cd $HOME/Workspace/dotfiles"

# quicker editing
alias hosts='sudo vim /etc/hosts'

# quicker values
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com | pbcopy | echo '=> Public IP copied to clipboard.'"
alias pubkey="cat $HOME/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to clipboard.'"
alias privkey="cat $HOME/.ssh/id_rsa | pbcopy | echo '=> Private key copied to clipboard.'"



# FUNCTIONS

# Create a data URL from a file
function dataurl() {
	local mimeType=$(file -b --mime-type "$1");
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8";
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Show all the names (CNs and SANs) listed in the SSL certificate for a given domain
function getcertnames() {
	if [ -z "${1}" ]; then
		echo "ERROR: No domain specified.";
		return 1;
	fi;

	local domain="${1}";
	echo "Testing ${domain}…";
	echo ""; # newline

	local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
		| openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);

	if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
		local certText=$(echo "${tmp}" \
			| openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
			no_serial, no_sigdump, no_signame, no_validity, no_version");
		echo "Common Name:";
		echo ""; # newline
		echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
		echo ""; # newline
		echo "Subject Alternative Name(s):";
		echo ""; # newline
		echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
			| sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
		return 0;
	else
		echo "ERROR: Certificate not found.";
		return 1;
	fi;
}
