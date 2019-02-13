//
//  CodeBinaryView.h
//  CodeBinary
//
//  Created by Antoine Feuerstein on 12/02/2019.
//  Copyright © 2019 Antoine Feuerstein. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>
#import <SpriteKit/SpriteKit.h>
#import "CodeBinaryScene.h"

@interface CodeBinaryView : ScreenSaverView {
    SKView*             sceneView;
    CodeBinaryScene*    scene;
}

@end
