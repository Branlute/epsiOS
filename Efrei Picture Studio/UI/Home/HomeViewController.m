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

//Webservice
#import "ApiService.h"
#import "HomeResponse.h"

@interface HomeViewController() <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong) HomeResponse* homeResponse;
@property(nonatomic, strong) UIRefreshControl* refreshControl;
@property(nonatomic, readwrite) Class classCell;

@end

@implementation HomeViewController




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
}


#pragma mark - Refresh Data



- (void) refreshView {
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
    
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

#pragma mark - Memory Manager

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
