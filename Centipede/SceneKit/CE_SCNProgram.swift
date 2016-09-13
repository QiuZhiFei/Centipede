//
//  CE_SCNProgram.swift
//  Centipede
//
//  Created by kelei on 2016/9/13.
//  Copyright (c) 2016年 kelei. All rights reserved.
//

import SceneKit

public extension SCNProgram {
    
    private struct Static { static var AssociationKey: UInt8 = 0 }
    private var _delegate: SCNProgram_Delegate? {
        get { return objc_getAssociatedObject(self, &Static.AssociationKey) as? SCNProgram_Delegate }
        set { objc_setAssociatedObject(self, &Static.AssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN) }
    }
    
    private var ce: SCNProgram_Delegate {
        if let obj = _delegate {
            return obj
        }
        if let obj: AnyObject = self.delegate {
            if obj is SCNProgram_Delegate {
                return obj as! SCNProgram_Delegate
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
    
    internal func getDelegateInstance() -> SCNProgram_Delegate {
        return SCNProgram_Delegate()
    }
    
    public func ce_program(handle: ((SCNProgram, Error) -> Void)) -> Self {
        ce._program = handle
        rebindingDelegate()
        return self
    }
    
}

internal class SCNProgram_Delegate: NSObject, SCNProgramDelegate {
    
    var _program: ((SCNProgram, Error) -> Void)?
    
    
    override func responds(to aSelector: Selector!) -> Bool {
        
        let funcDic1: [Selector : Any?] = [
            #selector(program(_:handleError:)) : _program,
        ]
        if let f = funcDic1[aSelector] {
            return f != nil
        }
        
        return super.responds(to: aSelector)
    }
    
    
    @objc func program(_ program: SCNProgram, handleError error: Error) {
        _program!(program, error)
    }
}
