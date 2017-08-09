# TutorialView
A view that can show some new features in your app to others.


# Shape
There are two shape to highlight your item for your tutorial walkthrough: cycle & Rect

when you're using TutorialView or TutorialRectView, you should initial with a model which type is TutorialModel.

 * TutorialView need radius, centerPoint, title, towards(LineDirection Type), its size depends on radius.

 * TutorialRectView need size, centerPoint, title, towards(LineDirection Type), you can change the size of TutorialRectView by passing different size.

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


![image](https://github.com/zhiyuanFan/TutorialView/raw/master/screenshot.gif)
