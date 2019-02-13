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
        self.backgroundColor = [NSColor greenColor];
    }
    return self;
}

@end
