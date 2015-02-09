//
//  VOSNoteViewController.m
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 5/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

//Constantes
#define NUMBER_OF_SECTIONS 4
#define NAME_SECTION_HEADER @"Name"
#define DATES_SECTION_HEADER @"Created and last modified"
#define TEXT_SECTION_HEADER @"Text"
#define PHOTO_SECTION_HEADER @"Photo"
#define NAME_SECTION    0
#define DATES_SECTION   1
#define TEXT_SECTION    2
#define PHOTO_SECTION   3


#import "VOSNoteViewController.h"
#import "VOSNote.h"
#import "VOSNameTableViewCell.h"
#import "VOSTextTableViewCell.h"
#import "VOSDatesTableViewCell.h"
#import "VOSPhotoTableViewCell.h"
#import "VOSPhotoViewController.h"


@interface VOSNoteViewController ()

@end

@implementation VOSNoteViewController

-(id) initWithModel:(VOSNote *) model{
    if (self =[super initWithNibName:nil bundle:nil]){
        _note = model;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // refrescamos los datos de pantalla para cuando volvamos
    [self.tableView reloadData ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self registerNibs];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case NAME_SECTION:
            return NAME_SECTION_HEADER;
            break;
            
        case DATES_SECTION:
            return DATES_SECTION_HEADER;
            break;
            
        case TEXT_SECTION:
            return TEXT_SECTION_HEADER;
            break;
            
        case PHOTO_SECTION:
            return PHOTO_SECTION_HEADER;
            break;
            
        default:
            [NSException raise:@"Section do not exist" format:nil];
            return @"Section not exist";
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguamos de qué celda nos habla
    switch (indexPath.section) {
        case NAME_SECTION:{
            VOSNameTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[VOSNameTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
        break;}
    
        case DATES_SECTION:{
            VOSDatesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[VOSDatesTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;}
            
        case TEXT_SECTION:{
            VOSTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[VOSTextTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;}
            
        case PHOTO_SECTION:{
            VOSPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[VOSPhotoTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;}
            
        default:
            [NSException raise:@"UnkownSection"
                        format:@"Unknown section %ld",(long)indexPath.section];
            return nil;
            break;
    }
}


-(CGFloat) tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case NAME_SECTION:
            return [VOSNameTableViewCell height];
            break;
            
            
        case DATES_SECTION:
            return [VOSDatesTableViewCell height];
            break;
            
        case TEXT_SECTION:
            return [VOSTextTableViewCell height];
            break;
            
        case PHOTO_SECTION:
            return [VOSPhotoTableViewCell height];
            break;
            
        default:
            return 0;
            break;
    }
}


-(void) registerNibs{
    
    NSBundle *main = [NSBundle mainBundle];
    
    UINib *nameNib = [UINib nibWithNibName:@"VOSNameTableViewCell"
                                    bundle:main];
    [self.tableView registerNib:nameNib forCellReuseIdentifier:[VOSNameTableViewCell cellId]];
    
    
    UINib *datesNib = [UINib nibWithNibName:@"VOSDatesTableViewCell" bundle:main];
    [self.tableView registerNib:datesNib forCellReuseIdentifier:[VOSDatesTableViewCell  cellId]];
    
    UINib *textNib = [UINib nibWithNibName:@"VOSTextTableViewCell" bundle:main];
    
    [self.tableView registerNib:textNib forCellReuseIdentifier:[VOSTextTableViewCell cellId]];
    
    UINib *photoNib = [UINib nibWithNibName:@"VOSPhotoTableViewCell" bundle:main];
    [self.tableView registerNib:photoNib forCellReuseIdentifier:[VOSPhotoTableViewCell cellId]];
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == PHOTO_SECTION) {
        
        
        // Mostramos el controlador de Fotos
        VOSPhotoViewController *pVC = [[VOSPhotoViewController alloc] initWithModel:self.note];
        
        [self.navigationController pushViewController:pVC
                                             animated:YES];
        
    }
}

@end
