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
        static let arcXPsdk_CS = "790a5fbff1703121ec0eb828ee04f9d4187ab766121d754dc775557b3b189892"
        static let googleAds_CS = "ac69ce9dee25580a9823d218e9855ee0034dd8a66273762efd166c7bdaa661a3"
        static let omSDK_CS = "a314f0610752819be55ce1e8c7bb3f5676ff2ea6215831835f6b58f4a1a9216f"
        static let palSDK_CS = "3569451b2ecc5c13b31844eac7fb41abb3723d9a1cca554d1fb0f9565acf5dc9"
    }
}
