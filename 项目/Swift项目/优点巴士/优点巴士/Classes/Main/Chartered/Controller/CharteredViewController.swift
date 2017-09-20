//
//  CharteredViewController.swift
//  
//
//  Created by 金亮齐 on 2017/9/20.
//
//

import UIKit
import MapKit

private let CharteredCellID = "CharteredCellID"

class CharteredViewController: UIViewController,MAMapViewDelegate, AMapSearchDelegate,UISearchBarDelegate {
    
    
    @IBOutlet weak var midView: UIView!
    @IBOutlet weak var mainViews: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var tapLocationBut: UIButton!
    
    
    var mapView: MAMapView!
    var dataArray: NSMutableArray!
    var searchDataArray: NSMutableArray!
    var currentLocation: CLLocation!
    var search: AMapSearchAPI!
    
    var didStopLocating:Bool = false
    var _searchResult:UITableView?
    
    
    var searchResult: UITableView? {
        
        get{
            if _searchResult != nil {
                if !self.mainViews.isDescendant(of: _searchResult!) {
                    self.mainViews.addSubview(_searchResult!)
                }
            }else {
                DispatchQueue.global().async {
                    self._searchResult = UITableView.init(frame: self.mainViews.bounds)
                    self._searchResult?.register(UINib.init(nibName: "tableViewCell", bundle: nil), forCellReuseIdentifier: "tableViewCellID")
                    self._searchResult?.delegate = self
                    self._searchResult?.dataSource = self
                    self._searchResult?.tag = 10
                    DispatchQueue.main.async {
                        self.mainViews.addSubview(self._searchResult!)
                        self.mainViews.bringSubview(toFront:self._searchResult!)
                    }
                }
            }
            
            return _searchResult
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "tableViewCell", bundle: nil), forCellReuseIdentifier: "tableViewCellID")
        dataArray = NSMutableArray()
        searchDataArray = NSMutableArray()
        initSearch()
        initMapView()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    //MARK:- Initialization - 初始化操作
    func initMapView() {
        mapView = MAMapView(frame: self.midView.bounds)
        mapView.showsCompass = false
        mapView.zoomLevel = 15.1
        mapView.distanceFilter = 100.0
        
        mapView.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//        mapView.isShowsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.showsScale = false
        mapView.logoCenter = CGPoint(x: self.mapView.frame.size.width-mapView.logoSize.width + 25, y: self.mapView.frame.size.height-mapView.logoSize.height+5)
        mapView.mapType = .standard
        mapView.delegate = self
        self.midView.addSubview(mapView)
        self.midView.bringSubview(toFront: self.arrowImageView)
        self.midView.bringSubview(toFront: self.tapLocationBut)

    }
    
    func setMapView() {
        
    }
    
    
    func initSearch() {
        search = AMapSearchAPI()
        search.delegate = self
    }
    
    func initSearChs() {
        if currentLocation == nil || search == nil {
            return
        }
        
        searchPOI(loca: currentLocation)
    }
    
    //MARK:- searchPOI By CLLocation  根据地理坐标搜索
    func searchPOI(loca:CLLocation) {
        let request = AMapPOIAroundSearchRequest()
        request.location = AMapGeoPoint.location(withLatitude: CGFloat(loca.coordinate.latitude), longitude: CGFloat(loca.coordinate.longitude))
        request.types = "风景名胜|商务住宅|政府机构及社会团体|交通设施服务|道路附属设施|地名地址信息|高等院校"
        request.sortrule = 0
        request.offset = 30
        request.requireExtension = true
        search.aMapPOIAroundSearch(request)
    }
    
    //MARK:- AMapSearchDelegate  POI查询回调函数
    func onPOISearchDone(_ request: AMapPOISearchBaseRequest!, response: AMapPOISearchResponse!) {
        if response.pois.count == 0 {
            return
        }
        dataArray = NSMutableArray.init(array: response.pois)
        self.tableView.reloadData()
        self.tableView.scrollToRow(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
    }

    // MARK :MAMapViewDelegate 回调
    func mapView(_ mapView: MAMapView!, didUpdate userLocation: MAUserLocation!, updatingLocation: Bool) {
        self.currentLocation = userLocation.location
    }
    
    func mapView(_ mapView: MAMapView!, didSelect view: MAAnnotationView!) {
        if view.annotation is MAUserLocation {
            tapAction()
        }
    }
    
    func mapView(_ mapView: MAMapView!, regionDidChangeAnimated animated: Bool) {
        
        if didStopLocating {
            searchPOI(loca: CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude))
        }
        
    }
    
    func mapView(_ mapView: MAMapView!, mapWillMoveByUser wasUserAction: Bool) {
        didStopLocating = false
    }
    
    func mapView(_ mapView: MAMapView!, mapDidMoveByUser wasUserAction: Bool) {
        didStopLocating = true
    }
    
    func onReGeocodeSearchDone(_ request: AMapReGeocodeSearchRequest!, response: AMapReGeocodeSearchResponse!) {
        
        var str = response.regeocode.addressComponent.city;
        if str != nil {
            str = response.regeocode.addressComponent.province
        }
        self.mapView.userLocation.title = str;
        self.mapView.userLocation.subtitle = response.regeocode.formattedAddress
    }
    
    // MARK: search delegate 搜索结果的回调
    func onInputTipsSearchDone(_ request: AMapInputTipsSearchRequest!, response: AMapInputTipsSearchResponse!) {
        
        if response.count == 0 {
            return
        }
        self.searchDataArray = NSMutableArray.init(array: response.tips)
        self.searchResult?.reloadData()
    }
    
    // MARK: UISearchBarDelegate UISearchBar的代理
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchArround(str: searchBar.text!)
        print(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        
        searchBar.resignFirstResponder()
        searchBar.text = ""
        if _searchResult == nil {
            return
        }
        self.searchResult?.removeFromSuperview()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        self.searchDataArray = self.dataArray
        self.searchResult?.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        if searchBar.text == "" {
            searchBar.showsCancelButton = false
        }
    }
    
    // MARK :help func
    func tapAction (){
        
        if ((self.currentLocation) != nil) {
            let request = AMapReGeocodeSearchRequest()
            request.location = AMapGeoPoint.location(withLatitude: CGFloat(self.currentLocation.coordinate.latitude
            ), longitude: CGFloat(self.currentLocation.coordinate.longitude))
            
            search.aMapReGoecodeSearch(request)
        }
    }
    
    func searchArround(str:String){
        let tips = AMapInputTipsSearchRequest()
        tips.keywords = str;
        tips.city  = "北京";
        self.search.aMapInputTipsSearch(tips);
    }

    
    @IBAction func tapped(_ sender: Any) {
        
        if self.currentLocation == nil {
            return
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.mapView.centerCoordinate = CLLocationCoordinate2D(latitude: self.currentLocation.coordinate.latitude, longitude: self.currentLocation.coordinate.longitude)
            self.mapView.showsCompass = false
            self.mapView.zoomLevel = 15.1
            self.tableView.scrollToRow(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        })

    }

}

extension CharteredViewController:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 10 {
            return searchDataArray.count
        }
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCellidentify = "tableViewCellID"
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellidentify, for: indexPath) as? tableViewCell
        if tableView.tag == 10 {
            
            if searchDataArray[indexPath.row] is AMapTip {
                let data = searchDataArray[indexPath.row] as? AMapTip
                cell?.titleLabel?.text = data?.name
                cell?.detailLabel?.text = data?.address
            }else if searchDataArray[indexPath.row] is AMapPOI {
                let data = searchDataArray[indexPath.row] as? AMapPOI
                cell?.titleLabel?.text = data?.name
                cell?.detailLabel?.text = data?.address
            }
            
            if indexPath.row == 0 {
                cell?.rightImage.image = UIImage(named: "location_current")
            }else {
                cell?.rightImage.image = nil
            }
            
        }else {
            let data = dataArray[indexPath.row] as? AMapPOI
            cell?.titleLabel?.text = data?.name
            cell?.detailLabel?.text = data?.address
            
            if indexPath.row == 0 {
                cell?.rightImage.image = UIImage(named: "location_current")
            }else {
                cell?.rightImage.image = UIImage(named: "location_other")
            }
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

