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
#import "EPSCategory.h"
#import "EPSUser.h"

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
    [self.albumImageView setImageWithURL:[NSURL URLWithString:[epsAlbum urlThumb]] placeholderImage:[UIImage imageNamed:@"EPS-Logo"]];
    self.categoryLabel.text = epsAlbum.category.title;
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    
    self.dateLabel.text = [dateFormatter stringFromDate:epsAlbum.date];
    
    //On set maintenant le label qui affiche la liste des auteurs, le nom des auteurs sera en gras
    NSMutableAttributedString * authorsString = [[NSMutableAttributedString alloc] initWithString:@"Par : "];
    NSString * lastNameString = @"";
    for (EPSUser * reporter in epsAlbum.reporters) {
        lastNameString = [lastNameString stringByAppendingString:reporter.lastname];
        
        if (reporter != [epsAlbum.reporters lastObject]) {
            lastNameString = [lastNameString stringByAppendingString:@", "];
        }
    }
    //On passe en gros la liste des noms de auteurs
    NSAttributedString * boldString= [[NSAttributedString alloc] initWithString:lastNameString attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:self.authorsLabel.font.pointSize]}];
    [authorsString appendAttributedString:boldString];
    self.authorsLabel.attributedText = authorsString;
}

@end
