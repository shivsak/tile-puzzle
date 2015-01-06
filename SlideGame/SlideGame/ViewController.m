//
//  ViewController.m
//  SlideGame
//
//  Created by Shiv Sakhuja on 25/05/14.
//  Copyright (c) 2014 Shiv Sakhuja. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property int moves;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
    }
    self.imageView.hidden = YES;

    self.moves = 0;
    self.imageView.image = [UIImage imageNamed:@"tiger_original_square_small.png"];
    [self shuffle:nil];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    [self assignPieces:nil];
}

- (IBAction)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    self.imageView.hidden = YES;
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    [self shuffle:nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(NSMutableArray *)getImagesFromImage:(UIImage *)image withRow:(NSInteger)rows withColumn:(NSInteger)columns
{
    //Split Image into parts
    
    NSMutableArray *imagesArray = [NSMutableArray array];
    CGFloat xInitial = 0.0;
    CGFloat yInitial = 0.0;
    CGFloat imgWidth = image.size.width/rows;
    CGFloat imgHeight = image.size.height/columns;
    for (int y = 0; y < columns; y++) {
        xInitial = 0.0;
        for (int x = 0; x < rows; x++) {
            
            CGRect rect = CGRectMake(xInitial, yInitial, imgWidth, imgHeight);
            CGImageRef cImage = CGImageCreateWithImageInRect([image CGImage],  rect);
            
            UIImage *dImage = [[UIImage alloc] initWithCGImage:cImage];
            [imagesArray addObject:dImage];
            xInitial += imgWidth;
        }
        yInitial += imgHeight;
    }
    return imagesArray;
}

-(IBAction)assignPieces:(id)sender {
    
    self.imageView.hidden = YES;
    
    //1,
    CGRect frame_view1 = view1.frame;
    frame_view1.origin.x = 0;
    frame_view1.origin.y = 0;
    
    CGRect frame_view2 = view2.frame;
    frame_view2.origin.x = 80;
    frame_view2.origin.y = 0;
    
    CGRect frame_view3 = view3.frame;
    frame_view3.origin.x = 160;
    frame_view3.origin.y = 0;
    
    CGRect frame_view4 = view4.frame;
    frame_view4.origin.x = 240;
    frame_view4.origin.y = 0;
    
    //2,
    CGRect frame_view5 = view5.frame;
    frame_view5.origin.x = 0;
    frame_view5.origin.y = 80;
    
    CGRect frame_view6 = view6.frame;
    frame_view6.origin.x = 80;
    frame_view6.origin.y = 80;
    
    CGRect frame_view7 = view7.frame;
    frame_view7.origin.x = 160;
    frame_view7.origin.y = 80;
    
    CGRect frame_view8 = view8.frame;
    frame_view8.origin.x = 240;
    frame_view8.origin.y = 80;
    
    //3,
    CGRect frame_view9 = view9.frame;
    frame_view9.origin.x = 0;
    frame_view9.origin.y = 160;
    
    CGRect frame_view10 = view10.frame;
    frame_view10.origin.x = 80;
    frame_view10.origin.y = 160;
    
    CGRect frame_view11 = view11.frame;
    frame_view11.origin.x = 160;
    frame_view11.origin.y = 160;
    
    CGRect frame_view12 = view12.frame;
    frame_view12.origin.x = 240;
    frame_view12.origin.y = 160;
    
    
    //4,
    CGRect frame_view13 = view13.frame;
    frame_view13.origin.x = 0;
    frame_view13.origin.y = 240;
    
    CGRect frame_view14 = view14.frame;
    frame_view14.origin.x = 80;
    frame_view14.origin.y = 240;
    
    CGRect frame_view15 = view15.frame;
    frame_view15.origin.x = 160;
    frame_view15.origin.y = 240;
    
    CGRect frame_view16 = view16.frame;
    frame_view16.origin.x = 240;
    frame_view16.origin.y = 240;
    
    CGRect frame_viewBlankYellow = viewBlankYellow.frame;
    frame_viewBlankYellow.origin.x = 240;
    frame_viewBlankYellow.origin.y = 320;

    [UIView setAnimationDuration:0.5];
    [UIView beginAnimations:nil context:nil];
    
    view1.frame = frame_view1;
    view2.frame = frame_view2;
    view3.frame = frame_view3;
    view4.frame = frame_view4;
    
    view5.frame = frame_view5;
    view6.frame = frame_view6;
    view7.frame = frame_view7;
    view8.frame = frame_view8;
    
    view9.frame = frame_view9;
    view10.frame = frame_view10;
    view11.frame = frame_view11;
    view12.frame = frame_view12;
    
    view13.frame = frame_view13;
    view14.frame = frame_view14;
    view15.frame = frame_view15;
    view16.frame = frame_view16;
    
    viewBlankYellow.frame = frame_viewBlankYellow;
    
    [UIView commitAnimations];
    
}

-(IBAction)pieceTouched:(id)sender {
    NSLog(@"Button Tapped: %i", (int)[sender tag]);
    CGRect frame_view1 = view1.frame;
    CGRect frame_view2 = view2.frame;
    CGRect frame_view3 = view3.frame;
    CGRect frame_view4 = view4.frame;
    
    CGRect frame_view5 = view5.frame;
    CGRect frame_view6 = view6.frame;
    CGRect frame_view7 = view7.frame;
    CGRect frame_view8 = view8.frame;
    
    CGRect frame_view9 = view9.frame;
    CGRect frame_view10 = view10.frame;
    CGRect frame_view11 = view11.frame;
    CGRect frame_view12 = view12.frame;
    
    CGRect frame_view13 = view13.frame;
    CGRect frame_view14 = view14.frame;
    CGRect frame_view15 = view15.frame;
    CGRect frame_view16 = view16.frame;
    
    CGRect frame_viewBlankYellow = viewBlankYellow.frame;

    NSInteger puzzleButtonTag = [sender tag];
    switch (puzzleButtonTag) {
        case 1:
            if (frame_viewBlankYellow.origin.x == frame_view1.origin.x + 80 && frame_viewBlankYellow.origin.y == frame_view1.origin.y) {
                frame_view1.origin.x += 80;
                frame_viewBlankYellow.origin.x -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.x == frame_view1.origin.x - 80 && frame_viewBlankYellow.origin.y == frame_view1.origin.y) {
                frame_view1.origin.x -= 80;
                frame_viewBlankYellow.origin.x += 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view1.origin.y + 80 && frame_viewBlankYellow.origin.x == frame_view1.origin.x) {
                frame_view1.origin.y += 80;
                frame_viewBlankYellow.origin.y -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view1.origin.y - 80 && frame_viewBlankYellow.origin.x == frame_view1.origin.x) {
                frame_view1.origin.y -= 80;
                frame_viewBlankYellow.origin.y += 80;
                
            }
            else {
                
            };
            [UIView setAnimationDuration:0.15];
            [UIView beginAnimations:nil context:nil];
            
            view1.frame = frame_view1;
            viewBlankYellow.frame = frame_viewBlankYellow;
            
            [UIView commitAnimations];
            ;
            break;
            
        case 2:
            if (frame_viewBlankYellow.origin.x == frame_view2.origin.x + 80 && frame_viewBlankYellow.origin.y == frame_view2.origin.y) {
                frame_view2.origin.x += 80;
                frame_viewBlankYellow.origin.x -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.x == frame_view2.origin.x - 80 && frame_viewBlankYellow.origin.y == frame_view2.origin.y) {
                frame_view2.origin.x -= 80;
                frame_viewBlankYellow.origin.x += 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view2.origin.y + 80 && frame_viewBlankYellow.origin.x == frame_view2.origin.x) {
                frame_view2.origin.y += 80;
                frame_viewBlankYellow.origin.y -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view2.origin.y - 80 && frame_viewBlankYellow.origin.x == frame_view2.origin.x) {
                frame_view2.origin.y -= 80;
                frame_viewBlankYellow.origin.y += 80;
                
            }
            else {
                
            };
            
            [UIView setAnimationDuration:0.15];
            [UIView beginAnimations:nil context:nil];
            
            view2.frame = frame_view2;
            viewBlankYellow.frame = frame_viewBlankYellow;
            
            [UIView commitAnimations];
            
            break;
            
        case 3:
            if (frame_viewBlankYellow.origin.x == frame_view3.origin.x + 80 && frame_viewBlankYellow.origin.y == frame_view3.origin.y) {
                frame_view3.origin.x += 80;
                frame_viewBlankYellow.origin.x -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.x == frame_view3.origin.x - 80 && frame_viewBlankYellow.origin.y == frame_view3.origin.y) {
                frame_view3.origin.x -= 80;
                frame_viewBlankYellow.origin.x += 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view3.origin.y + 80 && frame_viewBlankYellow.origin.x == frame_view3.origin.x) {
                frame_view3.origin.y += 80;
                frame_viewBlankYellow.origin.y -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view3.origin.y - 80 && frame_viewBlankYellow.origin.x == frame_view3.origin.x) {
                frame_view3.origin.y -= 80;
                frame_viewBlankYellow.origin.y += 80;
                
            }
            else {
                
            };
            
            [UIView setAnimationDuration:0.15];
            [UIView beginAnimations:nil context:nil];
            
            view3.frame = frame_view3;
            viewBlankYellow.frame = frame_viewBlankYellow;
            
            [UIView commitAnimations];
            
            break;
            
        case 4:
            if (frame_viewBlankYellow.origin.x == frame_view4.origin.x + 80 && frame_viewBlankYellow.origin.y == frame_view4.origin.y) {
                frame_view4.origin.x += 80;
                frame_viewBlankYellow.origin.x -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.x == frame_view4.origin.x - 80 && frame_viewBlankYellow.origin.y == frame_view4.origin.y) {
                frame_view4.origin.x -= 80;
                frame_viewBlankYellow.origin.x += 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view4.origin.y + 80 && frame_viewBlankYellow.origin.x == frame_view4.origin.x) {
                frame_view4.origin.y += 80;
                frame_viewBlankYellow.origin.y -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view4.origin.y - 80 && frame_viewBlankYellow.origin.x == frame_view4.origin.x) {
                frame_view4.origin.y -= 80;
                frame_viewBlankYellow.origin.y += 80;
                
            }
            else {
                
            };
            
            [UIView setAnimationDuration:0.15];
            [UIView beginAnimations:nil context:nil];
            
            view4.frame = frame_view4;
            viewBlankYellow.frame = frame_viewBlankYellow;
            
            [UIView commitAnimations];
            
            break;
            
        case 5:
            if (frame_viewBlankYellow.origin.x == frame_view5.origin.x + 80 && frame_viewBlankYellow.origin.y == frame_view5.origin.y) {
                frame_view5.origin.x += 80;
                frame_viewBlankYellow.origin.x -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.x == frame_view5.origin.x - 80 && frame_viewBlankYellow.origin.y == frame_view5.origin.y) {
                frame_view5.origin.x -= 80;
                frame_viewBlankYellow.origin.x += 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view5.origin.y + 80 && frame_viewBlankYellow.origin.x == frame_view5.origin.x) {
                frame_view5.origin.y += 80;
                frame_viewBlankYellow.origin.y -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view5.origin.y - 80 && frame_viewBlankYellow.origin.x == frame_view5.origin.x) {
                frame_view5.origin.y -= 80;
                frame_viewBlankYellow.origin.y += 80;
                
            }
            else {
                
            };
            
            [UIView setAnimationDuration:0.15];
            [UIView beginAnimations:nil context:nil];
            
            view5.frame = frame_view5;
            viewBlankYellow.frame = frame_viewBlankYellow;
            
            [UIView commitAnimations];
            
            break;
            
        case 6:
            if (frame_viewBlankYellow.origin.x == frame_view6.origin.x + 80 && frame_viewBlankYellow.origin.y == frame_view6.origin.y) {
                frame_view6.origin.x += 80;
                frame_viewBlankYellow.origin.x -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.x == frame_view6.origin.x - 80 && frame_viewBlankYellow.origin.y == frame_view6.origin.y) {
                frame_view6.origin.x -= 80;
                frame_viewBlankYellow.origin.x += 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view6.origin.y + 80 && frame_viewBlankYellow.origin.x == frame_view6.origin.x) {
                frame_view6.origin.y += 80;
                frame_viewBlankYellow.origin.y -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view6.origin.y - 80 && frame_viewBlankYellow.origin.x == frame_view6.origin.x) {
                frame_view6.origin.y -= 80;
                frame_viewBlankYellow.origin.y += 80;
                
            }
            else {
                
            };
            
            [UIView setAnimationDuration:0.15];
            [UIView beginAnimations:nil context:nil];
            
            view6.frame = frame_view6;
            viewBlankYellow.frame = frame_viewBlankYellow;
            
            [UIView commitAnimations];
            
            break;
            
        case 7:
            if (frame_viewBlankYellow.origin.x == frame_view7.origin.x + 80 && frame_viewBlankYellow.origin.y == frame_view7.origin.y) {
                frame_view7.origin.x += 80;
                frame_viewBlankYellow.origin.x -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.x == frame_view7.origin.x - 80 && frame_viewBlankYellow.origin.y == frame_view7.origin.y) {
                frame_view7.origin.x -= 80;
                frame_viewBlankYellow.origin.x += 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view7.origin.y + 80 && frame_viewBlankYellow.origin.x == frame_view7.origin.x) {
                frame_view7.origin.y += 80;
                frame_viewBlankYellow.origin.y -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view7.origin.y - 80 && frame_viewBlankYellow.origin.x == frame_view7.origin.x) {
                frame_view7.origin.y -= 80;
                frame_viewBlankYellow.origin.y += 80;
                
            }
            else {
                
            };
            [UIView setAnimationDuration:0.15];
            [UIView beginAnimations:nil context:nil];
            
            view7.frame = frame_view7;
            viewBlankYellow.frame = frame_viewBlankYellow;
            
            [UIView commitAnimations];
            
            break;
            
        case 8:
            if (frame_viewBlankYellow.origin.x == frame_view8.origin.x + 80 && frame_viewBlankYellow.origin.y == frame_view8.origin.y) {
                frame_view8.origin.x += 80;
                frame_viewBlankYellow.origin.x -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.x == frame_view8.origin.x - 80 && frame_viewBlankYellow.origin.y == frame_view8.origin.y) {
                frame_view8.origin.x -= 80;
                frame_viewBlankYellow.origin.x += 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view8.origin.y + 80 && frame_viewBlankYellow.origin.x == frame_view8.origin.x) {
                frame_view8.origin.y += 80;
                frame_viewBlankYellow.origin.y -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view8.origin.y - 80 && frame_viewBlankYellow.origin.x == frame_view8.origin.x) {
                frame_view8.origin.y -= 80;
                frame_viewBlankYellow.origin.y += 80;
                
            }
            else {
                
            };
            
            [UIView setAnimationDuration:0.15];
            [UIView beginAnimations:nil context:nil];
            
            view8.frame = frame_view8;
            viewBlankYellow.frame = frame_viewBlankYellow;
            
            [UIView commitAnimations];
            
            break;
            
        case 9:
            if (frame_viewBlankYellow.origin.x == frame_view9.origin.x + 80 && frame_viewBlankYellow.origin.y == frame_view9.origin.y) {
                frame_view9.origin.x += 80;
                frame_viewBlankYellow.origin.x -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.x == frame_view9.origin.x - 80 && frame_viewBlankYellow.origin.y == frame_view9.origin.y) {
                frame_view9.origin.x -= 80;
                frame_viewBlankYellow.origin.x += 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view9.origin.y + 80 && frame_viewBlankYellow.origin.x == frame_view9.origin.x) {
                frame_view9.origin.y += 80;
                frame_viewBlankYellow.origin.y -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view9.origin.y - 80 && frame_viewBlankYellow.origin.x == frame_view9.origin.x) {
                frame_view9.origin.y -= 80;
                frame_viewBlankYellow.origin.y += 80;
                
            }
            else {
                
            };
            
            [UIView setAnimationDuration:0.15];
            [UIView beginAnimations:nil context:nil];
            
            view9.frame = frame_view9;
            viewBlankYellow.frame = frame_viewBlankYellow;
            
            [UIView commitAnimations];
            
            break;
            
        case 10:
            if (frame_viewBlankYellow.origin.x == frame_view10.origin.x + 80 && frame_viewBlankYellow.origin.y == frame_view10.origin.y) {
                frame_view10.origin.x += 80;
                frame_viewBlankYellow.origin.x -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.x == frame_view10.origin.x - 80 && frame_viewBlankYellow.origin.y == frame_view10.origin.y) {
                frame_view10.origin.x -= 80;
                frame_viewBlankYellow.origin.x += 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view10.origin.y + 80 && frame_viewBlankYellow.origin.x == frame_view10.origin.x) {
                frame_view10.origin.y += 80;
                frame_viewBlankYellow.origin.y -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view10.origin.y - 80 && frame_viewBlankYellow.origin.x == frame_view10.origin.x) {
                frame_view10.origin.y -= 80;
                frame_viewBlankYellow.origin.y += 80;
                
            }
            else {
                
            };
            
            [UIView setAnimationDuration:0.15];
            [UIView beginAnimations:nil context:nil];
            
            view10.frame = frame_view10;
            viewBlankYellow.frame = frame_viewBlankYellow;
            
            [UIView commitAnimations];
            
            break;
            
        case 11:
            if (frame_viewBlankYellow.origin.x == frame_view11.origin.x + 80 && frame_viewBlankYellow.origin.y == frame_view11.origin.y) {
                frame_view11.origin.x += 80;
                frame_viewBlankYellow.origin.x -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.x == frame_view11.origin.x - 80 && frame_viewBlankYellow.origin.y == frame_view11.origin.y) {
                frame_view11.origin.x -= 80;
                frame_viewBlankYellow.origin.x += 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view11.origin.y + 80 && frame_viewBlankYellow.origin.x == frame_view11.origin.x) {
                frame_view11.origin.y += 80;
                frame_viewBlankYellow.origin.y -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view11.origin.y - 80 && frame_viewBlankYellow.origin.x == frame_view11.origin.x) {
                frame_view11.origin.y -= 80;
                frame_viewBlankYellow.origin.y += 80;
                
            }
            else {
                
            };
            
            [UIView setAnimationDuration:0.15];
            [UIView beginAnimations:nil context:nil];
            
            view11.frame = frame_view11;
            viewBlankYellow.frame = frame_viewBlankYellow;
            
            [UIView commitAnimations];
            
            break;
            
        case 12:
            if (frame_viewBlankYellow.origin.x == frame_view12.origin.x + 80 && frame_viewBlankYellow.origin.y == frame_view12.origin.y) {
                frame_view12.origin.x += 80;
                frame_viewBlankYellow.origin.x -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.x == frame_view12.origin.x - 80 && frame_viewBlankYellow.origin.y == frame_view12.origin.y) {
                frame_view12.origin.x -= 80;
                frame_viewBlankYellow.origin.x += 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view12.origin.y + 80 && frame_viewBlankYellow.origin.x == frame_view12.origin.x) {
                frame_view12.origin.y += 80;
                frame_viewBlankYellow.origin.y -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view12.origin.y - 80 && frame_viewBlankYellow.origin.x == frame_view12.origin.x) {
                frame_view12.origin.y -= 80;
                frame_viewBlankYellow.origin.y += 80;
                
            }
            else {
                
            };
            
            [UIView setAnimationDuration:0.15];
            [UIView beginAnimations:nil context:nil];
            
            view12.frame = frame_view12;
            viewBlankYellow.frame = frame_viewBlankYellow;
            
            [UIView commitAnimations];
            
            break;
            
        case 13:
            if (frame_viewBlankYellow.origin.x == frame_view13.origin.x + 80 && frame_viewBlankYellow.origin.y == frame_view13.origin.y) {
                frame_view13.origin.x += 80;
                frame_viewBlankYellow.origin.x -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.x == frame_view13.origin.x - 80 && frame_viewBlankYellow.origin.y == frame_view13.origin.y) {
                frame_view13.origin.x -= 80;
                frame_viewBlankYellow.origin.x += 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view13.origin.y + 80 && frame_viewBlankYellow.origin.x == frame_view13.origin.x) {
                frame_view13.origin.y += 80;
                frame_viewBlankYellow.origin.y -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view13.origin.y - 80 && frame_viewBlankYellow.origin.x == frame_view13.origin.x) {
                frame_view13.origin.y -= 80;
                frame_viewBlankYellow.origin.y += 80;
                
            }
            else {
                
            };
            
            [UIView setAnimationDuration:0.15];
            [UIView beginAnimations:nil context:nil];
            
            view13.frame = frame_view13;
            viewBlankYellow.frame = frame_viewBlankYellow;
            
            [UIView commitAnimations];
            
            break;
            
        case 14:
            if (frame_viewBlankYellow.origin.x == frame_view14.origin.x + 80 && frame_viewBlankYellow.origin.y == frame_view14.origin.y) {
                frame_view14.origin.x += 80;
                frame_viewBlankYellow.origin.x -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.x == frame_view14.origin.x - 80 && frame_viewBlankYellow.origin.y == frame_view14.origin.y) {
                frame_view14.origin.x -= 80;
                frame_viewBlankYellow.origin.x += 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view14.origin.y + 80 && frame_viewBlankYellow.origin.x == frame_view14.origin.x) {
                frame_view14.origin.y += 80;
                frame_viewBlankYellow.origin.y -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view14.origin.y - 80 && frame_viewBlankYellow.origin.x == frame_view14.origin.x) {
                frame_view14.origin.y -= 80;
                frame_viewBlankYellow.origin.y += 80;
                
            }
            else {
                
            };
            
            [UIView setAnimationDuration:0.15];
            [UIView beginAnimations:nil context:nil];
            
            view14.frame = frame_view14;
            viewBlankYellow.frame = frame_viewBlankYellow;
            
            [UIView commitAnimations];
            
            break;
            
        case 15:
            if (frame_viewBlankYellow.origin.x == frame_view15.origin.x + 80 && frame_viewBlankYellow.origin.y == frame_view15.origin.y) {
                frame_view15.origin.x += 80;
                frame_viewBlankYellow.origin.x -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.x == frame_view15.origin.x - 80 && frame_viewBlankYellow.origin.y == frame_view15.origin.y) {
                frame_view15.origin.x -= 80;
                frame_viewBlankYellow.origin.x += 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view15.origin.y + 80 && frame_viewBlankYellow.origin.x == frame_view15.origin.x) {
                frame_view15.origin.y += 80;
                frame_viewBlankYellow.origin.y -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view15.origin.y - 80 && frame_viewBlankYellow.origin.x == frame_view15.origin.x) {
                frame_view15.origin.y -= 80;
                frame_viewBlankYellow.origin.y += 80;
                
            }
            else {
                
            };
            
            [UIView setAnimationDuration:0.15];
            [UIView beginAnimations:nil context:nil];
            
            view15.frame = frame_view15;
            viewBlankYellow.frame = frame_viewBlankYellow;
            
            [UIView commitAnimations];
            
            break;
            
        case 16:
            if (frame_viewBlankYellow.origin.x == frame_view16.origin.x + 80 && frame_viewBlankYellow.origin.y == frame_view16.origin.y) {
                frame_view16.origin.x += 80;
                frame_viewBlankYellow.origin.x -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.x == frame_view16.origin.x - 80 && frame_viewBlankYellow.origin.y == frame_view16.origin.y) {
                frame_view16.origin.x -= 80;
                frame_viewBlankYellow.origin.x += 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view16.origin.y + 80 && frame_viewBlankYellow.origin.x == frame_view16.origin.x) {
                frame_view16.origin.y += 80;
                frame_viewBlankYellow.origin.y -= 80;
            }
            
            else if (frame_viewBlankYellow.origin.y == frame_view16.origin.y - 80 && frame_viewBlankYellow.origin.x == frame_view16.origin.x) {
                frame_view16.origin.y -= 80;
                frame_viewBlankYellow.origin.y += 80;
                
            }
            else {
                
            };
            
            [UIView setAnimationDuration:0.15];
            [UIView beginAnimations:nil context:nil];
            
            view16.frame = frame_view16;
            viewBlankYellow.frame = frame_viewBlankYellow;
            
            [UIView commitAnimations];
            break;
            
        default:
            break;
    }
    
    BOOL winCondition =
    frame_view1.origin.x == 0 && frame_view1.origin.y == 0 &&
    frame_view2.origin.x == 80 && frame_view2.origin.y == 0 &&
    frame_view3.origin.x == 160 && frame_view3.origin.y == 0 &&
    frame_view4.origin.x == 240 && frame_view4.origin.y == 0 &&
    frame_view5.origin.x == 0 && frame_view5.origin.y == 80 &&
    frame_view6.origin.x == 80 && frame_view6.origin.y == 80 &&
    frame_view7.origin.x == 160 && frame_view7.origin.y == 80 &&
    frame_view8.origin.x == 240 && frame_view8.origin.y == 80 &&
    frame_view9.origin.x == 0 && frame_view9.origin.y == 160 &&
    frame_view10.origin.x == 80 && frame_view10.origin.y == 160 &&
    frame_view11.origin.x == 160 && frame_view11.origin.y == 160 &&
    frame_view12.origin.x == 240 && frame_view12.origin.y == 160 &&
    frame_view13.origin.x == 0 && frame_view13.origin.y == 240 &&
    frame_view14.origin.x == 80 && frame_view14.origin.y == 240 &&
    frame_view15.origin.x == 160 && frame_view15.origin.y == 240 &&
    frame_view16.origin.x == 240 && frame_view16.origin.y == 240;
    
    self.moves++;
    movesLabel.text = [NSString stringWithFormat:@"%i", self.moves];
    
    if (winCondition) {
        NSString *winMessage = [NSString stringWithFormat:@"You solved the puzzle in %@ moves! Try another one!", movesLabel.text];
        UIAlertView *winAlertView = [[UIAlertView alloc] initWithTitle:@"Congratulations"
        message:winMessage delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        
        [winAlertView show];
        self.moves = 0;
    }
    
}

-(IBAction)shuffle:(id)sender {
    UIImage *imgg = self.imageView.image;
    NSMutableArray *imggArr = [self getImagesFromImage:imgg withRow:4 withColumn:4];
    
    puzzleImageView11.image = [imggArr objectAtIndex:0];
    puzzleImageView12.image = [imggArr objectAtIndex:1];
    puzzleImageView13.image = [imggArr objectAtIndex:2];
    puzzleImageView14.image = [imggArr objectAtIndex:3];
    
    puzzleImageView21.image = [imggArr objectAtIndex:4];
    puzzleImageView22.image = [imggArr objectAtIndex:5];
    puzzleImageView23.image = [imggArr objectAtIndex:6];
    puzzleImageView24.image = [imggArr objectAtIndex:7];
    
    puzzleImageView31.image = [imggArr objectAtIndex:8];
    puzzleImageView32.image = [imggArr objectAtIndex:9];
    puzzleImageView33.image = [imggArr objectAtIndex:10];
    puzzleImageView34.image = [imggArr objectAtIndex:11];
    
    puzzleImageView41.image = [imggArr objectAtIndex:12];
    puzzleImageView42.image = [imggArr objectAtIndex:13];
    puzzleImageView43.image = [imggArr objectAtIndex:14];
    puzzleImageView44.image = [imggArr objectAtIndex:15];
    
    puzzleImageViewBlankYellow.image = [UIImage imageNamed:@"blank_yellow.png"];
    
    self.imageView.hidden = YES;
    self.moves = 0;
    movesLabel.text = [NSString stringWithFormat:@"%i", self.moves];
    
    NSMutableArray *xPositions = [NSMutableArray arrayWithObjects: @0, @80, @160, @240, nil];
    NSMutableArray *yPositions = [NSMutableArray arrayWithObjects: @0, @80, @160, @240, nil];
    
    int randX = arc4random_uniform(4);
    int randY = arc4random_uniform(4);
    
    int xPos1 = [[xPositions objectAtIndex:randX % 4] intValue];
    int xPos2 = [[xPositions objectAtIndex:(randX+1) % 4] intValue];
    int xPos3 = [[xPositions objectAtIndex:(randX+2) % 4] intValue];
    int xPos4 = [[xPositions objectAtIndex:(randX+3) % 4] intValue];
    
    int yPos1 = [[yPositions objectAtIndex:randY % 4] intValue];
    int yPos2 = [[yPositions objectAtIndex:(randY+1) % 4] intValue];
    int yPos3 = [[yPositions objectAtIndex:(randY+2) % 4] intValue];
    int yPos4 = [[yPositions objectAtIndex:(randY+3) % 4] intValue];
    
    CGRect frame_view1 = view1.frame;
    frame_view1.origin.x = xPos1;
    frame_view1.origin.y = yPos1;
    
    CGRect frame_view2 = view2.frame;
    frame_view2.origin.x = xPos1;
    frame_view2.origin.y = yPos2;
    
    CGRect frame_view3 = view3.frame;
    frame_view3.origin.x = xPos1;
    frame_view3.origin.y = yPos3;
    
    CGRect frame_view4 = view4.frame;
    frame_view4.origin.x = xPos1;
    frame_view4.origin.y = yPos4;
    
    CGRect frame_view5 = view5.frame;
    frame_view5.origin.x = xPos2;
    frame_view5.origin.y = yPos1;
    
    CGRect frame_view6 = view6.frame;
    frame_view6.origin.x = xPos2;
    frame_view6.origin.y = yPos2;
    
    CGRect frame_view7 = view7.frame;
    frame_view7.origin.x = xPos2;
    frame_view7.origin.y = yPos3;
    
    CGRect frame_view8 = view8.frame;
    frame_view8.origin.x = xPos2;
    frame_view8.origin.y = yPos4;
    
    CGRect frame_view9 = view9.frame;
    frame_view9.origin.x = xPos3;
    frame_view9.origin.y = yPos1;
    
    CGRect frame_view10 = view10.frame;
    frame_view10.origin.x = xPos3;
    frame_view10.origin.y = yPos2;
    
    CGRect frame_view11 = view11.frame;
    frame_view11.origin.x = xPos3;
    frame_view11.origin.y = yPos3;
    
    CGRect frame_view12 = view12.frame;
    frame_view12.origin.x = xPos3;
    frame_view12.origin.y = yPos4;
    
    CGRect frame_view13 = view13.frame;
    frame_view13.origin.x = xPos4;
    frame_view13.origin.y = yPos1;
    
    CGRect frame_view14 = view14.frame;
    frame_view14.origin.x = xPos4;
    frame_view14.origin.y = yPos2;
    
    CGRect frame_view15 = view15.frame;
    frame_view15.origin.x = xPos4;
    frame_view15.origin.y = yPos3;
    
    CGRect frame_view16 = view16.frame;
    frame_view16.origin.x = xPos4;
    frame_view16.origin.y = yPos4;
    
    CGRect frame_viewBlankYellow = viewBlankYellow.frame;
    frame_viewBlankYellow.origin.x = 240;
    frame_viewBlankYellow.origin.y = 320;
    
    [UIView setAnimationDuration:0.5];
    [UIView beginAnimations:nil context:nil];
    
    view1.frame = frame_view1;
    view2.frame = frame_view2;
    view3.frame = frame_view3;
    view4.frame = frame_view4;
    
    view5.frame = frame_view5;
    view6.frame = frame_view6;
    view7.frame = frame_view7;
    view8.frame = frame_view8;
    
    view9.frame = frame_view9;
    view10.frame = frame_view10;
    view11.frame = frame_view11;
    view12.frame = frame_view12;
    
    view13.frame = frame_view13;
    view14.frame = frame_view14;
    view15.frame = frame_view15;
    view16.frame = frame_view16;
    
    viewBlankYellow.frame = frame_viewBlankYellow;
    
    [UIView commitAnimations];

}

-(IBAction)showTemplates:(id)sender {
    CGRect frame_templatesView = templatesView.frame;
    
    frame_templatesView.origin.x = 0;
    frame_templatesView.origin.y = 0;
    
    [UIView setAnimationDuration:0.5];
    [UIView beginAnimations:nil context:nil];
    
    templatesView.frame = frame_templatesView;
    
    [UIView commitAnimations];
}

-(IBAction)templateChosen:(id)sender {
    
    NSInteger templateTag = [sender tag];
    if (templateTag == 100) {
        //Tiger
        self.imageView.image = [UIImage imageNamed:@"tiger_original_square_small.png"];
        [self shuffle:nil];
    }
    else if (templateTag == 101) {
        //Parrot
        self.imageView.image = [UIImage imageNamed:@"parrot_original_square.jpg"];
        [self shuffle:nil];
    }
    else if (templateTag == 102) {
        //Rhinocerous
        self.imageView.image = [UIImage imageNamed:@"rhino_original_square.jpg"];
        [self shuffle:nil];
    }
    else if (templateTag == 103) {
        //Panda
        self.imageView.image = [UIImage imageNamed:@"panda_original_square.jpg"];
        [self shuffle:nil];
    }
    else if (templateTag == 104) {
        //Monkey
        self.imageView.image = [UIImage imageNamed:@"monkey_original_square.jpg"];
        [self shuffle:nil];
    }
    else {
        //Dog
        self.imageView.image = [UIImage imageNamed:@"husky_original_square.jpg"];
        [self shuffle:nil];
    }
    
    
    CGRect frame_templatesView = templatesView.frame;
    
    frame_templatesView.origin.x = 0;
    frame_templatesView.origin.y = 600;
    
    [UIView setAnimationDuration:0.5];
    [UIView beginAnimations:nil context:nil];
    
    templatesView.frame = frame_templatesView;
    
    [UIView commitAnimations];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
