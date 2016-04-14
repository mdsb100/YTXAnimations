pushd "$(dirname "$0")" > /dev/null
SCRIPT_DIR=$(pwd -L)
popd > /dev/null

echo "publish repo YTXAnimations"
pod trunk push YTXAnimations.podspec --verbose

ret=$?

exit $ret
