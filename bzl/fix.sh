# --- begin runfiles.bash initialization v2 ---
# Copy-pasted from the Bazel Bash runfiles library v2.
set -uo pipefail; f=bazel_tools/tools/bash/runfiles/runfiles.bash
source "${RUNFILES_DIR:-/dev/null}/$f" 2>/dev/null || \
  source "$(grep -sm1 "^$f " "${RUNFILES_MANIFEST_FILE:-/dev/null}" | cut -f2- -d' ')" 2>/dev/null || \
  source "$0.runfiles/$f" 2>/dev/null || \
  source "$(grep -sm1 "^$f " "$0.runfiles_manifest" | cut -f2- -d' ')" 2>/dev/null || \
  source "$(grep -sm1 "^$f " "$0.exe.runfiles_manifest" | cut -f2- -d' ')" 2>/dev/null || \
  { echo>&2 "ERROR: cannot find $f"; exit 1; }; f=; set -e
# --- end runfiles.bash initialization v2 ---


FIX_BAZEL=$(realpath $(rlocation monorepo/buildifier.bash))
FIX_CSS=$(realpath $(rlocation monorepo/css/lint/lint.sh))
FIX_GO=$(realpath $(rlocation go_sdk/bin/gofmt))
FIX_JS=$(realpath $(rlocation npm/eslint/bin/eslint.sh))

echo Fixing CSS files... 1>&2
(cd $BUILD_WORKSPACE_DIRECTORY
git ls-files --cached --modified --other --exclude-standard | uniq | grep .css$ | xargs $FIX_CSS --ignore-path .gitignore --fix
echo Fixing Go files... 1>&2
$FIX_GO -s -w .
echo Fixing Typescript, Javascript, json files... 1>&2
$FIX_JS --fix --ignore-pattern 'project/ck3/base_game/*' --ignore-path .gitignore "$BUILD_WORKSPACE_DIRECTORY"'/**/*.ts' "$BUILD_WORKSPACE_DIRECTORY"'/**/*.js' "$BUILD_WORKSPACE_DIRECTORY"'/**/*.tsx' "$BUILD_WORKSPACE_DIRECTORY"'/**/*.json') || true # ignore failures. it fails often
echo Fixing bazel files... 1>&2
$FIX_BAZEL --lint=fix -r $INIT_CWD
