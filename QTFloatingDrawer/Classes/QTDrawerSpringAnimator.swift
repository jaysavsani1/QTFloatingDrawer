//
//  QTDrawerSpringAnimator.swift
//  FBSnapshotTestCase
//
//  Created by Quixom Technology on 13/11/17.
//

import UIKit


open class QTDrawerSpringAnimator: NSObject {
    
    let kQTCenterViewDestinationScale:CGFloat = 0.7
    
    open var animationDelay: TimeInterval        = 0.0
    open var animationDuration: TimeInterval     = 0.7
    open var initialSpringVelocity: CGFloat        = 9.8 // 9.1 m/s == earth gravity accel.
    open var springDamping: CGFloat                = 0.8
    
    fileprivate func applyTransforms(_ side: QTDrawerSide, drawerView: UIView, centerView: UIView) {
        
        let direction = side.rawValue
        let sideWidth = drawerView.bounds.width
        let centerWidth = centerView.bounds.width
        let centerHorizontalOffset = direction * sideWidth
        let scaledCenterViewHorizontalOffset = direction * (sideWidth - (centerWidth - kQTCenterViewDestinationScale * centerWidth) / 2.0)
        
        let sideTransform = CGAffineTransform(translationX: centerHorizontalOffset, y: 0.0)
        drawerView.transform = sideTransform
        
        let centerTranslate = CGAffineTransform(translationX: scaledCenterViewHorizontalOffset, y: 0.0)
        let centerScale = CGAffineTransform(scaleX: kQTCenterViewDestinationScale, y: kQTCenterViewDestinationScale)
        centerView.transform = centerScale.concatenating(centerTranslate)
        
    }
    
    fileprivate func resetTransforms(_ views: [UIView]) {
        for view in views {
            view.transform = CGAffineTransform.identity
        }
    }
}

extension QTDrawerSpringAnimator: QTDrawerAnimating {
    
    public func openDrawer(_ side: QTDrawerSide, drawerView: UIView, centerView: UIView, animated: Bool, complete:  @escaping (Bool) -> Void) {
        if (animated) {
            UIView.animate(withDuration: animationDuration,
                           delay: animationDelay,
                           usingSpringWithDamping: springDamping,
                           initialSpringVelocity: initialSpringVelocity,
                           options: UIViewAnimationOptions.curveLinear,
                           animations: {
                            self.applyTransforms(side, drawerView: drawerView, centerView: centerView)
                            
            }, completion: complete)
        } else {
            self.applyTransforms(side, drawerView: drawerView, centerView: centerView)
        }
    }
    
    public func dismissDrawer(_ side: QTDrawerSide, drawerView: UIView, centerView: UIView, animated: Bool, complete: @escaping (Bool) -> Void) {
        if (animated) {
            UIView.animate(withDuration: animationDuration,
                           delay: animationDelay,
                           usingSpringWithDamping: springDamping,
                           initialSpringVelocity: initialSpringVelocity,
                           options: UIViewAnimationOptions.curveLinear,
                           animations: {
                            self.resetTransforms([drawerView, centerView])
            }, completion: complete)
        } else {
            self.resetTransforms([drawerView, centerView])
        }
    }
    
    public func willRotateWithDrawerOpen(_ side: QTDrawerSide, drawerView: UIView, centerView: UIView) {
        
    }
    
    public func didRotateWithDrawerOpen(_ side: QTDrawerSide, drawerView: UIView, centerView: UIView) {
        UIView.animate(withDuration: animationDuration,
                       delay: animationDelay,
                       usingSpringWithDamping: springDamping,
                       initialSpringVelocity: initialSpringVelocity,
                       options: UIViewAnimationOptions.curveLinear,
                       animations: {}, completion: nil )
    }
}
