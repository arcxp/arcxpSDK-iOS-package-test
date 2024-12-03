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
        return "https://github.com/WPMedia/arcxpSDK-iOS-package-test/raw/refs/heads/main/\(targetName).zip"
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
        static let arcXPsdk_CS = "0b1399dfaf50c6c88f3be4db0510b34fbdbf95acba1e9a4827a8d507e2ec0796"
        static let googleAds_CS = "a53fd2cbb781e16807880524e26a7913a27952928e13d6bfb9a7c24232daa9aa"
        static let omSDK_CS = "6dc1ac49b22ebb8b9b00f4ffdcb7cf9752dcfd8f0a683a18f121b000198e3a03"
        static let palSDK_CS = "d53b69f75e70a4377034186144d243d4da0878629eea3dfece36c6cc76048e75"
    }
}
