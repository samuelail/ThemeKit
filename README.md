# ThemeKit

[![CI Status](https://img.shields.io/travis/SamuelAilemen/ThemeKit.svg?style=flat)](https://travis-ci.org/SamuelAilemen/ThemeKit)
[![Version](https://img.shields.io/cocoapods/v/ThemeKit.svg?style=flat)](https://cocoapods.org/pods/ThemeKit)
[![License](https://img.shields.io/cocoapods/l/ThemeKit.svg?style=flat)](https://cocoapods.org/pods/ThemeKit)
[![Platform](https://img.shields.io/cocoapods/p/ThemeKit.svg?style=flat)](https://cocoapods.org/pods/ThemeKit)

# Screenshot
![Iphone](https://github.com/samuelail/ThemeKit/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202021-12-11%20at%2019.41.49.png)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ThemeKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Theme-Kit'
```

## Usage
Remember to `import ThemeKit`

```
ThemeKit works by extending UIView. So, anything built on UIView can use ThemeKit directly.
```

### Example

```swift
        //Apply a gradient
        view.gradient()
        
        //Optionally you can customize the properties of the gradient
        view.gradient(startColor: "#2d3436", endColor: "#2c3e50")
        
        //Change view's color using a hex value
        view1.color(hex: "#0984e3")
        
        //Make view round
        view1.round(corners: [.bottomRight], radius: 50.0)
        
        //Optionally you can just call to use default values
        view1.round()
        
        //Add a shadow to  view
        view1.addShadow()
        
        //Optionally you can customize properties of the shadow
        view1.addShadow(color: "#95a5a6", radius: 20.0)
        
        //Add a border with default values to view
        view1.addBorder()
        
        //Optionally you can customize the border width and color
        view1.addBorder(color: "#95a5a6", width: 1.0)
        
        //ThemeKit also has some device actions
        
        //Make device vibrate
          ThemeKit.vibrate() {
              print("vibrated")
          }
          
          
        //AND NOW, SOME ANIMATIONS
        
       
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: { [weak self] in
            //Make that thang shake
            self?.view1.shake {
                print("shake")
            }
        })
        
                DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: { [weak self] in
            //Make that thang bounce
            self?.view1.bounce {
                print("bounce")
            }
        })
        
       
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: { [weak self] in
            //Make that thang blink
            self?.view1.blink {
                print("blink")
            }
        })
```

## Author

Samuel Ailemen, samuel@verified.ly

## License

ThemeKit is available under the MIT license. See the LICENSE file for more info.
