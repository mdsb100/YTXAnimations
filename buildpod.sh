pushd "$(dirname "$0")" > /dev/null
SCRIPT_DIR=$(pwd -L)
popd > /dev/null

echo "publish repo YTXAnimations"
pod repo push baidao-ios-ytx-pod-specs YTXAnimations.podspec --verbose

ret=$?

exit $ret
