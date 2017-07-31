//
//  GameDataManager.hpp
//  FlappyBird
//
//  FlappyBird
//
//  Created by 金亮齐 on 2017/7/25.
//
//

#ifndef GameDataManager_hpp
#define GameDataManager_hpp

#include <stdio.h>

class GameDataManager {
    
public:
    static GameDataManager* getInstance();
    void spendCoinToResurrection(int coinCount);
    void addCoin();
    // 保存用户金币总数以及最佳成绩
    void saveUserData();
    void saveUserBestScore(int score);
    
private:
    CC_SYNTHESIZE(int, _bestScore, BestScore);
    CC_SYNTHESIZE(int, _allCoinCount, AllCoinCount);
};

#endif /* GameDataManager_hpp */
