//
//  AlbumTableViewCell.h
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 27/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EPSAlbum;

@interface AlbumTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorsLabel;

@property (nonatomic, strong) EPSAlbum * epsAlbum;

@end
