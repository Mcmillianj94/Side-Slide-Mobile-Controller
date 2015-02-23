//
//  GameScene.m
//  SideSlideIOS
//
//  Created by Joshua on 2/22/15.
//  Copyright (c) 2015 Joshua. All rights reserved.
//

#import "GameScene.h"
@interface GameScene(){
    SideSlideHub* SSController;
}

@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    SSController = [[SideSlideHub alloc] initWithScene:self.scene barColor:nil pressurePointColor:[UIColor redColor] pressurePointAlpha:0.5f barWidth:80];
    
    SSController.position = CGPointMake(self.frame.size.width/2 , self.frame.size.height/2);
    SSController.color = [UIColor greenColor];
    [self addChild: SSController];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    [SSController touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [SSController touchesMoved:touches withEvent:event];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
