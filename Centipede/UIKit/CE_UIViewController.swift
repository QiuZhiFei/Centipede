//
//  CE_UIViewController.swift
//  Centipede
//
//  Created by kelei on 2015/6/4.
//  Copyright (c) 2015年 kelei. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private var ce: UIViewController_Delegate {
        struct Static {
            static var AssociationKey: UInt8 = 0
        }
        if let obj = objc_getAssociatedObject(self, &Static.AssociationKey) as? UIViewController_Delegate {
            return obj
        }
        if let delegate = self.transitioningDelegate {
            if delegate is UIViewController_Delegate {
                return delegate as! UIViewController_Delegate
            }
        }
        let delegate = getDelegateInstance()
        objc_setAssociatedObject(self, &Static.AssociationKey, delegate, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
        return delegate
    }
    
    private func rebindingDelegate() {
        let delegate = ce
        self.transitioningDelegate = nil
        self.transitioningDelegate = delegate
    }
    
    internal func getDelegateInstance() -> UIViewController_Delegate {
        return UIViewController_Delegate()
    }
    
    public func ce_animationControllerForPresentedController(handle: (presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?) -> Self {
        ce._animationControllerForPresentedController = handle
        rebindingDelegate()
        return self
    }
    public func ce_animationControllerForDismissedController(handle: (dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?) -> Self {
        ce._animationControllerForDismissedController = handle
        rebindingDelegate()
        return self
    }
    public func ce_interactionControllerForPresentation(handle: (animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?) -> Self {
        ce._interactionControllerForPresentation = handle
        rebindingDelegate()
        return self
    }
    public func ce_interactionControllerForDismissal(handle: (animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?) -> Self {
        ce._interactionControllerForDismissal = handle
        rebindingDelegate()
        return self
    }
    public func ce_presentationControllerForPresented(handle: (presented: UIViewController, presenting: UIViewController!, source: UIViewController) -> UIPresentationController?) -> Self {
        ce._presentationControllerForPresented = handle
        rebindingDelegate()
        return self
    }
    
}

internal class UIViewController_Delegate: NSObject, UIViewControllerTransitioningDelegate {
    
    var _animationControllerForPresentedController: ((UIViewController, UIViewController, UIViewController) -> UIViewControllerAnimatedTransitioning?)?
    var _animationControllerForDismissedController: ((UIViewController) -> UIViewControllerAnimatedTransitioning?)?
    var _interactionControllerForPresentation: ((UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?)?
    var _interactionControllerForDismissal: ((UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?)?
    var _presentationControllerForPresented: ((UIViewController, UIViewController!, UIViewController) -> UIPresentationController?)?
    
    
    override func respondsToSelector(aSelector: Selector) -> Bool {
        
        let funcDic1: [Selector : Any?] = [
            "animationControllerForPresentedController:presentingController:sourceController:" : _animationControllerForPresentedController,
            "animationControllerForDismissedController:" : _animationControllerForDismissedController,
            "interactionControllerForPresentation:" : _interactionControllerForPresentation,
            "interactionControllerForDismissal:" : _interactionControllerForDismissal,
            "presentationControllerForPresentedViewController:presentingViewController:sourceViewController:" : _presentationControllerForPresented,
        ]
        if let f = funcDic1[aSelector] {
            return f != nil
        }
        
        return super.respondsToSelector(aSelector)
    }
    
    
    @objc func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return _animationControllerForPresentedController!(presented, presenting, source)
    }
    @objc func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return _animationControllerForDismissedController!(dismissed)
    }
    @objc func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return _interactionControllerForPresentation!(animator)
    }
    @objc func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return _interactionControllerForDismissal!(animator)
    }
    @objc func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController!, sourceViewController source: UIViewController) -> UIPresentationController? {
        return _presentationControllerForPresented!(presented, presenting, source)
    }
}
