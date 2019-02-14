//
//  CodeBinaryShape.h
//  CodeBinary
//
//  Created by Antoine FEUERSTEIN on 2/13/19.
//  Copyright © 2019 Antoine Feuerstein. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>
#import <SpriteKit/SpriteKit.h>

struct Number {
    CGPoint                 position;
    int                     state;
};

@interface CodeBinaryShape: SKShapeNode {
    int                     countX;
    int                     countY;
    struct Number**         numbers;
    NSMutableDictionary*    labels;
    NSTimer*                blockTimer;
}

- (instancetype)initWithSize:(CGSize)size;

- (void)drawLabels;

@end

@interface CodeBinaryDesign: NSObject

+ (NSColor*) shapeStrokeColor;

@end
