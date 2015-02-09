//
//  VOSNotesViewController.m
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 4/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSNotesViewController.h"
#import "VOSNote.h"
#import "VOSPhotoContainer.h"
#import "VOSNoteViewController.h"


@implementation VOSNotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // agregamos el botón de añadir notas.
    UIBarButtonItem * b = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                             action:@selector( addNote: )];
    
    self.navigationItem.rightBarButtonItem = b;

}

-(void) viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    self.title = self.notebook.name;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar la nota
    VOSNote * n = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Creamos la celda
    static NSString * cellId = @"noteCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    // la configuramos
    cell.imageView.image = n.photo.image;
    cell.textLabel.text = n.name;
    NSDateFormatter * fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateIntervalFormatterMediumStyle;
    cell.detailTextLabel.text = [fmt stringFromDate:n.modificationDate];
    
    // la devolvemos
    return cell;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar si el usuario quiere definitivamente eliminar el registro
    if ( editingStyle == UITableViewCellEditingStyleDelete ){
        
        // Averiguo la celda
        VOSNote *difunto = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        // la elimino
        NSManagedObjectContext * ctxt = self.notebook.managedObjectContext;

        [ctxt deleteObject:difunto];
    }
}


// Personalización del título del botón que aparece con el gesto de deslizar a la izquierda. Por defecto viene como Delete.
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remove";
}


#pragma mark - Actions
-(void) addNote:(id) sender{
    [VOSNote noteWithName:@"Nueva Nota"
                 notebook:self.notebook
                  context:self.notebook.managedObjectContext];
}

#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // Averiguar la nota
    VOSNote * note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // crear formulario de nota
    VOSNoteViewController * nVC = [[VOSNoteViewController alloc] initWithModel:note];
    
    // Hacerle push
    [self.navigationController pushViewController:nVC animated:YES];
    
}

@end
