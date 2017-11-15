# QTFloatingDrawer

[![CI Status](http://img.shields.io/travis/BhumaJ/QTFloatingDrawer.svg?style=flat)](https://travis-ci.org/BhumaJ/QTFloatingDrawer)
[![Version](https://img.shields.io/cocoapods/v/QTFloatingDrawer.svg?style=flat)](http://cocoapods.org/pods/QTFloatingDrawer)
[![License](https://img.shields.io/cocoapods/l/QTFloatingDrawer.svg?style=flat)](http://cocoapods.org/pods/QTFloatingDrawer)
[![Platform](https://img.shields.io/cocoapods/p/QTFloatingDrawer.svg?style=flat)](http://cocoapods.org/pods/QTFloatingDrawer)

## Example
This is the simple reimplementation of [KGFloatingDrawer](https://github.com/KyleGoddard/KGFloatingDrawer) in SWIFT 4.
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Screenshots
![](https://github.com/BhumaJ/QTFloatingDrawer/blob/master/qtfloatingdrawer.gif)

## Requirements
- iOS 8.0+ / macOS 10.10+ / Xcode 9.0+
- Swift 4 

## Installation

QTFloatingDrawer is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

## How To Use
```
func prepareDrawerViewController() -> QTDrawerViewController {
        let drawerViewController = QTDrawerViewController()
        drawerViewController.centerViewController = drawerSettingsViewController()
        drawerViewController.leftViewController = leftViewController()
        drawerViewController.rightViewController = rightViewController()
        _drawerViewController = drawerViewController

        return drawerViewController
    }
```

## Author

BhumaJ

## License

QTFloatingDrawer is available under the MIT license. See the LICENSE file for more info.
