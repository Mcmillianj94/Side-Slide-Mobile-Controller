//
//  SideSlideHub.h
//  SideSlideIOS
//
//  Created by Joshua on 2/22/15.
//  Copyright (c) 2015 Joshua. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SideSlideHub : SKSpriteNode

-(SKSpriteNode *) initWithScene: (SKScene*)gameScene
                       barColor: (UIColor*)barColor
             pressurePointColor: (UIColor*)pressurePointColor
             pressurePointAlpha: (float)pressurePointAlpha
                       barWidth: (float)barWidth;

@end
