//
//  CodeBinaryScene.h
//  CodeBinary
//
//  Created by Antoine Feuerstein on 13/02/2019.
//  Copyright © 2019 Antoine Feuerstein. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>
#import <SpriteKit/SpriteKit.h>
#import "CodeBinaryShape.h"

@interface CodeBinaryScene: SKScene {

    CGSize          shapeSize;
    NSArray*        shapeArray;
    int             currentShape;
}



@end
