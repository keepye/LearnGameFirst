//
//  ViewController.m
//  LearnGameFirst
//
//  Created by 叶 建统 on 13-4-22.
//  Copyright (c) 2013年 叶 建统. All rights reserved.
//

#import "ViewController.h"
#import "AboutViewController.h"

@interface ViewController ()

@end

@implementation ViewController

int currentValue=0;
int targetValue = 0;
int score = 0;
int gameround = 0;

@synthesize slider;
@synthesize targetLabel;
@synthesize scoreLabel;
@synthesize roundLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self startNewRound];
    
    [self updateLabels];
    
}

- (void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", gameround];
}

-(void)startNewRound
{
    targetValue = 1+ (arc4random()%100);
    currentValue = 50;
    gameround += 1;
    self.slider.value = currentValue;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewRound];
    [self updateLabels];
}

-(IBAction)showAlert
{    
    //NSString *message = [NSString stringWithFormat:@"滑动条的当前数值是: %d\n我们的目标数值是: %d\n之间的差值是: %d",currentValue,targetValue,difference];
    int difference = abs(targetValue - currentValue);
    int points = 100 - difference;
    score += points;
    NSString *message = [NSString stringWithFormat:@"You scored %d points", points];
    
    NSString *title;
    
    if(difference == 0)
    {
        title = @"完美表现!";
    }else if(difference <5)
    {
        title = @"太棒了!差一点就到了!";
    }else if(difference <10)
    {
         title = @"不错!";
    }else
    {
         title = @"差太远了吧!";
    }
    
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title 
                                                  message:message
                                                  delegate:self
                                                  cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
//    [self startNewRound];
//    [self updateLabels];
    
}

-(IBAction)sliderMoved:(UISlider *)sender
{
   currentValue = lroundf(sender.value);
}

-(void)startNewGame
{
    score = 0;
    gameround = 0;
    [self startNewRound];
}

-(IBAction)startOver
{
    [self startNewGame];
    [self updateLabels];
}

- (IBAction)showInfo
{
    AboutViewController *aboutcontroller = [[AboutViewController alloc]
                                            initWithNibName:@"AboutViewController" bundle:nil];
    aboutcontroller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:aboutcontroller animated:YES completion:nil];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

@end
