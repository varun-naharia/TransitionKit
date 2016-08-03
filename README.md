# TransitionKit

## Type

* Semi Model Transition

* Gate Transition

* Circle Transition

  ​

## Screenshot

#### SemiModel Transition

![](Demo_SemiModel.gif)



#### Gate Transition

![](Demo_Gate.gif)



#### Circle Transition

![](Demo_Circle.gif)



## Installation

#### Carthage

```swift
github "cp3hnu/TransitionKit"
```

*   Drag and drop *TransitionKit.framework* from /Carthage/Build/iOS/ to Linked frameworks and libraries in Xcode (Project>Target>General>Linked frameworks and libraries)

*   Add new run script

    ```swift
      /usr/local/bin/carthage copy-frameworks
    ```

*   Add Input files *$(SRCROOT)/Carthage/Build/iOS/TransitionKit.framework*




##Getting Started

#### SemiModel Transition

```swift
private let semiModelTransition = SemiModelTransition(distanceFromTop: 200)

func present() {
	let controller = SecondViewController()
	controller.modalPresentationStyle = .Custom
	controller.transitioningDelegate = semiModelTransition
	presentViewController(controller, animated: true, completion: nil)
}
```



#### Gate Transition

```swift
private let gateTransition = GateTransition(sawtoothCount: 20, sawtoothDistance: 20)

override func viewDidLoad() {
	super.viewDidLoad()
    navigationController?.delegate = gateTransition
}
```



#### Circle Transition

```swift
private let circleTransition = CircleTransition()

override func viewDidLoad() {
	super.viewDidLoad()
    navigationController?.delegate = circleTransition
}
```



##Requirements
iOS 8.0+

Xcode 7.3+



## License

Released under the MIT license. See LICENSE for details.

