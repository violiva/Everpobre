//
//  VOSPhotoViewController.m
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 5/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import CoreImage;

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
    // Utilizaremos un Picker. UIImagePickerController
    
    // creamos un Picker
    UIImagePickerController * picker = [UIImagePickerController new];
    
    // configurar
    // como averiguar si hay cámara
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        // tenemos cámara
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
    }else{
        // nos conformamos con el carrete
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    picker.delegate = self;
    
    // ponemos transiciones para mostrar el carrete.
//    picker.modalTransitionStyle = UIModalTransitionStylePartialCurl;  // no funciona bien ya que no se produce un viewWillAppear y
    picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    
    // presentar
    [self presentViewController:picker
                       animated:YES
                     completion:^{
                                NSLog(@"terminé");
                                }];
}

- (IBAction)deletePhoto:(id)sender {
    
    CGRect oldRect = self.photoView.bounds;
    
    // Animación
    [UIView animateWithDuration:0.8
                          delay:0
                        options:0
                     animations:^{
                         // estado final ( se va a animar )
                         self.photoView.bounds = CGRectZero;
                         self.photoView.alpha = 0;
    }
                     completion:^(BOOL finished) {
                         // Quitar la foto del modelo
                         self.model.photo.image = nil;
                         
                         // Quitarla de la vista
                         self.photoView.image = nil;
                         
                         // dejamos la vista como estaba para cuando vuelvan a seleccionar nueva imagen
                         self.photoView.bounds = oldRect;
                         self.photoView.alpha = 1.0;
                     }];
    
    [UIView animateWithDuration: 0.8
                          delay: 0
         usingSpringWithDamping: 0.4 // factor resistencia del muelle. Si es 1 el muelle rebota pocas veces al ser muy duro
          initialSpringVelocity: 0.4
                        options: 0
                     animations:^{
                         // transformada afin
                         self.photoView.transform = CGAffineTransformMakeRotation(M_PI_2);
                     }
                     completion:^(BOOL finished) {
                         //
                         self.photoView.transform = CGAffineTransformIdentity;
                     }];
}

- (IBAction)Vintage:(id)sender {
    
    // Creamos un contexto
    CIContext * context = [CIContext contextWithOptions:nil];
    
    // Obtenemos la imagen original
    CIImage * original = [CIImage imageWithCGImage:self.model.photo.image.CGImage];
    
    // Creamos y configuramos el filtro
    CIFilter * falseColor = [CIFilter filterWithName:@"CIFalseColor"];
    [falseColor setDefaults];
    [falseColor setValue:original forKey:@"inputImage"];
    
    // Obtengo la imagen de salida
    CIImage * output = falseColor.outputImage;
    
    // Creamos el filtro de viñeta
    CIFilter * vignette = [CIFilter filterWithName:@"CIVignette"];
    [vignette setDefaults];
    [vignette setValue:@4
                forKey:@"InputIntensity"];
    
    // los encadenamos
    [vignette setValue:output forKey:@"InputImage"];
    output = vignette.outputImage;
    
    // Aplicamos los filtros
    CGImageRef final = [context createCGImage:output
                                     fromRect:[output extent]];
    
    // Obtengo la imagen en forma de UIImage
    UIImage * finalImg = [UIImage imageWithCGImage:final];
    
    // Liberamos recursos
    CGImageRelease(final);
    
    // Encasquetamos en UIImageView
    self.photoView.image = finalImg;
    self.model.photo.image = finalImg;
    
}

- (IBAction)faceRecognition:(id)sender {

    // Analizamos la imagen para ver cuantas caras detecta en ellas
    // Nos devolverá un array con las caras localizadas
    NSArray * features = [self featuresInImage:self.photoView.image];
    
    if (features){
        CIFeature * face = [features lastObject];
        CGRect faceBounds = [face bounds];
        
        CIImage * img = [CIImage imageWithCGImage:self.photoView.image.CGImage];
        CIImage * crop = [img imageByCroppingToRect:faceBounds];
        
        UIImage * newImage =[UIImage imageWithCIImage:crop];

        // Encasquetamos en UIImageView la última cara reconocida
        self.photoView.image = newImage;
        self.model.photo.image = newImage;
    }
}



-(NSArray *) featuresInImage:(UIImage *) imageOrigin{
    CIContext * context = [CIContext contextWithOptions:nil];
    CIDetector * faceDetector = [CIDetector detectorOfType:CIDetectorTypeFace
                                                   context:context
                                                   options:@{CIDetectorAccuracy :
                                                                 CIDetectorAccuracyHigh}];
    CIImage * image = [CIImage imageWithCGImage:[imageOrigin CGImage]];
    NSArray * features = [faceDetector featuresInImage:image];
    if ( [features count]){
        return features;
    }else{
        return nil;
    }
    
}


#pragma mark - UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    // OJO !!! Pico de memoria
    self.model.photo.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    
    // Ocultar el picker
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    
    //
}


@end
