// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let package = Package(
    name: "ArcXP",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ArcXP",
            targets: [.BinaryTarget.arcXPsdk,
                      .BinaryTarget.googleAds,
                      .BinaryTarget.omSDK,
                      .BinaryTarget.palSDK])
    ],
    targets: [
        .BinaryTarget.arcXPsdk,
        .BinaryTarget.googleAds,
        .BinaryTarget.omSDK,
        .BinaryTarget.palSDK
    ]
)

extension Target {
    
    enum BinaryTarget {
        static let arcXPsdk = binaryTarget(
            name: .BinaryTarget.arcXPsdk,
            remoteChecksum: .CheckSum.arcXPsdk_CS
        )

        static let googleAds = binaryTarget(
            name: .BinaryTarget.googleAds,
            remoteChecksum: .CheckSum.googleAds_CS
        )

        static let omSDK = binaryTarget(
            name: .BinaryTarget.omSDK,
            remoteChecksum: .CheckSum.omSDK_CS
        )

        static let palSDK = binaryTarget(
            name: .BinaryTarget.palSDK,
            remoteChecksum: .CheckSum.palSDK_CS
        )
    }

    static func binaryTarget(name: String, remoteChecksum: String) -> Target {
        return .binaryTarget(
            name: name,
            url: remoteBinaryURLString(for: name),
            checksum: remoteChecksum
        )
    }
    
    static func remoteBinaryURLString(for targetName: String) -> String {
        return "https://github.com/arcxp/arcxpSDK-iOS-package-test/raw/refs/heads/main/\(targetName).zip"
    }
}

extension String {
    enum BinaryTarget {
        static let arcXPsdk = "ArcXP"
        static let googleAds = "GoogleInteractiveMediaAds"
        static let omSDK = "OMSDK_Washpost"
        static let palSDK = "ProgrammaticAccessLibrary"
    }
    
    enum CheckSum {
        static let arcXPsdk_CS = "6389ee217190ad13525e0670545793db51ac117d132dcf8d642e5f26d3012611"
        static let googleAds_CS = "4d7982a1502800d32cf19a2502da576c3bacd9615db22d1f1902bf784f135662"
        static let omSDK_CS = "f4c1cfdcd5e7435fb133309fa310b3237cf2b94417395c60658303798997dd79"
        static let palSDK_CS = "1ce34451d522cc81d3670d56d066aede50aab40500b7f98024ecc66806e34046"
    }
}
