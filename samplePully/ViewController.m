//
//  ViewController.m
//  samplePully
//
//  Created by Jessica Lam on 9/13/14.
//  Copyright (c) 2014 LoungeBuddy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topOffsetConstraint;
@property (weak, nonatomic) IBOutlet UIScrollView *topScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *bottomScrollView;

@end

@interface ViewController (protocol) <UIScrollViewDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation ViewController (protocol)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y;
    BOOL shouldAnimate = NO;
    if (scrollView == [self topScrollView] && offset > 145) {
        [self topOffsetConstraint].constant = - ( CGRectGetHeight(scrollView.frame) + 16);
        shouldAnimate = YES;
    } else if (scrollView == [self bottomScrollView] && offset < -145) {
        [self topOffsetConstraint].constant = -16;
        shouldAnimate = YES;
    }
    if (shouldAnimate) {
        [UIView animateWithDuration:0.33
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut animations:^{
                                [[self view] layoutSubviews];
                            } completion:nil];
    }

}

@end
