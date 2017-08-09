//
//  TutorialView.swift
//  TestFillRule
//
//  Created by Jason Fan on 07/08/2017.
//  Copyright © 2017 QooApp. All rights reserved.
//

import UIKit
import SnapKit

class TutorialRectView: UIView {
    
    var model: TutorialModel = TutorialModel()
    var lineView: UIImageView?
    var titleLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(model: TutorialModel) {
        
        let initFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.init(frame: initFrame)
        
        self.model = model
        
        setupSubViews()
    }
    
    func setupSubViews() {
        self.backgroundColor = UIColor.clear
        
        let sview = UIView(frame: frame)
        sview.backgroundColor = UIColor.clear
        self.addSubview(sview)
        
        
        let rectW: CGFloat = (model.size?.width)!, rectH: CGFloat = (model.size?.height)!
        let centerX = (model.centerPoint?.x)!
        let centerY = (model.centerPoint?.y)!
        let rectFrame = CGRect(x: centerX - rectW/2, y: centerY - rectH/2, width: rectW, height: rectH)
        
        let path = UIBezierPath(roundedRect: rectFrame, cornerRadius: 5)
        let rectPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: sview.frame.size.width, height: sview.frame.size.height))
        rectPath.append(path)
        
        let maskLayer = CAShapeLayer()
        maskLayer.fillRule = kCAFillRuleEvenOdd
        maskLayer.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        maskLayer.path = rectPath.cgPath
        
        sview.layer.addSublayer(maskLayer)
        
        var imageNameStr: String
        var alignment: NSTextAlignment = .left
        switch model.towards! {
        case .up:
            imageNameStr = "upLine"
            alignment = .center
        case .down:
            imageNameStr = "downLine"
            alignment = .center
        case .left:
            imageNameStr = "leftLine"
        case .right:
            imageNameStr = "rightLine"
        case .leftDown:
            imageNameStr = "leftDownLine"
            alignment = .right
        case .rightDown:
            imageNameStr = "rightDownLine"
        }
        
        lineView = UIImageView()
        lineView?.image = getLineImage(imageName: imageNameStr)
        sview.addSubview(lineView!)
        
        titleLabel = UILabel()
        titleLabel?.text = model.title!
        titleLabel?.textAlignment = alignment
        titleLabel?.numberOfLines = 0
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.textColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1)
        self.addSubview(titleLabel!)
        
        
        let window = UIApplication.shared.keyWindow
        window?.addSubview(self)
        
        setupUI()
    }
    
    func setupUI() {
        
        let centerX = (model.centerPoint?.x)!
        let centerY = (model.centerPoint?.y)!
        let rectW = (model.size?.width)!, rectH = (model.size?.height)!
        let isCloseToLeft: Bool = centerX < UIScreen.main.bounds.size.width/2
        let vHeight: CGFloat = 90.0; let vWidth: CGFloat = 20.0
        let hHeight: CGFloat = 30;   let hWidth: CGFloat = 80.0

        
        switch model.towards! {
        case .up:
            lineView?.snp.makeConstraints({ (make) in
                make.top.equalTo(centerY-rectH/2-vHeight)
                make.centerX.equalTo(centerX)
                make.size.equalTo(CGSize(width: vWidth, height: vHeight))
            })
            
            titleLabel?.snp.makeConstraints({ (make) in
                make.centerX.equalTo(centerX)
                make.bottom.equalTo((lineView?.snp.top)!)
                if isCloseToLeft {
                    make.left.equalTo(10)
                } else {
                    make.right.equalTo(-10)
                }
            })
        case .down:
            lineView?.snp.makeConstraints({ (make) in
                make.top.equalTo(centerY+rectH/2)
                make.centerX.equalTo(centerX)
                make.size.equalTo(CGSize(width: vWidth, height: vHeight))
            })
            
            titleLabel?.snp.makeConstraints({ (make) in
                make.top.equalTo((lineView?.snp.bottom)!)
                make.centerX.equalTo(centerX)
                if isCloseToLeft {
                    make.left.equalTo(10)
                } else {
                    make.right.equalTo(-10)
                }
            })
        case .left:
            lineView?.snp.makeConstraints({ (make) in
                make.left.equalTo(centerX-rectW/2-hWidth)
                make.top.equalTo(centerY-rectH/2-hHeight)
                make.size.equalTo(CGSize(width: hWidth, height: hHeight))
            })
            
            titleLabel?.snp.makeConstraints({ (make) in
                make.right.equalTo((lineView?.snp.left)!).offset(-5)
                make.left.equalTo(10)
                make.centerY.equalTo((lineView?.snp.top)!).offset(5)
            })
        case .right:
            lineView?.snp.makeConstraints({ (make) in
                make.left.equalTo(centerX+rectW/2)
                make.top.equalTo(centerY-rectH/2-hHeight)
                make.size.equalTo(CGSize(width: hWidth, height: hHeight))
            })
            
            titleLabel?.snp.makeConstraints({ (make) in
                make.left.equalTo((lineView?.snp.right)!).offset(5)
                make.right.equalTo(-10)
                make.centerY.equalTo((lineView?.snp.top)!).offset(5)
            })
            
        case .leftDown:
            lineView?.snp.makeConstraints({ (make) in
                make.left.equalTo(centerX-rectW/2-hWidth)
                make.top.equalTo(centerY+rectH/2)
                make.size.equalTo(CGSize(width: hWidth, height: hHeight))
            })
            
            titleLabel?.snp.makeConstraints({ (make) in
                make.right.equalTo((lineView?.snp.left)!).offset(-5)
                make.left.equalTo(10)
                make.centerY.equalTo((lineView?.snp.bottom)!).offset(-5)
            })
        case .rightDown:
            lineView?.snp.makeConstraints({ (make) in
                make.left.equalTo(centerX+rectW/2)
                make.top.equalTo(centerY+rectH/2)
                make.size.equalTo(CGSize(width: hWidth, height: hHeight))
            })
            
            titleLabel?.snp.makeConstraints({ (make) in
                make.left.equalTo((lineView?.snp.right)!).offset(5)
                make.right.equalTo(-10)
                make.centerY.equalTo((lineView?.snp.bottom)!).offset(-5)
            })
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeFromSuperview()
    }
    
    func getLineImage(imageName: String) -> UIImage {
        let imageStr = "LineDirection.bundle/Images/\(imageName)"
        return UIImage(named: imageStr)!
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
