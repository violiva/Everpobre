//
//  VOSPhotoViewController.m
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 5/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSPhotoViewController.h"
#import "VOSNote.h"
#import "VOSPhotoContainer.h"


@interface VOSPhotoViewController ()
@property (strong,nonatomic) VOSNote * model;
@end

@implementation VOSPhotoViewController

-(id)initWithModel:(VOSNote *) model{
    if (self = [super initWithNibName:nil bundle:nil]){
        _model = model;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // sincronizamos modelo y vista
    self.photoView.image = self.model.photo.image;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    // sincronizamos vista -> modelo
    self.model.photo.image = self.photoView.image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)takePhoto:(id)sender {
}

- (IBAction)deletePhoto:(id)sender {
}
@end
