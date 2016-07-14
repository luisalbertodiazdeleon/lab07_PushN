//
//  ViewController.m
//  Lab07_Push
//
//  Created by Luis on 7/13/16.
//  Copyright © 2016 Luis. All rights reserved.
//

#import "Start.h"

@interface Start ()
@property NSMutableArray *estadosArray;
@property NSMutableArray *escudosArray;


@end

@implementation Start

/*************************************************************************/
#pragma mark - Initialization methods
/************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-------------------------------------------------------------------------------
- (void)initController {
    self.estadosArray   = [[NSMutableArray alloc] initWithObjects: @"Aguascalientes", @"Guanajuato", @"Jalisco", @"Morelos", @"Nuevo Leon", nil];
    self.escudosArray   = [[NSMutableArray alloc] initWithObjects: @"ags.png", @"guan.jpg", @"jal.jpg", @"mor.jpg", @"NL.jpg", nil];
}

/****************************************************************/
#pragma mark - Table source and delegate methods
/************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.estadosArray.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    CellStart *cell = (CellStart *)[tableView dequeueReusableCellWithIdentifier:@"CellStart"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"CellStart" bundle:nil] forCellReuseIdentifier:@"CellStart"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellStart"];
    }
    //Fill cell with info from arrays
    //cell.lblDD.text       = self.estadosArray[indexPath.row];
    //cell.ImagD.image   = [UIImage imageNamed:self.escudosArray[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //----self.infotest        = indexPath.row;
    // self.stDescriptionSelected  = self.destinationDescriptions[indexPath.row];
    // self.stPhotoSelected        = self.destinationPhotos[indexPath.row];
    //-----[self performSegueWithIdentifier:@"SecondPage" sender:self];
}

@end
