import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

/*
 +-------------+
 |             |
 |     App     | Contains Tuist App target and Tuist unit-test target
 |             |
 +------+-------------+-------+
 |         depends on         |
 |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+
 
 */

// MARK: - Project
private let appName = "Tuist"
private let bundleId = "com.likeLion.Machacha"
private let targetVersion = "16.0"
private let organizationName = "Machacha"

let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "UIMainStoryboardFile": "",
    "UILaunchStoryboardName": "LaunchScreen"
    ]
// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

// Creates our project using a helper function defined in ProjectDescriptionHelpers
//let project = Project.app(name: "Tuist",
//                          platform: .iOS,
//                          additionalTargets: ["TuistKit", "TuistUI"])


let project = Project(
    name: appName,
    organizationName: organizationName,
    packages: [
        .remote(url: "https://github.com/ReactorKit/ReactorKit.git", requirement: .upToNextMajor(from: "3.2.0"))
    ],
    targets: [
        Target(name: appName,
               platform: .iOS,
               product: .app,
               bundleId: bundleId,
               deploymentTarget: .iOS(targetVersion: targetVersion, devices: [.iphone]),
               infoPlist: .extendingDefault(with: infoPlist),
               sources: ["Targets/\(appName)/Sources/**"],
               resources: ["Targets/\(appName)/Resources/**"],
               dependencies: [
                .package(product: "ReactorKit")
               ]
          )
    ]
)

//let project = Project(
//  name: "TestApp",
//  packages: [
//    .remote(
//      url: "https://github.com/ReactorKit/ReactorKit.git",
//      requirement: .upToNextMajor(from: "3.2.0")
//    )
//  ],
//  targets: [
//    Target(
//      name: "TestApp",
//      platform: .iOS,
//      product: .app,
//      bundleId: "com.kanghoon.test",
//      dependencies: [
//        .package(product: "ReactorKit")
//      ]
//    )
//  ]
//)
