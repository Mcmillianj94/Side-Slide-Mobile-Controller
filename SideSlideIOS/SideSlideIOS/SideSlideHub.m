//
//  SideSlideHub.m
//  SideSlideIOS
//
//  Created by Joshua on 2/22/15.
//  Copyright (c) 2015 Joshua. All rights reserved.
//

#import "SideSlideHub.h"
@interface SideSlideHub()
@end

@implementation SideSlideHub
-(SKSpriteNode *) initWithScene: (SKScene*)gameScene barColor: (UIColor*)barColor pressurePointColor: (UIColor*)pressurePointColor pressurePointAlpha: (float)pressurePointAlpha barWidth: (float)barWidth{
    
    
    float sideBarXcord = (gameScene.size.width / 2) - (barWidth / 2); //sideBarLeft x cord is wraped in a -() to make it negative
    float barHeight = gameScene.size.height;
    
    if (self = [super init]) {
        
        //Add Control Elements
        ////LeftSide
        SKSpriteNode* sideBarLeft = [[SKSpriteNode alloc] initWithColor:barColor size:CGSizeMake(barWidth, barHeight)];
        sideBarLeft.position = CGPointMake(-(sideBarXcord), 0);
        [self addChild:sideBarLeft];
        
        SKShapeNode* pressurePointLeft = [SKShapeNode shapeNodeWithCircleOfRadius:barWidth/2];
        pressurePointLeft.position = CGPointMake(self.frame.size.width /2, self.frame.size.height /2);
        pressurePointLeft.fillColor = pressurePointColor;
        pressurePointLeft.alpha = pressurePointAlpha;
        [sideBarLeft addChild:pressurePointLeft];
        
        ////RightSide
        SKSpriteNode* sideBarRight = [[SKSpriteNode alloc] initWithColor:barColor size:CGSizeMake(barWidth, barHeight)];
        sideBarRight.position = CGPointMake(sideBarXcord, 0);
        [self addChild:sideBarRight];
        
        SKShapeNode* pressurePointRight = [SKShapeNode shapeNodeWithCircleOfRadius:barWidth/2];
        pressurePointRight.position = CGPointMake(self.parent.frame.size.width /2, self.parent.frame.size.height /2);
        pressurePointRight.fillColor = pressurePointColor;
        pressurePointRight.alpha = pressurePointAlpha;
        [sideBarRight addChild:pressurePointRight];
    }
    return self;
}
@end
