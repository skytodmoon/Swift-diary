//
//  ApiService.swift
//  Youtube
//
//  Created by 金亮齐 on 2017/11/17.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    static let sharedInstance = ApiService()
    
    let baseUrl = "http://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(completcion: [Video] ->()){
        
        fetchFeedForUrlString("\(baseUrl)/home.json",completcion: completcion)
    }
    
    
    func fetchTrendingFeed(completcion: [Video] ->()){
        fetchFeedForUrlString("\(baseUrl)/trending.json",completcion: completcion)
    }
    
    func fetchSubscriptionFeed(completcion: [Video] ->()){
        fetchFeedForUrlString("\(baseUrl)/subscriptions.json",completcion: completcion)
    }
    
    func fetchFeedForUrlString(urlString: String, completcion: [Video] ->()){
        let url = NSURL(string: urlString)
        NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                var videos = [Video]()
                for dictionary in json as! [[String: AnyObject]] {
                    let video = Video()
                    video.setValuesForKeysWithDictionary(dictionary)
                    
                    let channeDicitionary = dictionary["channel"] as! [String: AnyObject]
                    let channel = Channel()
                    channel.name = channeDicitionary["name"] as? String
                    channel.profileImageName = channeDicitionary["profile_image_name"] as? String
                    video.channel = channel
                    videos.append(video)
                }
                dispatch_async(dispatch_get_main_queue(),{
                    completcion(videos)
                })
            } catch let jsonError {
                print(jsonError)
            }
            }.resume()
    }
}


//let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
//var videos = [Video]()
//for dictionary in json as! [[String: AnyObject]] {
//    let video = Video()
//    video.title = dictionary["title"] as? String
//    video.thumnailImageName = dictionary["thumbnail_image_name"] as? String
//    let channeDicitionary = dictionary["channel"] as! [String: AnyObject]
//    let channel = Channel()
//    channel.name = channeDicitionary["name"] as? String
//    channel.profileImageName = channeDicitionary["profile_image_name"] as? String
//    video.channel = channel
//    videos.append(video)
//}
//dispatch_async(dispatch_get_main_queue(),{
//    completcion(videos)
//})
//} catch let jsonError {
//    print(jsonError)
//}
//}.resume()

