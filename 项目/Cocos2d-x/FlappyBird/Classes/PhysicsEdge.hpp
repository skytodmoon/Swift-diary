//
//  PhysicsEdge.hpp
//  FlappyBird
//
//  FlappyBird
//
//  Created by 金亮齐 on 2017/7/25.
//
//

#ifndef PhysicsEdge_hpp
#define PhysicsEdge_hpp

#include "Const.hpp"

class PhysicsEdge:public Node {
    
public:
    virtual bool init();
    CREATE_FUNC(PhysicsEdge);
};

#endif /* PhysicsEdge_hpp */
