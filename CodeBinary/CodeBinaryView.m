//
//  CodeBinaryView.m
//  CodeBinary
//
//  Created by Antoine Feuerstein on 12/02/2019.
//  Copyright © 2019 Antoine Feuerstein. All rights reserved.
//

#import "CodeBinaryView.h"

@implementation CodeBinaryView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        sceneView = [[SKView alloc] initWithFrame:frame];
        scene = [[CodeBinaryScene alloc] initWithSize:self.bounds.size];
        
        [self addSubview:sceneView];
        [sceneView setTranslatesAutoresizingMaskIntoConstraints:false];
        [sceneView.topAnchor constraintEqualToAnchor:sceneView.topAnchor].active = true;
        [sceneView.bottomAnchor constraintEqualToAnchor:sceneView.bottomAnchor].active = true;
        [sceneView.leadingAnchor constraintEqualToAnchor:sceneView.leadingAnchor].active = true;
        [sceneView.trailingAnchor constraintEqualToAnchor:sceneView.trailingAnchor].active = true;
        [sceneView presentScene:scene];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
