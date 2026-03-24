#!/usr/bin/env bash
# =============================================================================
# Laro XDR Agent \u2014 Public Launcher
# Safe to share. Contains NO secrets.
#
# USAGE:
#   curl -fsSL https://raw.githubusercontent.com/lyraminds/xdr-agent-install/refs/heads/main/xdr-agent.sh | sudo bash
#   curl -fsSL <url> | sudo bash -s -- remove
#   curl -fsSL <url> | sudo bash -s -- enroll
#   curl -fsSL <url> | sudo bash -s -- status
#   curl -fsSL <url> | sudo bash -s -- install -A my-server-name
#   curl -fsSL <url> | sudo bash -s -- install -A my-server-name -G client-a
#   curl -fsSL <url> | sudo bash -s -- install -A my-server-name -G client-a -M other-mgr.example.com
#   curl -fsSL <url> | sudo bash -s -- enroll -G client-a
#   curl -fsSL <url> | sudo bash -s -- enroll -G client-a -M other-mgr.example.com
# =============================================================================

set -euo pipefail

readonly PRIVATE_URL="https://raw.githubusercontent.com/lyraminds/xdr-agent-install/refs/heads/main/xdr-agent.sh"

# \u2500\u2500 Prompt for PAT \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500
# Must read from /dev/tty \u2014 stdin is the script itself when piped via curl | bash
printf 'GitHub PAT: ' > /dev/tty
read -rs _PAT < /dev/tty
printf '\n' > /dev/tty

if [[ -z "${_PAT}" ]]; then
  printf 'ERROR: No PAT entered.\n' >&2
  exit 1
fi

# \u2500\u2500 Fetch and run private script \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500
# Verify the PAT worked before piping to bash (catches 401/404 early)
_SCRIPT=$(curl -fsSL \
  -H "Authorization: token ${_PAT}" \
  "${PRIVATE_URL}" 2>&1) || {
  printf 'ERROR: Failed to fetch deployment script. Check your PAT and try again.\n' >&2
  unset _PAT _SCRIPT
  exit 1
}
unset _PAT

# Pass all arguments through (e.g. remove / enroll / status / install <name>)
bash <(printf '%s' "${_SCRIPT}") "$@"
unset _SCRIPT
