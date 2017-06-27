//
//  NavigatorViewController.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class NavigatorViewController: UIViewController {

    var model: EventModel? {
        didSet {
            if let shopLocaltion = model?.position?.stringToCLLocationCoordinate2D(",") {
                let point = MAPointAnnotation()
                point.coordinate = shopLocaltion
                self.mapView.addAnnotation(point)
                self.mapView.setCenterCoordinate(shopLocaltion, animated: true)
                self.mapView.setZoomLevel(15, animated: true)
            }
        }
    }
    
    var adressTitle: String?
    
    private lazy var mapView: MAMapView = {
        let mapView = MAMapView()
        mapView.frame = MainBounds
        mapView.delegate = self
        mapView.showsCompass = false
        mapView.showsScale = false
        mapView.showsUserLocation = true
        mapView.logoCenter.x = AppWidth - mapView.logoSize.width + 20
        mapView.setZoomLevel(14, animated: true)
        return mapView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        title = "位置"
        view.addSubview(mapView)
        print("MapView被销毁了")
    }
    
    deinit {
        mapView.showsUserLocation = false
        mapView.clearDisk()
    }

}

extension NavigatorViewController: MAMapViewDelegate {
    
    func mapView(mapView: MAMapView!, viewForAnnotation annotation: MAAnnotation!) -> MAAnnotationView! {
        if annotation.isKindOfClass(MAPointAnnotation.self) {
            var annot = mapView.dequeueReusableAnnotationViewWithIdentifier("point") as? CustomAnnotationView
            if annot == nil {
                annot = CustomAnnotationView(annotation: annotation, reuseIdentifier: "point") as CustomAnnotationView
            }
            annot!.userInteractionEnabled = false
            annot!.setSelected(true, animated: true)
            annot!.canShowCallout = false
            annot!.image = UIImage(named: "zuobiao1")
            annot!.center = CGPoint(x: 0, y: -(annot!.image.size.height * 0.5))
            annot!.calloutView?.adressTitle = model?.address
            return annot!
        }
        
        return nil
    }
}
