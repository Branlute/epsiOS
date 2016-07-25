 //
//  AlbumTableViewCell.m
//  Efrei Picture Studio
//
//  Created by Thomas Lanquetin on 27/12/2015.
//  Copyright © 2015 Thomas Lanquetin. All rights reserved.
//

#import "AlbumTableViewCell.h"

//Model
#import "EPSAlbum.h"

//Utils
#import "UIImageView+AFNetworking.h"

@interface AlbumTableViewCell ()

@end

@implementation AlbumTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void) setEpsAlbum:(EPSAlbum *)epsAlbum {
    _epsAlbum = epsAlbum;
    self.titleLabel.text = epsAlbum.name;
    [self.albumImageView setImageWithURL:[NSURL URLWithString:[epsAlbum urlThumb]]];
}

@end
