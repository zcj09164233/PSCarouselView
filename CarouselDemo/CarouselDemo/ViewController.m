//
//  ViewController.m
//  CarouselDemo
//
//  Created by Pan on 15/8/13.
//  Copyright (c) 2015年 Pan. All rights reserved.
//

#define IMAGE_URLSTRING0  @"http://pic.58pic.com/58pic/13/18/14/87m58PICVvM_1024.jpg"
#define IMAGE_URLSTRING1  @"http://pic.58pic.com/58pic/13/56/99/88f58PICuBh_1024.jpg"
#define PLACEHOLDER_IMAGE [UIImage imageNamed:@"placeholder"]

#import "ViewController.h"
#import "PSCarouselView.h"

@interface ViewController ()<PSCarouselDelegate>

@property (weak, nonatomic) IBOutlet PSCarouselView *carouselView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupCarouselView];
    [self setupPageControl];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.carouselView startMoving];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.carouselView stopMoving];
}

#pragma mark - Private Method

- (void)setupCarouselView
{
    self.carouselView.imageURLs = [self imageURLs];
    self.carouselView.placeholder = PLACEHOLDER_IMAGE;
    self.carouselView.pageDelegate = self;
    self.carouselView.autoMoving = YES;
    self.carouselView.movingTimeInterval = 1.5f;
}

- (void)setupPageControl
{
    self.pageControl.numberOfPages = [[self imageURLs] count];
}

- (NSArray *)imageURLs
{
    return @[[NSURL URLWithString:IMAGE_URLSTRING0],
             [NSURL URLWithString:IMAGE_URLSTRING1]];
}

#pragma mark - PSCarouselDelegate

- (void)carousel:(PSCarouselView *)carousel didMoveToPage:(NSUInteger)page
{
    NSLog(@"PSCarouselView did MOVE to No.%ld page",page);
    self.pageControl.currentPage = page;
}

- (void)carousel:(PSCarouselView *)carousel didTouchPage:(NSUInteger)page
{
    NSLog(@"PSCarouselView did TOUCH No.%ld page",page);
}

@end
