#!/bin/bash
# Verify a distributed Catalyst framework without its compiler-specific modules.
set -euo pipefail

framework=${1:?Usage: verify-module-stability.sh /path/to/SparkleBridgeClient.framework}
work=$(mktemp -d /private/tmp/sparkle-module-stability.XXXXXX)
trap 'rm -rf "$work"' EXIT

ditto "$framework" "$work/SparkleBridgeClient.framework"
modules="$work/SparkleBridgeClient.framework/Modules/SparkleBridgeClient.swiftmodule"
# Only remove files from our disposable copy, never the original build product.
find -H "$modules" -type f \( -name '*.swiftmodule' -o -name '*.private.swiftinterface' \) -delete

cat > "$work/Import.swift" <<'SWIFT'
import SparkleBridgeClient

final class Driver: SparkleDriver {
    override func showUpdateFound(with appcastItem: AppcastItem, userInitiated: Bool,
                                  state: UserUpdateState, reply: @escaping UpdateAlertCallback) {
        reply(.dismiss)
    }
}

let result = SparkleBridgeClient.load(with: Driver())
SWIFT

sdk=$(xcrun --sdk macosx --show-sdk-path)
for arch in arm64 x86_64; do
    test -f "$modules/$arch-apple-ios-macabi.swiftinterface"
    xcrun swiftc -typecheck "$work/Import.swift" \
        -sdk "$sdk" -target "$arch-apple-ios15.0-macabi" \
        -F "$work" -F "$sdk/System/iOSSupport/System/Library/Frameworks" \
        -I "$sdk/System/iOSSupport/usr/include" \
        -module-cache-path "$work/cache-$arch"
    echo "$arch: public Swift interface import passed"
done
