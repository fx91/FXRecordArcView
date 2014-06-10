//
//  FXViewController.h
//  FXRecordArc
//
//  Created by 方 霄 on 14-6-10.
//  Copyright (c) 2014年 方 霄. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXRecordArcView.h"
@interface FXViewController : UIViewController<FXRecordArcViewDelegate>
@property(nonatomic, strong) FXRecordArcView *recordView;

@property(nonatomic, strong) AVAudioPlayer *player;

@end
