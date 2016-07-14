//
//  SecondPage.m
//  Lab07_Push
//
//  Created by Luis on 7/13/16.
//  Copyright © 2016 Luis. All rights reserved.
//

#import "SecondPage.h"

@interface SecondPage ()

@property NSMutableArray *municipiosArray;
@property NSMutableArray *escudos_mArray;

@property int *infoMun;
@property int *infoEst;
@end

@implementation SecondPage

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)initController {
    self.infoEst = (NSInteger)self.infoFromHome;
    
    if((int)self.infoFromHome==0)
    {
        self.municipiosArray   = [[NSMutableArray alloc] initWithObjects: @"Asientos", @"Calvillo", @"Jesus Maria", @"Pabellon", @"Rincon de Romos", nil];
        self.escudos_mArray   = [[NSMutableArray alloc] initWithObjects: @"asientos.jpg", @"Calvillo.png", @"jesusMaria.jpg.gif", @"pabellon.jpg", @"rincondeRomos.jpg", nil];
        
    }
    else if((int)self.infoFromHome==1)
    {
        self.municipiosArray   = [[NSMutableArray alloc] initWithObjects: @"Guanajuato", @"Leon", @"Moroleon", @"Salamanca", @"Valle de Santiago", nil];
        self.escudos_mArray   = [[NSMutableArray alloc] initWithObjects: @"Guanajuato.png", @"leonpng.png", @"moroleonpng.png", @"Salamancapng.png", @"Valle_de_Santiago.png", nil];
    }
    else if((int)self.infoFromHome==2)
    {
        self.municipiosArray   = [[NSMutableArray alloc] initWithObjects: @"Encarn. de Diaz", @"Jalostotitlan", @"Mazamitla", @"San J. de los L.", @"Tequila", nil];
        self.escudos_mArray   = [[NSMutableArray alloc] initWithObjects: @"encarnacion_de_diaz.jpg", @"jalostotitlan.jpg", @"mazamitla.gif", @"sanjuandeloslagos.png", @"tequila.jpg", nil];
    }
    else if((int)self.infoFromHome==3)
    {
        self.municipiosArray   = [[NSMutableArray alloc] initWithObjects: @"Axochiapan", @"Cuautla", @"Emiliano Zapata", @"Temixco", @"Totolapan", nil];
        self.escudos_mArray   = [[NSMutableArray alloc] initWithObjects: @"Axochiapan.jpg", @"Cuautla.png", @"Emiliano_Zapata.jpg", @"Temixco.jpg", @"Totolapan.png", nil];
    }
    else if((int)self.infoFromHome==4)
    {
        self.municipiosArray   = [[NSMutableArray alloc] initWithObjects: @"Abasolo", @"Allende", @"General Bravo", @"Santa Catarina", @"Villaldama", nil];
        self.escudos_mArray   = [[NSMutableArray alloc] initWithObjects: @"abasolo.jpg", @"allende.jpg", @"GeneralBravo.jpg", @"SantaCatarina.jpg", @"Villaldama.jpg", nil];
    }
    
    
}
//------------------------------------------------------------------------------------------



/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.municipiosArray.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    TableViewCell *cell2 = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    
    if (cell2 == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
        cell2 = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    }
    //Fill cell with info from arrays
    cell2.lblcell2.text       = self.municipiosArray[indexPath.row];
    cell2.imgcell2.image   = [UIImage imageNamed:self.escudos_mArray[indexPath.row]];
    
    return cell2;
}
//-------------------------------------------------------------------------------
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.infoMun        = indexPath.row;
    // self.stDescriptionSelected  = self.destinationDescriptions[indexPath.row];
    // self.stPhotoSelected        = self.destinationPhotos[indexPath.row];
    [self performSegueWithIdentifier:@"ThirdPage" sender:self];
}

/**********************************************************************************************/
#pragma mark - Navigation
/**********************************************************************************************/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[ThirdPage class]]) {
        ThirdPage *tp     = [segue destinationViewController];
        tp.infoMunicipio     = self.infoMun;
        tp.infoEstado = self.infoEst;
        
    }
}

@end
