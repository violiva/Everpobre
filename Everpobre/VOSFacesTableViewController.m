//
//  VOSFacesTableViewController.m
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 9/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSFacesTableViewController.h"

@interface VOSFacesTableViewController ()

@end

@implementation VOSFacesTableViewController

-(id) initWithModel: (NSArray *) aFaces
              style:(UITableViewStyle) style
                img:(UIImage *) img{
    if (self = [super initWithStyle:style] ){
        _faces = aFaces;
        _imgOriginal = img;
        
        self.title = @"Caras reconocidas";
    }
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.faces count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguamos la cara
    CIFeature * face = [self.faces objectAtIndex:indexPath.row];
    CGRect faceBounds = [face bounds];

    CIImage * img = [CIImage imageWithCGImage:self.imgOriginal.CGImage];
    CIImage * crop = [img imageByCroppingToRect:faceBounds];
    
    UIImage * newImage =[UIImage imageWithCIImage:crop];

    // Creamos la celda
    static NSString * cellId = @"faceCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    // la configuramos
    cell.imageView.image = newImage;
    cell.textLabel.text = [NSString stringWithFormat: @"Face %d", indexPath.row+1];
    cell.detailTextLabel.text = [NSString stringWithFormat: @"recognized %d", indexPath.row+1];;
    
    // la devolvemos
    return cell;
    
}

@end
