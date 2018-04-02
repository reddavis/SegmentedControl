# Segmented Control

Table Data is super flexible framework for building complicated table views.

![](https://storage.jumpshare.com/preview/fLXfvRbg7pNCnPBWqId0LiKsY_JTwh0hXF0X-cjtMDSoClePxdmudxDHz1Ab8t6iiGCFE7nw8BdJIsJsfG_BIVNlSmh0egFbdyHzE6LvoMAI4av1wcwKsmUDuTGzHRrg)

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