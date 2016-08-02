//
//  GateAnimatedTransitioning.swift
//  TransitionKit
//
//  Created by CP3 on 16/8/2.
//  Copyright © 2016年 CP3. All rights reserved.
//

import UIKit

public class GateAnimatedTransitioning: BaseAnimatedTransitioning {
    private let sawtoothCount: Int
    private let sawtoothDistance: CGFloat
    private let scale: CGFloat = 0.5
    
    public init(sawtoothCount: Int, sawtoothDistance: CGFloat) {
        self.sawtoothCount = sawtoothCount
        self.sawtoothDistance = sawtoothDistance
        
        super.init()
    }
    
    public override func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let containerView = transitionContext.containerView()!
        let view = !dismiss ? fromVC.view : toVC.view
        
        let array: [UIView] = view.splitIntoTwoSawtoothParts(distance: sawtoothDistance, count: sawtoothCount)
        let leftView: UIView = array[0]
        let rightView: UIView = array[1]
        containerView.addSubview(leftView)
        containerView.addSubview(rightView)
        if !dismiss {
            fromVC.view.alpha = 0
            toVC.view.transform = CGAffineTransformMakeScale(scale, scale)
            containerView.addSubview(toVC.view)
            containerView.sendSubviewToBack(toVC.view)
        }
        let leftFrame = leftView.frame
        let leftOffScreenFrame = CGRectOffset(leftView.bounds, -leftView.bounds.width/2 - 20, 0)
        let rightFrame = rightView.frame
        let rightOffScreenFrame = CGRectOffset(rightView.bounds, rightView.bounds.width/2 + 20, 0)
        let leftInitialFrame = !dismiss ? leftFrame : leftOffScreenFrame
        let leftFinalFrame = !dismiss ? leftOffScreenFrame : leftFrame
        let rightInitialFrame = !dismiss ? rightFrame : rightOffScreenFrame
        let rightFinalFrame = !dismiss ? rightOffScreenFrame : rightFrame
        leftView.frame = leftInitialFrame
        rightView.frame = rightInitialFrame
        
        let duration = transitionDuration(transitionContext)
        UIView.animateWithDuration(duration, delay: 0, options: .CurveEaseInOut, animations: {
            leftView.frame = leftFinalFrame
            rightView.frame = rightFinalFrame
            if !self.dismiss {
                toVC.view.transform = CGAffineTransformIdentity
            } else {
                fromVC.view.transform = CGAffineTransformMakeScale(self.scale, self.scale)
            }
            }, completion: { _ in
                leftView.removeFromSuperview()
                rightView.removeFromSuperview()
                if !self.dismiss {
                    fromVC.view.alpha = 1.0
                } else {
                    containerView.addSubview(toVC.view)
                    fromVC.view.transform = CGAffineTransformIdentity
                    
                }
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
    }
}