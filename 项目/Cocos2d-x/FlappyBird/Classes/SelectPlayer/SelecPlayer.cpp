//
//  SelecPlayer.cpp
//  FlappyBird
//
//  Created by 金亮齐 on 2017/7/28.
//
//

#include "SelecPlayer.hpp"

cocos2d::Scene *SelectPlayer::createScene(){
    auto s = cocos2d::Scene::create();
    auto l = SelectPlayer::create();
    
    s->addChild(l);
    
    return s;
}

bool SelectPlayer::init(){
    if (!Layer::init()) {
        return false;
    }
    addPricture();
    addButton();
    
    return true;
}

void SelectPlayer::addButton(){

}

void SelectPlayer::addButton(const std::string &pressImageName, int tag, cocos2d::Vec2 postion, const std::string &title)
{
    
}

void SelectPlayer::buttonTouchCallback(Ref *sender, Widget::TouchEventType type)
{
}

void SelectPlayer::addPricture(){
    
}

void SelectPlayer::onEnterTransitionDidFinish(){

}