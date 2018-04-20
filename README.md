# Segmented Control

![](https://cdn-pro.dprcdn.net/files/acc_153136/ZFBpkW)

## Install

### Carthage

```
github "reddavis/SegmentedControl”
```

## Example

```swift
let segmentedControl = SegmentedControl()
segmentedControl.tintColor = UIColor.blue
segmentedControl.addButton(title: "Button A")
segmentedControl.addButton(title: "Button B")
segmentedControl.addButton(title: "Button C")
segmentedControl.addTarget(self, action: #selector(self.segmentedControlValueDidChange(_:)), for: .valueChanged)
self.view.addSubview(segmentedControl)
```

## License

[MIT License](http://www.opensource.org/licenses/MIT).
