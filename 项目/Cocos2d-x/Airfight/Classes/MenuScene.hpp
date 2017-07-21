//
//  MenuScene.hpp
//  Airfight
//
//  Created by 金亮齐 on 2017/7/21.
//
//

#ifndef MenuScene_hpp
#define MenuScene_hpp

#include <stdio.h>

//GameMenu类的作用是显示一个菜单场景,让用户选择"开始游戏" 或者是 "游戏设置"
class GameMenu : public cocos2d::Layer
{
public:
    
    /**
     * 静态函数，创建Scene场景
     * 注意: 在cocos2d-x中没有cocos2d-iphone中的id，建议返回类实例的指针
     */
    static cocos2d::Scene* createScence();
    
    /**
     * init函数,完成初始化操作
     * 注意: init函数在cocos2d-iphone返回bool值，而不是cocos2d-iphone中的id
     */
    
    virtual bool init();
    
    /**
     * i使用CREATE_FUNC宏创建当前类的对象，返回的时候将会自由释放池对象管理内存的释放
     *
     */
    
    CREATE_FUNC(GameMenu);
};

#endif /* MenuScene_hpp */
