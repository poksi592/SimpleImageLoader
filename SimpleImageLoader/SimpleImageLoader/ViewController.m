//
//  ViewController.m
//  SimpleImageLoader
//
//  Created by Mladen Despotovic on 26/11/14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//

#import "ViewController.h"
#import "TestTableCell.h"
#import "UIImageView+ImageLoader.h"

static NSString * const CellIdentifier = @"TestCellIdentifier";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, weak) UIImage *placeholderImage;
@property (nonatomic, weak) IBOutlet UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.placeholderImage = [UIImage imageNamed:@"placeholder_image"];
    self.myTableView.rowHeight = 90.0f;
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"TestTableCell"
                                                 bundle:nil]
                                forCellReuseIdentifier:CellIdentifier];
    
    self.dataArray = @[@"http://upload.wikimedia.org/wikipedia/commons/2/22/Turkish_Van_Cat.jpg",
                       @"http://animalia-life.com/data_images/cat/cat1.jpg",
                       @"http://www.vetprofessionals.com/catprofessional/images/home-cat.jpg",
                       @"http://static.tumblr.com/81b6d42b4064def5e9062d5f4410c820/betml74/Yl5ml0lia/tumblr_static_impress.jpg",
                       @"http://i.huffpost.com/gen/964776/thumbs/o-CATS-KILL-BILLIONS-facebook.jpg",
                       @"http://animalia-life.com/data_images/cat/cat5.jpg",
                       @"http://www.bhmpics.com/download/havana_yellow_cat-wide.jpg",
                       @"http://www.exohuman.com/wordpress/wp-content/uploads/2012/01/cat_reading.jpg",
                       @"http://upload.wikimedia.org/wikipedia/commons/2/22/Turkish_Van_Cat.jpg",
                       @"http://animalia-life.com/data_images/cat/cat1.jpg",
                       @"http://www.vetprofessionals.com/catprofessional/images/home-cat.jpg",
                       @"http://static.tumblr.com/81b6d42b4064def5e9062d5f4410c820/betml74/Yl5ml0lia/tumblr_static_impress.jpg",
                       @"http://i.huffpost.com/gen/964776/thumbs/o-CATS-KILL-BILLIONS-facebook.jpg",
                       @"http://animalia-life.com/data_images/cat/cat5.jpg",
                       @"http://www.bhmpics.com/download/havana_yellow_cat-wide.jpg",
                       @"http://www.exohuman.com/wordpress/wp-content/uploads/2012/01/cat_reading.jpg",
                       @"http://upload.wikimedia.org/wikipedia/commons/2/22/Turkish_Van_Cat.jpg",
                       @"http://animalia-life.com/data_images/cat/cat1.jpg",
                       @"http://www.vetprofessionals.com/catprofessional/images/home-cat.jpg",
                       @"http://static.tumblr.com/81b6d42b4064def5e9062d5f4410c820/betml74/Yl5ml0lia/tumblr_static_impress.jpg",
                       @"http://i.huffpost.com/gen/964776/thumbs/o-CATS-KILL-BILLIONS-facebook.jpg",
                       @"http://animalia-life.com/data_images/cat/cat5.jpg",
                       @"http://www.bhmpics.com/download/havana_yellow_cat-wide.jpg",
                       @"http://www.exohuman.com/wordpress/wp-content/uploads/2012/01/cat_reading.jpg",
                       @"http://upload.wikimedia.org/wikipedia/commons/2/22/Turkish_Van_Cat.jpg",
                       @"http://animalia-life.com/data_images/cat/cat1.jpg",
                       @"http://www.vetprofessionals.com/catprofessional/images/home-cat.jpg",
                       @"http://static.tumblr.com/81b6d42b4064def5e9062d5f4410c820/betml74/Yl5ml0lia/tumblr_static_impress.jpg",
                       @"http://i.huffpost.com/gen/964776/thumbs/o-CATS-KILL-BILLIONS-facebook.jpg",
                       @"http://animalia-life.com/data_images/cat/cat5.jpg",
                       @"http://www.bhmpics.com/download/havana_yellow_cat-wide.jpg",
                       @"http://www.exohuman.com/wordpress/wp-content/uploads/2012/01/cat_reading.jpg",
                       @"http://upload.wikimedia.org/wikipedia/commons/2/22/Turkish_Van_Cat.jpg",
                       @"http://animalia-life.com/data_images/cat/cat1.jpg",
                       @"http://www.vetprofessionals.com/catprofessional/images/home-cat.jpg",
                       @"http://static.tumblr.com/81b6d42b4064def5e9062d5f4410c820/betml74/Yl5ml0lia/tumblr_static_impress.jpg",
                       @"http://i.huffpost.com/gen/964776/thumbs/o-CATS-KILL-BILLIONS-facebook.jpg",
                       @"http://animalia-life.com/data_images/cat/cat5.jpg",
                       @"http://www.bhmpics.com/download/havana_yellow_cat-wide.jpg",
                       @"http://www.exohuman.com/wordpress/wp-content/uploads/2012/01/cat_reading.jpg"];
                      }


#pragma mark UITableView methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    

        
    cell.cellLabel.text = [NSString stringWithFormat:@"Table Row %d",indexPath.row];

    
    [cell.testImageView setImageWithURLString:self.dataArray[indexPath.row]
                             placeholderImage:self.placeholderImage
                              completionBlock:^(NSError *paramError) {

    
                              }];
    
    return cell;
}




@end
