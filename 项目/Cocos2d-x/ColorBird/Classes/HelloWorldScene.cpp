#include "HelloWorldScene.h"
#include "SimpleAudioEngine.h"

USING_NS_CC;

Scene* HelloWorld::createScene()
{
    return HelloWorld::create();
}

// on "init" you need to initialize your instance
bool HelloWorld::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !Scene::init() )
    {
        return false;
    }
    
    auto visibleSize = Director::getInstance()->getVisibleSize();
    Vec2 origin = Director::getInstance()->getVisibleOrigin();

    /////////////////////////////
    // 2. add a menu item with "X" image, which is clicked to quit the program
    //    you may modify it.

    // add a "close" icon to exit the progress. it's an autorelease object
    auto closeItem = MenuItemImage::create(
                                           "CloseNormal.png",
                                           "CloseSelected.png",
                                           CC_CALLBACK_1(HelloWorld::menuCloseCallback, this));
    
    closeItem->setPosition(Vec2(origin.x + visibleSize.width - closeItem->getContentSize().width/2 ,
                                origin.y + closeItem->getContentSize().height/2));

    // create menu, it's an autorelease object
    auto menu = Menu::create(closeItem, NULL);
    menu->setPosition(Vec2::ZERO);
    this->addChild(menu, 1);
    
//    ///////////DEMO1//////////////////
//    //添加文字
//    auto label = Label::createWithTTF("QJL", "fonts/Marker Felt.ttf", 24);
//    label->setPosition(Vec2(origin.x + visibleSize.width/2,origin.y + visibleSize.height - label->getContentSize().height));
//    this->addChild(label,1);
//    
//    //Create函数创建一个Node
//    auto node = Node::create();
//    
//    //setPosition函数用于设置节点的坐标位置
//    node->setPosition(Vec2(visibleSize.width/2 , visibleSize.height/2 ));
//    
//    //根据图像创建一个精灵
//    auto sprite = Sprite::create("groggini.jpg");
//    
//    //addChil函数用于将其他节点(精灵)添加为当前节点的子节点
//    node->addChild(sprite);
//    
//    //设置节点的缩放
//    node->setScale(2);
//    
//    //设置节点旋转
//    //node->setRotation(90.0);
//    
//    //添加子节点
//    this->addChild(node);

    ///////////DEMO2//////////////////
//    //创建背景图片
//    auto sprite = Sprite::create("bg.png");
//    
//    //使用图片创建一个僵尸精灵,初始化偏移位置(0,0)
//    auto zSprite = Sprite::create("z_00_01.png");
//
//    // 设置精灵的位置在屏幕正中
//    sprite->setPosition(Vec2(visibleSize.width/2 , visibleSize.height/2 ));
//    
//    //设置僵尸精灵位置在屏幕的正中央
//    zSprite->setPosition(Vec2(visibleSize.width/2,visibleSize.height/2));
//
//    //设置精灵水平翻转
//    zSprite->setFlippedX(true);
//    
//    // 将精灵添加为当前层的子节点
//    this->addChild(sprite, 0);
//    
//    //把僵尸精灵作为子节点
//    this->addChild(zSprite);
    
    
    //////////DEMO3//////////////////
    // 获取精灵帧缓存的单例对象。
    auto spriteFrameCache = SpriteFrameCache::getInstance();
    // ①从plist文件添加多个精灵帧
    spriteFrameCache->addSpriteFramesWithFile("SpriteSheet.plist");
    // ②根据图片的名称创建一个精灵帧（背景）。
    auto sprite1Frame = spriteFrameCache->getSpriteFrameByName("gamebg.png");
    // ③使用精灵帧创建一个精灵
    auto bgSprite = Sprite::createWithSpriteFrame(sprite1Frame);
    // 设置精灵sprite1的坐标位置
    bgSprite->setPosition(Vec2(visibleSize.width/2,visibleSize.height/2));
    this->addChild(bgSprite);
    // ④使用精灵帧的名称创建一个精灵（豌豆）
    auto plantSprite = Sprite::createWithSpriteFrameName("plant.png");
    plantSprite->setPosition(Vec2(visibleSize.width/2-200,visibleSize.height/2));
    this->addChild(plantSprite);
    // ⑤使用精灵帧的名称创建一个精灵（僵尸）
    auto zSprite = Sprite::createWithSpriteFrameName("z_00_01.png");
    zSprite->setPosition(Vec2(visibleSize.width/2+200,visibleSize.height/2));
    this->addChild(zSprite);
    
    return true;
}


void HelloWorld::menuCloseCallback(Ref* pSender)
{
    //Close the cocos2d-x game scene and quit the application
    Director::getInstance()->end();

    #if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
    exit(0);
#endif
    
    /*To navigate back to native iOS screen(if present) without quitting the application  ,do not use Director::getInstance()->end() and exit(0) as given above,instead trigger a custom event created in RootViewController.mm as below*/
    
    //EventCustom customEndEvent("game_scene_close_event");
    //_eventDispatcher->dispatchEvent(&customEndEvent);
    
    
}
