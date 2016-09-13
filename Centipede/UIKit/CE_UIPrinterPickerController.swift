//
//  CE_UIPrinterPickerController.swift
//  Centipede
//
//  Created by kelei on 2016/9/13.
//  Copyright (c) 2016年 kelei. All rights reserved.
//

import UIKit

public extension UIPrinterPickerController {
    
    private struct Static { static var AssociationKey: UInt8 = 0 }
    private var _delegate: UIPrinterPickerController_Delegate? {
        get { return objc_getAssociatedObject(self, &Static.AssociationKey) as? UIPrinterPickerController_Delegate }
        set { objc_setAssociatedObject(self, &Static.AssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN) }
    }
    
    private var ce: UIPrinterPickerController_Delegate {
        if let obj = _delegate {
            return obj
        }
        if let obj: AnyObject = self.delegate {
            if obj is UIPrinterPickerController_Delegate {
                return obj as! UIPrinterPickerController_Delegate
            }
        }
        let obj = getDelegateInstance()
        _delegate = obj
        return obj
    }
    
    private func rebindingDelegate() {
        let delegate = ce
        self.delegate = nil
        self.delegate = delegate
    }
    
    internal func getDelegateInstance() -> UIPrinterPickerController_Delegate {
        return UIPrinterPickerController_Delegate()
    }
    
    public func ce_printerPickerControllerParentViewController(handle: ((UIPrinterPickerController) -> UIViewController?)) -> Self {
        ce._printerPickerControllerParentViewController = handle
        rebindingDelegate()
        return self
    }
    public func ce_printerPickerController(handle: ((UIPrinterPickerController, UIPrinter) -> Bool)) -> Self {
        ce._printerPickerController = handle
        rebindingDelegate()
        return self
    }
    public func ce_printerPickerControllerWillPresent(handle: ((UIPrinterPickerController) -> Void)) -> Self {
        ce._printerPickerControllerWillPresent = handle
        rebindingDelegate()
        return self
    }
    public func ce_printerPickerControllerDidPresent(handle: ((UIPrinterPickerController) -> Void)) -> Self {
        ce._printerPickerControllerDidPresent = handle
        rebindingDelegate()
        return self
    }
    public func ce_printerPickerControllerWillDismiss(handle: ((UIPrinterPickerController) -> Void)) -> Self {
        ce._printerPickerControllerWillDismiss = handle
        rebindingDelegate()
        return self
    }
    public func ce_printerPickerControllerDidDismiss(handle: ((UIPrinterPickerController) -> Void)) -> Self {
        ce._printerPickerControllerDidDismiss = handle
        rebindingDelegate()
        return self
    }
    public func ce_printerPickerControllerDidSelectPrinter(handle: ((UIPrinterPickerController) -> Void)) -> Self {
        ce._printerPickerControllerDidSelectPrinter = handle
        rebindingDelegate()
        return self
    }
    
}

internal class UIPrinterPickerController_Delegate: NSObject, UIPrinterPickerControllerDelegate {
    
    var _printerPickerControllerParentViewController: ((UIPrinterPickerController) -> UIViewController?)?
    var _printerPickerController: ((UIPrinterPickerController, UIPrinter) -> Bool)?
    var _printerPickerControllerWillPresent: ((UIPrinterPickerController) -> Void)?
    var _printerPickerControllerDidPresent: ((UIPrinterPickerController) -> Void)?
    var _printerPickerControllerWillDismiss: ((UIPrinterPickerController) -> Void)?
    var _printerPickerControllerDidDismiss: ((UIPrinterPickerController) -> Void)?
    var _printerPickerControllerDidSelectPrinter: ((UIPrinterPickerController) -> Void)?
    
    
    override func responds(to aSelector: Selector!) -> Bool {
        
        let funcDic1: [Selector : Any?] = [
            #selector(printerPickerControllerParentViewController(_:)) : _printerPickerControllerParentViewController,
            #selector(printerPickerController(_:shouldShow:)) : _printerPickerController,
            #selector(printerPickerControllerWillPresent(_:)) : _printerPickerControllerWillPresent,
            #selector(printerPickerControllerDidPresent(_:)) : _printerPickerControllerDidPresent,
            #selector(printerPickerControllerWillDismiss(_:)) : _printerPickerControllerWillDismiss,
            #selector(printerPickerControllerDidDismiss(_:)) : _printerPickerControllerDidDismiss,
            #selector(printerPickerControllerDidSelectPrinter(_:)) : _printerPickerControllerDidSelectPrinter,
        ]
        if let f = funcDic1[aSelector] {
            return f != nil
        }
        
        return super.responds(to: aSelector)
    }
    
    
    @objc func printerPickerControllerParentViewController(_ printerPickerController: UIPrinterPickerController) -> UIViewController? {
        return _printerPickerControllerParentViewController!(printerPickerController)
    }
    @objc func printerPickerController(_ printerPickerController: UIPrinterPickerController, shouldShow printer: UIPrinter) -> Bool {
        return _printerPickerController!(printerPickerController, printer)
    }
    @objc func printerPickerControllerWillPresent(_ printerPickerController: UIPrinterPickerController) {
        _printerPickerControllerWillPresent!(printerPickerController)
    }
    @objc func printerPickerControllerDidPresent(_ printerPickerController: UIPrinterPickerController) {
        _printerPickerControllerDidPresent!(printerPickerController)
    }
    @objc func printerPickerControllerWillDismiss(_ printerPickerController: UIPrinterPickerController) {
        _printerPickerControllerWillDismiss!(printerPickerController)
    }
    @objc func printerPickerControllerDidDismiss(_ printerPickerController: UIPrinterPickerController) {
        _printerPickerControllerDidDismiss!(printerPickerController)
    }
    @objc func printerPickerControllerDidSelectPrinter(_ printerPickerController: UIPrinterPickerController) {
        _printerPickerControllerDidSelectPrinter!(printerPickerController)
    }
}
