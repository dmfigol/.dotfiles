#!/usr/bin/env sh
SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

PIPX_PYTHON_VERSION="3.9"
if ! command -v pipx &> /dev/null; then
  python${PIPX_PYTHON_VERSION} -m pip install --user pipx
  python${PIPX_PYTHON_VERSION} -m pipx ensurepath
  echo "pipx has been installed"
fi
while IFS="" read -r p || [ -n "$p" ]
do
  pipx_package=$(printf '%s\n' "$p")
  if ! pipx list | grep $pipx_package &> /dev/null; then
    pipx install --python python${PIPX_PYTHON_VERSION} $pipx_package
  fi
done < ${SCRIPT_PATH}/pipx-packages
echo "All pipx packages are installed"
