//
//  CE_MKMapView.swift
//  Centipede
//
//  Created by kelei on 2016/9/13.
//  Copyright (c) 2016年 kelei. All rights reserved.
//

import MapKit

public extension MKMapView {
    
    private struct Static { static var AssociationKey: UInt8 = 0 }
    private var _delegate: MKMapView_Delegate? {
        get { return objc_getAssociatedObject(self, &Static.AssociationKey) as? MKMapView_Delegate }
        set { objc_setAssociatedObject(self, &Static.AssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN) }
    }
    
    private var ce: MKMapView_Delegate {
        if let obj = _delegate {
            return obj
        }
        if let obj: AnyObject = self.delegate {
            if obj is MKMapView_Delegate {
                return obj as! MKMapView_Delegate
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
    
    internal func getDelegateInstance() -> MKMapView_Delegate {
        return MKMapView_Delegate()
    }
    
    public func ce_mapView(handle: ((MKMapView, Bool) -> Void)) -> Self {
        ce._mapView = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapView_regionDidChangeAnimated(handle: ((MKMapView, Bool) -> Void)) -> Self {
        ce._mapView_regionDidChangeAnimated = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapViewWillStartLoadingMap(handle: ((MKMapView) -> Void)) -> Self {
        ce._mapViewWillStartLoadingMap = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapViewDidFinishLoadingMap(handle: ((MKMapView) -> Void)) -> Self {
        ce._mapViewDidFinishLoadingMap = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapViewDidFailLoadingMap(handle: ((MKMapView, Error) -> Void)) -> Self {
        ce._mapViewDidFailLoadingMap = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapViewWillStartRenderingMap(handle: ((MKMapView) -> Void)) -> Self {
        ce._mapViewWillStartRenderingMap = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapViewDidFinishRenderingMap(handle: ((MKMapView, Bool) -> Void)) -> Self {
        ce._mapViewDidFinishRenderingMap = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapView_viewFor(handle: ((MKMapView, MKAnnotation) -> MKAnnotationView?)) -> Self {
        ce._mapView_viewFor = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapView_didAdd(handle: ((MKMapView, [MKAnnotationView]) -> Void)) -> Self {
        ce._mapView_didAdd = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapView_annotationView(handle: ((MKMapView, MKAnnotationView, UIControl) -> Void)) -> Self {
        ce._mapView_annotationView = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapView_didSelect(handle: ((MKMapView, MKAnnotationView) -> Void)) -> Self {
        ce._mapView_didSelect = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapView_didDeselect(handle: ((MKMapView, MKAnnotationView) -> Void)) -> Self {
        ce._mapView_didDeselect = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapViewWillStartLocatingUser(handle: ((MKMapView) -> Void)) -> Self {
        ce._mapViewWillStartLocatingUser = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapViewDidStopLocatingUser(handle: ((MKMapView) -> Void)) -> Self {
        ce._mapViewDidStopLocatingUser = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapView_didUpdate(handle: ((MKMapView, MKUserLocation) -> Void)) -> Self {
        ce._mapView_didUpdate = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapView_didFailToLocateUserWithError(handle: ((MKMapView, Error) -> Void)) -> Self {
        ce._mapView_didFailToLocateUserWithError = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapView_annotationView_annotationView(handle: ((MKMapView, MKAnnotationView, MKAnnotationViewDragState, MKAnnotationViewDragState) -> Void)) -> Self {
        ce._mapView_annotationView_annotationView = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapView_didChange(handle: ((MKMapView, MKUserTrackingMode, Bool) -> Void)) -> Self {
        ce._mapView_didChange = handle
        rebindingDelegate()
        return self
    }
    public func ce_mapView_rendererFor(handle: ((MKMapView, MKOverlay) -> MKOverlayRenderer)) -> Self {
        ce._mapView_rendererFor = handle
        rebindingDelegate()
        return self
    }
    
}

internal class MKMapView_Delegate: NSObject, MKMapViewDelegate {
    
    var _mapView: ((MKMapView, Bool) -> Void)?
    var _mapView_regionDidChangeAnimated: ((MKMapView, Bool) -> Void)?
    var _mapViewWillStartLoadingMap: ((MKMapView) -> Void)?
    var _mapViewDidFinishLoadingMap: ((MKMapView) -> Void)?
    var _mapViewDidFailLoadingMap: ((MKMapView, Error) -> Void)?
    var _mapViewWillStartRenderingMap: ((MKMapView) -> Void)?
    var _mapViewDidFinishRenderingMap: ((MKMapView, Bool) -> Void)?
    var _mapView_viewFor: ((MKMapView, MKAnnotation) -> MKAnnotationView?)?
    var _mapView_didAdd: ((MKMapView, [MKAnnotationView]) -> Void)?
    var _mapView_annotationView: ((MKMapView, MKAnnotationView, UIControl) -> Void)?
    var _mapView_didSelect: ((MKMapView, MKAnnotationView) -> Void)?
    var _mapView_didDeselect: ((MKMapView, MKAnnotationView) -> Void)?
    var _mapViewWillStartLocatingUser: ((MKMapView) -> Void)?
    var _mapViewDidStopLocatingUser: ((MKMapView) -> Void)?
    var _mapView_didUpdate: ((MKMapView, MKUserLocation) -> Void)?
    var _mapView_didFailToLocateUserWithError: ((MKMapView, Error) -> Void)?
    var _mapView_annotationView_annotationView: ((MKMapView, MKAnnotationView, MKAnnotationViewDragState, MKAnnotationViewDragState) -> Void)?
    var _mapView_didChange: ((MKMapView, MKUserTrackingMode, Bool) -> Void)?
    var _mapView_rendererFor: ((MKMapView, MKOverlay) -> MKOverlayRenderer)?
    
    
    override func responds(to aSelector: Selector!) -> Bool {
        
        let funcDic1: [Selector : Any?] = [
            #selector(mapView(_:regionWillChangeAnimated:)) : _mapView,
            #selector(mapView(_:regionDidChangeAnimated:)) : _mapView_regionDidChangeAnimated,
            #selector(mapViewWillStartLoadingMap(_:)) : _mapViewWillStartLoadingMap,
            #selector(mapViewDidFinishLoadingMap(_:)) : _mapViewDidFinishLoadingMap,
            #selector(mapViewDidFailLoadingMap(_:withError:)) : _mapViewDidFailLoadingMap,
            #selector(mapViewWillStartRenderingMap(_:)) : _mapViewWillStartRenderingMap,
            #selector(mapViewDidFinishRenderingMap(_:fullyRendered:)) : _mapViewDidFinishRenderingMap,
        ]
        if let f = funcDic1[aSelector] {
            return f != nil
        }
        
        let funcDic2: [Selector : Any?] = [
            #selector(mapView(_:viewFor:)) : _mapView_viewFor,
            #selector(mapView(_:didAdd:)) : _mapView_didAdd,
            #selector(mapView(_:annotationView:calloutAccessoryControlTapped:)) : _mapView_annotationView,
            #selector(mapView(_:didSelect:)) : _mapView_didSelect,
            #selector(mapView(_:didDeselect:)) : _mapView_didDeselect,
            #selector(mapViewWillStartLocatingUser(_:)) : _mapViewWillStartLocatingUser,
            #selector(mapViewDidStopLocatingUser(_:)) : _mapViewDidStopLocatingUser,
        ]
        if let f = funcDic2[aSelector] {
            return f != nil
        }
        
        let funcDic3: [Selector : Any?] = [
            #selector(mapView(_:didUpdate:)) : _mapView_didUpdate,
            #selector(mapView(_:didFailToLocateUserWithError:)) : _mapView_didFailToLocateUserWithError,
            #selector(mapView(_:annotationView:didChange:fromOldState:)) : _mapView_annotationView_annotationView,
            #selector(mapView(_:didChange:animated:)) : _mapView_didChange,
            #selector(mapView(_:rendererFor:)) : _mapView_rendererFor,
        ]
        if let f = funcDic3[aSelector] {
            return f != nil
        }
        
        return super.responds(to: aSelector)
    }
    
    
    @objc func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        _mapView!(mapView, animated)
    }
    @objc func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        _mapView_regionDidChangeAnimated!(mapView, animated)
    }
    @objc func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        _mapViewWillStartLoadingMap!(mapView)
    }
    @objc func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        _mapViewDidFinishLoadingMap!(mapView)
    }
    @objc func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
        _mapViewDidFailLoadingMap!(mapView, error)
    }
    @objc func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        _mapViewWillStartRenderingMap!(mapView)
    }
    @objc func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        _mapViewDidFinishRenderingMap!(mapView, fullyRendered)
    }
    @objc func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        return _mapView_viewFor!(mapView, annotation)
    }
    @objc func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        _mapView_didAdd!(mapView, views)
    }
    @objc func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        _mapView_annotationView!(mapView, view, control)
    }
    @objc func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        _mapView_didSelect!(mapView, view)
    }
    @objc func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        _mapView_didDeselect!(mapView, view)
    }
    @objc func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
        _mapViewWillStartLocatingUser!(mapView)
    }
    @objc func mapViewDidStopLocatingUser(_ mapView: MKMapView) {
        _mapViewDidStopLocatingUser!(mapView)
    }
    @objc func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        _mapView_didUpdate!(mapView, userLocation)
    }
    @objc func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
        _mapView_didFailToLocateUserWithError!(mapView, error)
    }
    @objc func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        _mapView_annotationView_annotationView!(mapView, view, newState, oldState)
    }
    @objc func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool) {
        _mapView_didChange!(mapView, mode, animated)
    }
    @objc func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        return _mapView_rendererFor!(mapView, overlay)
    }
}
