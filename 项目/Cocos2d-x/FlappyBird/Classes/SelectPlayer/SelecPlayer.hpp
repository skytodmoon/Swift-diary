//
//  SelecPlayer.hpp
//  FlappyBird
//
//  Created by 金亮齐 on 2017/7/28.
//
//

#ifndef SelecPlayer_hpp
#define SelecPlayer_hpp

#include <stdio.h>
#include "ui/CocosGUI.h"

using namespace cocos2d::ui;

class SelectPlayer:public cocos2d::Layer {
    
public:
    virtual bool init();
    static cocos2d::Scene *createScene();
    CREATE_FUNC(SelectPlayer);
    
private:
    void addButton();
    void addPricture();
    void addButton(const std::string &pressImageName, int tag, cocos2d::Vec2 postion, const std::string &title);
    void buttonTouchCallback(Ref *sender, Widget::TouchEventType type);
    
    cocos2d::Sprite *bird;
    cocos2d::Sprite *title;
    cocos2d::Sprite *land;
    
    virtual void onEnterTransitionDidFinish();
};

#endif /* SelecPlayer_hpp */
