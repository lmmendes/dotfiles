#!/usr/bin/env bash
set -e
BASEDIR=$(dirname "$(readlink -f "$0")")

# shellcheck disable=SC1091
source "${HOMEBREW_PREFIX}/opt/asdf/libexec/asdf.sh"

function install_listed_sdks() {
    local name="$1"
    while IFS= read -r line || [[ -n "$line" ]]; do
        if [ -n "$line" ]; then
            version=$(echo "$line" | awk '{print $1}')
            alias=$(echo "$line" | awk '{print $2}')
            echo "Installing ${name} ${version}..."
            asdf install "$name" "$version"
            # With upgrade to asdf 0.16 alias plugin broke, I hope that the ends being added to the core
            # meanwhile let's comment out this section of the code.
            # https://github.com/andrewthauer/asdf-alias/issues/13
            # if [[ -n "$alias" && "${version}" != $(asdf alias "$name" "$alias") ]]; then
            #    echo "Setting alias ${alias} for ${name} ${version}..."
            #    asdf alias "$name" "$alias" "$version"
            # fi
        fi
    done < "${BASEDIR}/${name}.txt"
}

function uninstall_unlisted_sdks() {
    local name="$1"
    local installed
    local listed
    # Get installed versions of the SDK minus its aliases
    installed=$(comm -23 \
        <(asdf list "$name" | tr -d ' ' | sed 's/^\*//' | sort) \
        <(asdf alias "$name" --list | awk '{print $1}' | sort) \
        )
    listed=$(awk '{print $1}' < "${BASEDIR}/${name}.txt" | sort)
    while read -r version; do
        echo "Uninstalling ${name} ${version}..."
        asdf uninstall "${name}" "${version}"
    done < <(comm -23 <(echo "$installed") <(echo "$listed"))
}

# Create symlinks
ln -sfv "${BASEDIR}/tool-versions" "${HOME}/.tool-versions"

# Install plugins
while IFS= read -r plugin || [[ -n "$plugin" ]]; do
    if [ -n "$plugin" ]; then
        echo "Installing plugin '${plugin}'..."
        # Don't error out when plugins are already installed.
        # See https://github.com/asdf-vm/asdf/issues/841.
        sh -c "asdf plugin add ${plugin}" || true
    fi
done < "${BASEDIR}/plugins.txt"

# Remove plugins not in plugins.txt
while IFS= read -r plugin || [[ -n "$plugin" ]]; do
    echo "Uninstalling plugin '${plugin}'..."
    asdf plugin remove "${plugin}"
done < <(comm -23 <(asdf plugin list | sort) <(cat "${BASEDIR}/plugins.txt" | sort))

# # Install SDKs
for sdk in $(basename -s .txt "${BASEDIR}"/*.txt | grep -v plugins); do
    install_listed_sdks "$sdk"
    uninstall_unlisted_sdks "$sdk"
done

# Reshim plugins
while IFS= read -r plugin || [[ -n "$plugin" ]]; do
    if [ -n "$plugin" ]; then
        echo "Reshimming plugin '${plugin}'..."
        asdf reshim "${plugin}"
    fi
done < "${BASEDIR}/plugins.txt"
