//
//  ViewController.m
//  Lab07_Push
//
//  Created by Luis on 7/13/16.
//  Copyright © 2016 Luis. All rights reserved.
//

#import "Start.h"
#import "Google/Analytics.h"
#import <DigitsKit/DigitsKit.h>

@interface Start ()
@property NSMutableArray *estadosArray;
@property NSMutableArray *escudosArray;
@property int *infotest;

@end

@implementation Start

/*************************************************************************/
#pragma mark - Initialization methods
/************************************************************************/
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initController];
    
    
    DGTAuthenticateButton *authButton;
    authButton = [DGTAuthenticateButton buttonWithAuthenticationCompletion:^(DGTSession *session, NSError *error) {
        if (session.userID) {
            // TODO: associate the session userID with your user model
            NSString *msg = [NSString stringWithFormat:@"Phone number: %@", session.phoneNumber];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You are logged in!"
                                                            message:msg
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        } else if (error) {
            NSLog(@"Authentication error: %@", error.localizedDescription);
        }
    }];
    authButton.center = self.view.center;
    [self.view addSubview:authButton];

    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSString *name = [NSString stringWithFormat:@"Pattern~%@", self.title];
    
    // The UA-XXXXX-Y tracker ID is loaded automatically from the
    // GoogleService-Info.plist by the `GGLContext` in the AppDelegate.
    // If you're copying this to an app just using Analytics, you'll
    // need to configure your tracking ID here.
    // [START screen_view_hit_objc]
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:name];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    // [END screen_view_hit_objc]
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-------------------------------------------------------------------------------
- (void)initController {
    self.estadosArray   = [[NSMutableArray alloc] initWithObjects: @"Aguascalientes", @"Guanajuato", @"Jalisco", @"Morelos", @"Nuevo Leon", nil];
    self.escudosArray   = [[NSMutableArray alloc] initWithObjects: @"ags.png", @"guan.jpg", @"jal.jpg", @"mor.jpg", @"Escudo-del-Estado-de-Nuevo-León.jpg", nil];
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
    cell.lblCell.text       = self.estadosArray[indexPath.row];
    cell.imgCell.image   = [UIImage imageNamed:self.escudosArray[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.infotest        = indexPath.row;
    // self.stDescriptionSelected  = self.destinationDescriptions[indexPath.row];
    // self.stPhotoSelected        = self.destinationPhotos[indexPath.row];
    [self performSegueWithIdentifier:@"SecondPage" sender:self];
}

/**********************************************************************************************/
#pragma mark - Navigation
/**********************************************************************************************/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[SecondPage class]]) {
        SecondPage *sp     = [segue destinationViewController];
        sp.infoFromHome     = self.infotest;
        // destination.destinationDescription  = self.stDescriptionSelected;
        // destination.destinationPhoto        = self.stPhotoSelected;
        
    }
}

@end
