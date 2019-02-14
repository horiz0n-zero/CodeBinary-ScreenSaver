//
//  CodeBinaryScene.m
//  CodeBinary
//
//  Created by Antoine Feuerstein on 13/02/2019.
//  Copyright © 2019 Antoine Feuerstein. All rights reserved.
//

#import "CodeBinaryScene.h"

@implementation CodeBinaryScene

- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        self.backgroundColor = [NSColor blackColor];
        shapeSize = CGSizeMake(self.frame.size.width / 8.0, self.frame.size.height / 4.0);
        shapeArray = [[NSArray alloc] initWithObjects:[[CodeBinaryShape alloc] initWithSize:shapeSize], [[CodeBinaryShape alloc] initWithSize:shapeSize],
                      [[CodeBinaryShape alloc] initWithSize:shapeSize], [[CodeBinaryShape alloc] initWithSize:shapeSize], nil];
        currentShape = 0;
        for (int index = 0; index < shapeArray.count; index++) {
            CodeBinaryShape*     shape = shapeArray[index];
            
            shape.position = CGPointMake(0, -shapeSize.height);
            [self addChild:shape];
        }
        [self runAction:[SKAction repeatActionForever:[SKAction sequence:[[NSArray alloc] initWithObjects:[SKAction waitForDuration:1.5 withRange:0.5], [SKAction runBlock:^{
            CodeBinaryShape*     shape = self->shapeArray[self->currentShape];
            CGPoint              startPoint = CGPointMake((CGFloat)drand48() * [self frame].size.width, -self->shapeSize.height);
            CGPoint              endPoint = CGPointMake(startPoint.x, [self frame].size.height + self->shapeSize.height);
            
            [shape setPosition:startPoint];
            [shape runAction:[SKAction moveTo:endPoint duration:5]];
            self->currentShape++;
            if (self->currentShape >= self->shapeArray.count) {
                self->currentShape = 0;
            }
        }], nil]]]];
    }
    return self;
}

@end
