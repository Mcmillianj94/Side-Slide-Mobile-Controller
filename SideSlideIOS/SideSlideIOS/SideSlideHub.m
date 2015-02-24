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
@property BOOL leftPointIsActive;
@property BOOL rightPointIsActive;
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
        
        [self setUserInteractionEnabled:YES];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint positionInScene = [touch locationInNode:self];
    //NSArray* childrenNodes = [self nodesAtPoint:positionInScene];
    
    ////Code To check if both pressure points are active (touched)
    //Commeted out for testing puposes
    /*
    self.leftPointIsActive = false;
    self.rightPointIsActive = false;

    for (SKNode* node in childrenNodes) {
        if (node.name == self.leftPPName) self.leftPointIsActive = true;
        if (node.name == self.rightPPName) self.rightPointIsActive = true;
        
        if (self.leftPointIsActive && self.rightPointIsActive) {
            SKNode *rightPP = [self childNodeWithName:self.leftPPName];
            SKNode* leftPP = [self childNodeWithName:self.rightPPName];
            SKAction * actionMove = [SKAction moveTo:CGPointMake(leftPP.position.x, positionInScene.y) duration: 0];
            [rightPP runAction:actionMove];
            [leftPP runAction:actionMove];
        }
    }*/
    
    ////This is the code im using for testing only moves the right button
    // Create the actions
    SKAction * actionMove = [SKAction moveTo:CGPointMake(self.pressurePointRight.position.x, positionInScene.y) duration:0];
    [self.pressurePointRight runAction:actionMove];

    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    ////Code To check if both pressure points are active (touched)
    //Commeted out for testing puposes
    /*
    UITouch *touch = [touches anyObject];
    CGPoint positionInScene = [touch locationInNode:self];
    NSArray* childrenNodes = [self nodesAtPoint:positionInScene];
    //Set active point false if released
    for (SKNode* node in childrenNodes) {
        if (node.name != self.leftPPName) self.leftPointIsActive = false;
        if (node.name != self.rightPPName) self.rightPointIsActive = false;
        
        ////One or both of the pressure points were so the controller goes into Rest_State
        //Set both buttons back to center (Rest_State)
        if (!self.leftPointIsActive && self.rightPointIsActive) {
            SKAction * actionMove = [SKAction moveTo:CGPointMake(self.pressurePointLeft.position.x, 0) duration: 0];
            [self.pressurePointRight runAction:actionMove];
            [self.pressurePointLeft runAction:actionMove];
        }
    }*/
    
    ////This is the code im using for testing only moves the right button
    SKAction * actionMove = [SKAction moveTo:CGPointMake(self.pressurePointLeft.position.x, 0) duration: 0];
    [self.pressurePointRight runAction:actionMove];
}

@end
