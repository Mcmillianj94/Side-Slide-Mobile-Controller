//
//  SideSlideHub.m
//  SideSlideIOS
//
//  Created by Joshua on 2/22/15.
//  Copyright (c) 2015 Joshua. All rights reserved.
//

#import "SideSlideHub.h"
@interface SideSlideHub(){
    CGPoint initialTouchLocation;
}
@property SKShapeNode* pressurePointLeft;
@property SKShapeNode* pressurePointRight;
@property NSString* rightPPName;
@property NSString* leftPPName;
@property SKScene* gameScene;
@end

@implementation SideSlideHub
-(SKSpriteNode *) initWithScene: (SKScene*)gameScene barColor: (UIColor*)barColor pressurePointColor: (UIColor*)pressurePointColor pressurePointAlpha: (float)pressurePointAlpha barWidth: (float)barWidth
{
    if ((self = [super init]))
    {
        self.rightPPName = @"PressurePointRightName";
        self.leftPPName = @"PressurePointLeftName";
        self.gameScene = gameScene;
        float sideBarXcord = (gameScene.size.width / 2) - (barWidth / 2); //sideBarLeft x cord is wraped in a -() to make it negative
        float barHeight = gameScene.size.height;
        
        //Add Control Elements
        ////LeftSide
        SKSpriteNode* sideBarLeft = [[SKSpriteNode alloc] initWithColor:barColor size:CGSizeMake(barWidth, barHeight)];
        sideBarLeft.position = CGPointMake(-(sideBarXcord), 0);
        [self addChild:sideBarLeft];
        
        self.pressurePointLeft = [SKShapeNode shapeNodeWithCircleOfRadius:barWidth/2];
        self.pressurePointLeft.position = CGPointMake(self.frame.size.width /2, self.frame.size.height /2);
        self.pressurePointLeft.name = self.leftPPName;
        self.pressurePointLeft.fillColor = pressurePointColor;
        self.pressurePointLeft.alpha = pressurePointAlpha;
        [sideBarLeft addChild:self.pressurePointLeft];
        
        ////RightSide
        SKSpriteNode* sideBarRight = [[SKSpriteNode alloc] initWithColor:barColor size:CGSizeMake(barWidth, barHeight)];
        sideBarRight.position = CGPointMake(sideBarXcord, 0);
        [self addChild:sideBarRight];
        
         self.pressurePointRight= [SKShapeNode shapeNodeWithCircleOfRadius:barWidth/2];
        self.pressurePointRight.position = CGPointMake(self.parent.frame.size.width /2, self.parent.frame.size.height /2);
        self.pressurePointRight.name = self.rightPPName;
        self.pressurePointRight.fillColor = pressurePointColor;
        self.pressurePointRight.alpha = pressurePointAlpha;
        [sideBarRight addChild:self.pressurePointRight];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *tap = [touches anyObject];
    initialTouchLocation = [tap locationInNode:self];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    SKNode *node = [self nodeAtPoint: initialTouchLocation];
    
    UITouch *tap = [touches anyObject];
    CGPoint newLocation = [tap locationInNode:self];
    if (node.name == self.rightPPName) {
        [self.pressurePointRight setPosition:newLocation];
    }
    
}
@end
