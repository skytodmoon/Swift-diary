//
//  ViewController.swift
//  ofo(小黄)
//
//  Created by 金亮齐 on 2017/5/24.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SWRevealViewController

class ViewController: UIViewController,MAMapViewDelegate,AMapSearchDelegate {
    
    var mapView: MAMapView!
    var search: AMapSearchAPI!
    var pin: MyPinAnnotation!
    var pinView: MAAnnotationView!
    var nearBySearch = true
    
    @IBOutlet weak var panelView: UIView!

    @IBAction func locationBtnTap(_ sender: UIButton) {
        searchBikeNearby()
    }
    
    //MARK: - 搜索周边的小黄车请求
    func searchBikeNearby(){
        searchCustomLocation(mapView.userLocation.coordinate)
    }
    func searchCustomLocation(_ center: CLLocationCoordinate2D) {
        let request = AMapPOIAroundSearchRequest()
        request.location = AMapGeoPoint.location(withLatitude: CGFloat(center.latitude), longitude: CGFloat(center.longitude))
        request.keywords = "餐馆"
        request.radius = 500
        request.requireExtension = true
        
        search.aMapPOIAroundSearch(request)
    }
    
    //MARK: - 大头针动画
    func pinAnimation(){
        let endFrame = pinView.frame
        pinView.frame = endFrame.offsetBy(dx: 0, dy: -15)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, animations: { 
            self.pinView.frame = endFrame
        }, completion: nil)
    }
    
    //MARK: - 动画
    func mapView(_ mapView: MAMapView!, didAddAnnotationViews views: [Any]!) {
        
        let aViews = views as! [MAAnnotationView]
        
        for aView in aViews {
            guard aView.annotation is MAPointAnnotation else {
                continue
            }
            aView.transform = CGAffineTransform(scaleX: 0, y: 0)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
                aView.transform = .identity
            }, completion: nil)
        
        }
    }
    
    //MARK: - 用户移动交互
    func mapView(_ mapView: MAMapView!, mapDidMoveByUser wasUserAction: Bool) {
        if wasUserAction{
            pin.isLockedToScreen = true
            pinAnimation()
            searchCustomLocation(mapView.centerCoordinate)
        }
    }
    
    
    //MARK: - 地图初始化
    func mapInitComplete(_ mapView: MAMapView!) {
        pin = MyPinAnnotation()
        pin.coordinate = mapView.centerCoordinate
        pin.lockedScreenPoint = CGPoint(x: view.bounds.width/2, y: view.bounds.height/2)
        pin.isLockedToScreen = true
        
        mapView.addAnnotation(pin)
        mapView.showAnnotations([pin], animated: true)
    }
    
    
    //MARK: - MapViewDelegate
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {
        //用户定义的位置，不需要自定义
        if annotation is MAUserLocation {
            return nil
        }
        
        if annotation is MyPinAnnotation {
            let reuseid = "anchor"
            var av = mapView.dequeueReusableAnnotationView(withIdentifier: reuseid)
            if av == nil {
                av = MAPinAnnotationView(annotation: annotation, reuseIdentifier: reuseid)
            }
            
            av?.image = #imageLiteral(resourceName: "homePage_wholeAnchor")
            av?.canShowCallout = false
            
            pinView = av
            return av
        }
        
        let reuseid = "myid"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseid) as? MAPinAnnotationView
        if annotationView == nil {
            annotationView = MAPinAnnotationView(annotation: annotation, reuseIdentifier: reuseid)
        }
        
        if annotation.title == "正常可用" {
            annotationView?.image = #imageLiteral(resourceName: "HomePage_nearbyBike")
        }else {
            annotationView?.image = #imageLiteral(resourceName: "HomePage_nearbyBikeRedPacket")
        }
        annotationView?.canShowCallout = true
        annotationView?.animatesDrop = true
        return annotationView
    }
    
    //MARK: - 搜索周边后完成的处理
    func onPOISearchDone(_ request: AMapPOISearchBaseRequest!, response: AMapPOISearchResponse!){
        if response.count == 0 {
            print("没有小黄车")
            return
        }
        var annotations : [MAPointAnnotation] = []
        
        annotations = response.pois.map{
            let annotation = MAPointAnnotation()
            
            annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees($0.location.latitude), longitude: CLLocationDegrees($0.location.longitude))
            
            if $0.distance < 400 {
                annotation.title = "红包区域内开锁任意小黄车"
                annotation.subtitle = "骑行10分钟获得任意现金红包"
            }else{
                annotation.title = "正常可用"
            }
            return annotation
        }
        
        mapView.addAnnotations(annotations)
        if nearBySearch {
            mapView.showAnnotations(annotations, animated: true)
            nearBySearch = !nearBySearch
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MAMapView(frame: view.bounds)
        view.addSubview(mapView)
        view.bringSubview(toFront: panelView)
        
        mapView.delegate = self
        mapView.zoomLevel = 17
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        
        search = AMapSearchAPI()
        search.delegate = self


        setNav()
        setupUI()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK: - 设置导航栏
    private func setNav(){
    
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ofoLogo"))
        self.navigationItem.leftBarButtonItem?.image = #imageLiteral(resourceName: "leftTopImage").withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "rightTopImage").withRenderingMode(.alwaysOriginal)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        if let revealVC = revealViewController() {
            revealVC.rearViewRevealWidth = 280
            navigationItem.leftBarButtonItem?.target = revealVC
            navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(revealVC.panGestureRecognizer())
        }
    }

    private func setupUI(){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

