//
//  MenuScene.cpp
//  Airfight
//
//  Created by 金亮齐 on 2017/7/21.
//
//

#include "MenuScene.hpp"
#include "ui/CocosGUI.h"
USING_NS_CC;
using namespace ui;

Scene* GameMenu::createScene()
{
    // 创建一个场景对象，该对象将会由自动释放池管理内存的释放
    auto scene = Scene::create();
    // 创建层对象，该对象将会由自动释放池管理内存的释放
    auto layer = GameMenu::create();
    // 将GameMenu层作为子节点添加到场景
    scene->addChild(layer);
    // 返回场景对象
    return scene;}

bool GameMenu::init(){
    // 调用父类的init方法
    if(!Layer::init()){
        return false;
    }
    // 获得设备可见视图大小
    Size visibleSize = Director::getInstance()->getVisibleSize();
    
    // “开始游戏”按钮
    auto start_button = Button::create("button.png");
    start_button->setScale(2);
    start_button->setTitleText("开始游戏");
    start_button->setTitleFontName("微软雅黑");
    start_button->setTitleFontSize(12);
    start_button->setPosition(Vec2(visibleSize.width/2, visibleSize.height*0.9));
    start_button->addTouchEventListener([](Ref* pSender,Widget::TouchEventType type){
        if(type == Widget::TouchEventType::ENDED){
            // 切换到PreLoad场景
//            auto transition = TransitionSlideInL::create(2.0, PreLoad::createScene());
//            Director::getInstance()->replaceScene(transition);
        }
    });
    this->addChild(start_button);
    
    // “游戏设置”按钮
    auto set_button = Button::create("button.png");
    set_button->setScale(2);
    set_button->setTitleText("游戏设置");
    set_button->setTitleFontName("微软雅黑");
    set_button->setTitleFontSize(12);
    set_button->setPosition(Vec2(visibleSize.width/2, visibleSize.height*0.7));
    set_button->addTouchEventListener([](Ref* pSender,Widget::TouchEventType type){
        if(type == Widget::TouchEventType::ENDED){
            // 切换到AudioControl场景
            auto transition = TransitionSlideInL::create(2.0, AudioControl::createScene());
            Director::getInstance()->replaceScene(transition);
        }
    });
    this->addChild(set_button);
    
    // “退出游戏”按钮
    auto close_button = Button::create("button.png");
    close_button->setScale(2);
    close_button->setTitleText("退出游戏");
    close_button->setTitleFontName("微软雅黑");
    close_button->setTitleFontSize(12);
    close_button->setPosition(Vec2(visibleSize.width/2, visibleSize.height*0.5));
    close_button->addTouchEventListener([](Ref* pSender,Widget::TouchEventType type){
        if(type == Widget::TouchEventType::ENDED){
#if (CC_TARGET_PLATFORM == CC_PLATFORM_WP8) || (CC_TARGET_PLATFORM == CC_PLATFORM_WINRT)
            MessageBox("You pressed the close button. Windows Store Apps do not implement a close button.","Alert");
            return;
#endif
            Director::getInstance()->end();
#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
            exit(0);
#endif
            
        }
    });
    this->addChild(close_button);
    
    // 作者名
    auto banner_text = Text::create("醉看红这场梦", "Arial-BoldMT", 9);
    banner_text->setPosition(Vec2(visibleSize.width/2, visibleSize.height*0.25));
    this->addChild(banner_text);
    
    // 网址
    auto email_text = Text::create("http://www.jianshu.com/u/ef13bae228f6", "Arial-BoldMT", 9);
    email_text->setPosition(Vec2(visibleSize.width/2, visibleSize.height*0.2));
    this->addChild(email_text);
    
    return true;
}

