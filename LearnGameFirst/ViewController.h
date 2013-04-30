//
//  ViewController.h
//  LearnGameFirst
//
//  Created by 叶 建统 on 13-4-22.
//  Copyright (c) 2013年 叶 建统. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>

-(IBAction)showAlert;
-(IBAction)sliderMoved:(UISlider*)slider;
-(IBAction)startOver;
- (IBAction)showInfo;

@property (nonatomic, strong) IBOutlet UISlider *slider;

@property(nonatomic,strong)IBOutlet UILabel *targetLabel;
@property (nonatomic, strong) IBOutlet UILabel *scoreLabel;
@property (nonatomic, strong) IBOutlet UILabel *roundLabel;

@end


