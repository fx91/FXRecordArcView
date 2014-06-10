//
//  FXViewController.m
//  FXRecordArc
//
//  Created by 方 霄 on 14-6-10.
//  Copyright (c) 2014年 方 霄. All rights reserved.
//

#import "FXViewController.h"

@interface FXViewController ()

@end

@implementation FXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.recordView = [[FXRecordArcView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    [self.view addSubview:self.recordView];
    self.recordView.delegate = self;
}

- (IBAction)tapRecordBtn:(id)sender{
    [self.recordView startForFilePath:[self fullPathAtCache:@"record.wav"]];
}

- (IBAction)tapCancelBtn:(id)sender{
    [self.recordView commitRecording];
}

- (IBAction)tapPlayBtn:(id)sender{
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[self fullPathAtCache:@"record.wav"]] error:nil];
    [self.player play];
}

- (IBAction)tapStopBtn:(id)sender{
    [self.player stop];
}

- (NSString *)fullPathAtCache:(NSString *)fileName{
    NSError *error;
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSFileManager *fm = [NSFileManager defaultManager];
    if (YES != [fm fileExistsAtPath:path]) {
        if (YES != [fm createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error]) {
            NSLog(@"create dir path=%@, error=%@", path, error);
        }
    }
    return [path stringByAppendingPathComponent:fileName];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)recordArcView:(FXRecordArcView *)arcView voiceRecorded:(NSString *)recordPath length:(float)recordLength{
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle: @"record"
                               message: [NSString stringWithFormat:@"录音地址：%@,  时常：%f",recordPath, recordLength]
                              delegate: nil
                     cancelButtonTitle:@"OK"
                     otherButtonTitles:nil];
    [alert show];

}

@end
