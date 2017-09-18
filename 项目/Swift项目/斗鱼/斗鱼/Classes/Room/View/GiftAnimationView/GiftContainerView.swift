//
//  GiftContainerView.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

/**
 礼物连击动画总结 :
 1> 定义 GiftDigitLabel
 * 有描边效果
 * 画两次文字
 * 需要执行动画(弹动效果)
 2> 定义 GiftChannelView视图
 * 使用 xib 创建View
 * 定义模型 GiftMessageModel
 * 开始执行弹动动画(左侧出,右侧消失)
 * 开始执行GiftDigitLabel动画
 * 延迟3s 执行消失动画
 * 定义一个外界可以添加缓存方法: 如果是正在等待消失,则直接执行GiftDigitLabel弹动动画,并且添加到缓存中
 * 需要给 channelView自定义状态
 * 给状态进行赋值
 3> 定义 GiftContentView 视图
 * 给GiftContentView 添加 channelView 视图
 * 让外界可以传入模型
 * 检测是否有正在执行的动画 channelView 和新传入的模型的 userName/ giftname 类型
 * 检测是否有限制 channelView
 * 将模型添加到缓存中
 * 监听 channelView 什么时候执行完动画,判断缓存中是否有内容,从缓存中取出所有相同内容,继续执行动画
 
 
 */

import UIKit

private let kChannelCount = 2 // 频道的数量
private let kChannelViewH: CGFloat = 40 // 频道的高度
private let kChannelMargin: CGFloat = 10 // 频道之间的间距

class GiftContainerView: UIView {
    
    // MARK: 懒加载属性
    /// 定义一个数组,用来保存所有的频道视图,因为要要从这个数组中进行遍历,根据频道当前的状态来判断当前的 channelView 是否可以使用
    fileprivate lazy var channelViews : [GiftChannelView] = [GiftChannelView]()
    /// 定义一个数组.用来保存所有的模型
    fileprivate lazy var cacheGiftModels: [GiftMessageModel] = [GiftMessageModel]()
    
    // MARK: 构造函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

// MARK: 设置 UI 界面
extension GiftContainerView {
    
    fileprivate func setupUI() {
        
        // 1. 根据当前的频道书,创建频道视图
        let w: CGFloat = frame.width
        let h: CGFloat = kChannelViewH
        let x: CGFloat = 0
        
        for i in 0..<kChannelCount {
            let y: CGFloat = (h + kChannelMargin) * CGFloat(i)
            // 1.1 创建频道视图
            let channelView = GiftChannelView.loadFromNib()
            channelView.frame = CGRect(x: x, y: y, width: w, height: h)
            channelView.alpha = 0.0
            
            // 设置代理
            channelView.delegate = self
            // 1.2 将视图添加到 view 上
            addSubview(channelView)
            
            // 1.3 将频道视图保存到数组中
            channelViews.append(channelView)
            
        }
    }
}

// MARK: 给外界提供一个方法,用来展示礼物视图,让外界传递礼物模型
extension GiftContainerView {
    func showGiftModelView(_ giftModel: GiftMessageModel) {
        // 1. 判断正在忙的ChannelView和赠送的新礼物的(username/giftname)
        if let channelView = checkUsingChanelView(giftModel){
            channelView.addOnceToCache()
            return
        }
        
        // 2. 判断有没有闲置的ChannelView
        if let channelView = checkIdleChannelView() {
            channelView.giftModel = giftModel
            return
        }
        
        // 3. 将数据放入缓存中
        cacheGiftModels.append(giftModel)
        
    }
    
    
    // MARK: 检查 ChannelView 是否是所用的 View 遍历
    fileprivate func checkUsingChanelView(_ giftModel : GiftMessageModel) -> GiftChannelView? {
        for channelView in channelViews {
            if giftModel.giftName == channelView.giftModel?.giftName && giftModel.senderName == channelView.giftModel?.senderName  && channelView.state != .endAnimating {
                return channelView
            }
        }
        return nil
    }
    
    // MARK: 判断是否是处于闲置状态
    fileprivate func checkIdleChannelView() -> GiftChannelView? {
        for channelView in channelViews {
            if channelView.state == .idle {
                return channelView
            }
        }
        
        return nil
    }
    
}

// MARK: - GiftChannelViewDelegate 实现代理方法
extension GiftContainerView: GiftChannelViewDelegate {
    
    func giftAnimationDidCompletion(giftChannelView: GiftChannelView) {
        
        // 1. 取出缓存中的模型
        guard cacheGiftModels.count != 0 else { // 判断有没有缓存,没缓存 return 掉
            
            return
        }
        
        // 2.能莱奥这里说明缓存中有模型,需要缓存模型进行处理
        
        // 2.1 取出缓存中的第一个模型
        let firstGiftModel = cacheGiftModels.first
        // 移除数组中第一个模型
        cacheGiftModels.removeFirst()
        
        // 3. 让闲置的 channelView 执行动画
        giftChannelView.giftModel = firstGiftModel
        
        // 4. 将数组中剩余有和firstGiftModel相同的模型放入到ChanelView缓存中
        for i in (0..<cacheGiftModels.count).reversed() {
            let giftModel = cacheGiftModels[i]
            
            if giftModel.giftName == firstGiftModel!.giftName && giftModel.senderName == firstGiftModel!.senderName {
                
                giftChannelView.addOnceToCache()
                
                cacheGiftModels.remove(at: i)
            }
        }
    }
}



