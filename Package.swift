// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftFFmpeg",
  platforms: [.iOS(.v9), .macOS(.v10_10), .tvOS(.v10)],
  products: [
    .library(
      name: "SwiftFFmpeg",
      targets: ["SwiftFFmpeg"]
    )
  ],
  targets: [
    .target(
      name: "SwiftFFmpeg",
      dependencies: ["CFFmpeg"]
    ),
    .target(
      name: "CFFmpeg",
      dependencies: [
        "libavcodec",
        "libavdevice",
        "libavfilter",
        "libavformat",
        "libavutil",
        "libswresample",
        "libswscale",
      ],
      linkerSettings: [
        .linkedLibrary("z"),
        .linkedLibrary("bz2"),
        .linkedLibrary("iconv"),
        .linkedLibrary("lzma"),
        .linkedFramework("Security"),
        .linkedFramework("CoreMedia"),
        .linkedFramework("CoreVideo"),
        .linkedFramework("AVFoundation"),
        .linkedFramework("AudioToolbox"),
        .linkedFramework("VideoToolbox"),
        .linkedFramework("CoreImage"),
      ]
    ),
    .binaryTarget(
      name: "libavcodec",
      url: "https://github.com/leilee/SwiftFFmpeg/blob/master/xcframework/libavcodec.zip?raw=true",
      checksum: "45998c679716e23c110315d462d7aa26f466965f119be3b3f5eb6e1d0b7e641c"
    ),
    .binaryTarget(
      name: "libavdevice",
      url: "https://github.com/leilee/SwiftFFmpeg/blob/master/xcframework/libavdevice.zip?raw=true",
      checksum: "8abebcd3981ad70f38ed6547d613725bc0e7ba28a0f6dde2f795b6f59ffe59ba"
    ),
    .binaryTarget(
      name: "libavfilter",
      url: "https://github.com/leilee/SwiftFFmpeg/blob/master/xcframework/libavfilter.zip?raw=true",
      checksum: "7b48b127af8bb14e944d00f26933212b6fb5794fc2aa4ad4f717a1cb78acd40e"
    ),
    .binaryTarget(
      name: "libavformat",
      url: "https://github.com/leilee/SwiftFFmpeg/blob/master/xcframework/libavformat.zip?raw=true",
      checksum: "241f020b25d7cca57be1bd8bbd0ed11af9b0d44133059fb931b634f10eb267ed"
    ),
    .binaryTarget(
      name: "libavutil",
      url: "https://github.com/leilee/SwiftFFmpeg/blob/master/xcframework/libavutil.zip?raw=true",
      checksum: "f37690cf3f30b01646572e4cc9c8266469ac0beea6b6e03000fee3f1f7daa69d"
    ),
    .binaryTarget(
      name: "libswresample",
      url: "https://github.com/leilee/SwiftFFmpeg/blob/master/xcframework/libswresample.zip?raw=true",
      checksum: "6a2cdec80d9de57fbcaf62f88bd89f75f2c964cdae6629c9311dd750c3763f39"
    ),
    .binaryTarget(
      name: "libswscale",
      url: "https://github.com/leilee/SwiftFFmpeg/blob/master/xcframework/libswscale.zip?raw=true",
      checksum: "67d73cefd13337c84bab00e8a87d05ad5609a2edb9e437cce58261d49452a14e"
    ),
    .target(
      name: "SwiftFFmpegExamples",
      dependencies: ["SwiftFFmpeg"]
    ),
    .testTarget(
      name: "SwiftFFmpegTests",
      dependencies: ["SwiftFFmpeg"]
    ),
  ]
)
