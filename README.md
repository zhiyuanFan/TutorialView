# TutorialView
A view that can show some new features in your app to others.

# ScreenShot
![image](https://github.com/zhiyuanFan/TutorialView/raw/master/screenshot.gif)

# Usage
```
let model = TutorialModel()
model.centerPoint = CGPoint(x: screenW/2, y: screenH - 60)
model.radius = 30.0
model.towards = LineDirection.up
model.title = "这是向上的引导效果"
let _ = TutorialView(model: model!)
```

```
let model = TutorialModel()
model.centerPoint = CGPoint(x: screenW/2, y: screenH - 60)
model.size = CGSize(width: 60, height: 30)
model.towards = LineDirection.up
model.title = "这是向上的引导效果"
let _ = TutorialRectView(model: model!)
```


# Shape
There are two shape to highlight your item for your tutorial walkthrough: cycle & Rect

when you're using TutorialView or TutorialRectView, you should initial with a model which type is TutorialModel.

 * TutorialView need radius, centerPoint, title, towards(LineDirection Type), its size depends on radius.

 * TutorialRectView need size, centerPoint, title, towards(LineDirection Type), you can change the size of TutorialRectView by passing different size.
 
 

# TutorialModel
```
class TutorialModel {
    var centerPoint: CGPoint?
    var radius: CGFloat?
    var towards: LineDirection?
    var title: String?
    var size: CGSize?
}
```

# Direction
```
public enum LineDirection {
    case up
    case down
    case left
    case right
    case leftDown
    case rightDown
}
```

# Dependency
[snapKit](https://github.com/SnapKit/SnapKit) for Auto Layout




