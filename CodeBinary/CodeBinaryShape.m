//
//  CodeBinaryShape.m
//  CodeBinary
//
//  Created by Antoine FEUERSTEIN on 2/13/19.
//  Copyright © 2019 Antoine Feuerstein. All rights reserved.
//

#import "CodeBinaryShape.h"

@implementation CodeBinaryShape

- (instancetype)initWithSize:(CGSize)size
{
    self = [super init];
    if (self) {
        CGPathRef ref = CGPathCreateWithRoundedRect(CGRectMake(0, 0, size.width, size.height), 10, 10, nil);
        CGFloat lineWidth = 10.0;
        
        [self setPath:ref];
        [self setLineWidth:lineWidth];
        [self setFillColor:[NSColor clearColor]];
        [self setStrokeColor:[CodeBinaryDesign shapeStrokeColor]];
        SKLabelNode*    testLabel = [[SKLabelNode alloc] init];
        
        testLabel.text = @"0";
        countX = ((int)(size.width - lineWidth * 2) / testLabel.frame.size.width);
        countY = ((int)(size.height - lineWidth * 2) / testLabel.frame.size.height);
        numbers = malloc(sizeof(struct Number*) * countY);
        labels = [[NSMutableDictionary alloc] initWithCapacity:countX * countY];
        
        CGFloat startX = lineWidth;
        CGFloat startY = lineWidth;
        CGSize squareSize = CGSizeMake(size.width / countX, size.height / countY);
        for (int y = 0; y < countY; y++) {
            numbers[y] = malloc(sizeof(struct Number) * countX);
            for (int x = 0; x < countX; x++) {
                numbers[y][x].position = CGPointMake(squareSize.width * x + startX, squareSize.height * y + startY);
                numbers[y][x].state = 0;
                SKLabelNode*    label = [[SKLabelNode alloc] init];
                
                [label setVerticalAlignmentMode:SKLabelVerticalAlignmentModeCenter];
                [label setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
                [label setPosition:numbers[y][x].position];
                [label setFontColor:[CodeBinaryDesign shapeStrokeColor]];
                [labels setObject:label forKey:[[NSString alloc] initWithFormat:@"%d - %d", x, y]];
                [self addChild:label];
            }
        }
        blockTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 repeats:true block:^(NSTimer* timer){
            for (int y = 0; y < self->countY; y++) {
                for (int x = 0; x < self->countX; x++) {
                    SKLabelNode* label = [self->labels objectForKey:[[NSString alloc] initWithFormat:@"%d - %d", x, y]];
                    
                    if (arc4random_uniform(2) == 0) {
                        label.text = @"0";
                    }
                    else {
                        label.text = @"1";
                    }
                }
            }
            //[self drawLabels];
        }];
        
        [blockTimer fire];
        [self drawLabels];
    }
    return self;
}
- (void)dealloc
{
    [blockTimer invalidate];
}

- (void)drawLabels
{
    for (int y = 0; y < countY; y++) {
        for (int x = 0; x < countX; x++) {
            SKLabelNode *label = [labels objectForKey:[[NSString alloc] initWithFormat:@"%d - %d", x, y]];
            struct Number number = numbers[y][x];
            
            if (number.state >= 0) {
                [label setText:[[NSString alloc] initWithFormat:@"%d", number.state]];
                if (label.parent == NULL) {
                    [self addChild:label];
                }
            }
            else if (label.parent) {
                [label removeFromParent];
            }
        }
    }
}

@end

@implementation CodeBinaryDesign

+ (NSColor*) shapeStrokeColor {
    return [NSColor blueColor];
}

@end
