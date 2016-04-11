pushd "$(dirname "$0")" > /dev/null
SCRIPT_DIR=$(pwd -L)
popd > /dev/null

echo "publish repo YTXChart"
pod repo push baidao-ios-ytx-pod-specs YTXAnimation.podspec --verbose

ret=$?

exit $ret