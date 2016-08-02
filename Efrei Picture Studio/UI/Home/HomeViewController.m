//
//  HomeViewController.m
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 23/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import "HomeViewController.h"

//UI
#import "AlbumTableViewCell.h"

//Model
#import "EPSAlbum.h"
#import "EPSUser.h"

//Webservice
#import "ApiService.h"
#import "HomeResponse.h"
#import "KASlideShow.h"
#import "SliderResponse.h"
#import "EPSSlider.h"

@interface HomeViewController() <UITableViewDelegate, UITableViewDataSource, KASlideShowDelegate, KASlideShowDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong) HomeResponse* homeResponse;
@property(nonatomic, strong) UIRefreshControl* refreshControl;
@property(nonatomic, readwrite) Class classCell;
@property(nonatomic, strong) NSArray * carouselData;
@property(weak, nonatomic) IBOutlet KASlideShow * slideshow;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;

@end

@implementation HomeViewController


#define DelayBetweenTransitions 5

#pragma mark - Init

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    _refreshControl = [[UIRefreshControl alloc] init];
    [_refreshControl addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:_refreshControl];
    self.tableView.dataSource = self;
    _classCell = [AlbumTableViewCell class];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(_classCell) bundle:[NSBundle bundleForClass:_classCell]] forCellReuseIdentifier:NSStringFromClass(_classCell)];
    
    
    [self refreshData];
    
    
    //    self.slideshow = [[KASlideShow alloc] initWithFrame:CGRectMake(0,0,320,0)];
    self.slideshow.delegate = self;
    [self.slideshow setDelay:DelayBetweenTransitions]; // Delay between transitions
    [self.slideshow setTransitionDuration:1]; // Transition duration
    [self.slideshow setTransitionType:KASlideShowTransitionFade]; // Choose a transition type
    [self.slideshow setImagesContentMode:UIViewContentModeScaleAspectFill]; // Choose a content mode for images to display
    [self.slideshow addGesture:KASlideShowGestureTap]; // Gesture to go previous/next directly on the image
    
    [self refreshCarousel];
    //    [self performSelector:@selector(refreshCarousel) withObject:nil afterDelay:2];
}


- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - UI

#define AnimationDurationSlider 0.6

- (void) setCurrentSlider:(EPSSlider *) slider {
    if (slider) {
        self.sliderLabel.superview.alpha = 0;
        self.sliderLabel.text = [NSString stringWithFormat:@"%@, par %@  ", slider.album.name, slider.user.username];
        self.sliderLabel.superview.hidden = NO;
        [UIView animateWithDuration:AnimationDurationSlider animations:^{
            self.sliderLabel.superview.alpha = 1;
        }];
    }
    else {
        [UIView animateWithDuration:AnimationDurationSlider animations:^{
            self.sliderLabel.superview.alpha = 0;
        } completion:^(BOOL finished) {
            self.sliderLabel.superview.hidden = YES;
        }];
    }
}


#pragma mark - Refresh Data



- (void) refreshView {
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
    
}


#pragma mark - <KASlideShowDataSource>

- (NSObject *)slideShow:(KASlideShow *)slideShow objectAtIndex:(NSUInteger)index {
    EPSSlider * slider = self.carouselData[index];
    return [NSURL URLWithString:[slider urlPhoto]];
}

- (NSUInteger)slideShowImagesNumber:(KASlideShow *)slideShow {
    return self.carouselData.count;
}

#pragma mark - <KASlideShowDelegate>

- (void) slideShowWillShowNext:(KASlideShow *)slideShow {
    [self setCurrentSlider:nil];
}

- (void) slideShowDidShowNext:(KASlideShow *) slideShow {
    EPSSlider * slider = self.carouselData[slideShow.currentIndex];
    [self setCurrentSlider:slider];
    
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.homeResponse.albums count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AlbumTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(_classCell)];
    cell.epsAlbum = [self.homeResponse.albums objectAtIndex:indexPath.row];
    return cell;
}



#pragma mark - <UITableViewDelegate>

#pragma mark - Webservice

- (void) refreshData {
    [self.refreshControl beginRefreshing];
    [APISERVICE getHomeWithSuccess:^(HomeResponse *homeResponse) {
        self.homeResponse = homeResponse;
        [self refreshView];
    } andFailure:^(NSError *error) {
        NSLog(@"%@", [error description]);
        [self refreshView];
        
    }];
}

- (void) refreshCarousel {
    [self.refreshControl beginRefreshing];
    [APISERVICE getSliderWithSuccess:^(SliderResponse *sliderResponse) {
        
        //Carousel
        self.carouselData = sliderResponse.sliders;
        [self setCurrentSlider:[self.carouselData firstObject]];
        self.sliderLabel.superview.hidden = NO;
        self.slideshow.datasource = self;
        [self.slideshow performSelector:@selector(start) withObject:nil afterDelay:DelayBetweenTransitions];
        
    } andFailure:^(NSError *error) {
        NSLog(@"%@", [error description]);
        [self refreshView];
        
    }];
}

#pragma mark - Memory Manager

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
