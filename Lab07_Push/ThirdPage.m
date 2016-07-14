//
//  ThirdPage.m
//  Lab07_Push
//
//  Created by Luis on 7/13/16.
//  Copyright © 2016 Luis. All rights reserved.
//

#import "ThirdPage.h"
@import GoogleMaps;
@interface ThirdPage ()

@end

@implementation ThirdPage{
    GMSMapView *mapView_;
    NSString *municipio_;
    long latitud;
    long longitud;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMap];
    // Do any additional setup after loading the view.
    if (self.infoEstado == 0)
    {
        if (self.infoMunicipio == 0)
        {
            //self.imageMun.image = [UIImage imageNamed:@"asientos.jpg"];
            self.lblthird.text = @"Asientos";
            //self.self.LabelDesc.text = @"Asientos tiene una altura promedio de 2150 msnm. Se localiza a una distancia de 59 km de la ciudad capital del estado, la ciudad de Aguascalientes.";
        }
        else if (self.infoMunicipio == 1)
        {
            //self.imageMun.image = [UIImage imageNamed:@"Calvillo.png"];
            self.lblthird.text = @"Calvillo";
            //self.self.LabelDesc.text = @"Calvillo colinda con los municipios de San José de Gracia, Jesús María y Aguascalientes. Su extensión territorial es de 931.26 km².";
        }
        else if (self.infoMunicipio == 2)
        {
            //self.imageMun.image = [UIImage imageNamed:@"jesusMaria.jpg.gif"];
            self.lblthird.text = @"Jesus Maria";
            //self.self.LabelDesc.text = @"Jesús María esta situada a 11 km de la capital del estado y cabecera del municipio de Jesús María. Es la segunda ciudad más poblada del estado.";
        }
        else if (self.infoMunicipio == 3)
        {
            //self.imageMun.image = [UIImage imageNamed:@"pabellon.jpg"];
            self.lblthird.text = @"Pabellon de Arteaga";
            //self.self.LabelDesc.text = @"Se encuentra en el centro del estado, tuvo su origen en el establecimiento de una colonia de trabajadores de la construcción de la Presa Calles.";
        }
        else if(self.infoMunicipio == 4)
        {
            //self.imageMun.image = [UIImage imageNamed:@"rincondeRomos.jpg"];
            self.lblthird.text = @"Rincon de Romos";
            //self.self.LabelDesc.text = @"Forma parte de la provincia de la Sierra Madre Occidental, presentando características de relieves y zonas accidentadas.";
        }
    }
    
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

- (void)createMap {
    if (self.infoEstado == 0)
    {
        if (self.infoMunicipio == 0)
        {
            
            //self.LabelMun.text = @"Asientos";
            municipio_= @"*Asientos";
            latitud=22.2393216;
            longitud=-102.1997842;
        }
        else if (self.infoMunicipio == 1)
        {
            //self.LabelMun.text = @"Calvillo";
            municipio_= @"*Calvillo";
            latitud=21.846954;
            longitud=-102.716095;
        }
        else if (self.infoMunicipio == 2)
        {
            //self.LabelMun.text = @"Jesus Maria";
            municipio_= @"*Jesus Maria";
            latitud=21.961825;
            longitud=-102.344206;
        }
        else if (self.infoMunicipio == 3)
        {
            //self.LabelMun.text = @"Pabellon de Arteaga";
            municipio_= @"Pabellon de Arteaga";
            latitud=22.142999;
            longitud=-102.274159;
            
        }
        else if(self.infoMunicipio == 4)
        {
            //self.LabelMun.text = @"Rincon de Romos";
            municipio_= @"Rincon de Romos";
            latitud=22.230804;
            longitud=-102.320812;
            
        }
    }
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:latitud
                                                            longitude:longitud
                                                                 zoom:17];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(latitud, longitud);
    marker.title = municipio_;
    marker.snippet = @"Municipio";
    marker.map = mapView_;
}

@end
