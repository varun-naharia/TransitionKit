//
//  CircleTransition.swift
//  TransitionKit
//
//  Created by CP3 on 16/8/3.
//  Copyright © 2016年 CP3. All rights reserved.
//

import UIKit

public class CircleTransition: NSObject, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    
    private var animator = CircleAnimatedTransitioning()
    
    public init(duration: NSTimeInterval = 0.3) {
        super.init()
        animator.duration = duration
    }
    
    public func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if presenting is CircleTransitionClicked {
            return animator
        }
        
        return nil
    }
    
    public func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if dismissed is CircleTransitionClicked {
            return animator
        }
        
        return nil
    }
    
    public func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if (operation == .Push && fromVC is CircleTransitionClicked) || (operation == .Pop && toVC is CircleTransitionClicked) {
            return animator
        }
        
        return nil
    }
}