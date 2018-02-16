#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  playing = false;
  [self updateMIDIDevices];
  
  NSString *midiFilePath = [[NSBundle mainBundle] pathForResource:@"Blessed Assurance (Axe PCs)" ofType:@"mid"];
  NSURL *midiFileUrl = [NSURL fileURLWithPath:midiFilePath];
  midiFilePlayer = [[MIDIFilePlayer alloc] initWithFileURL:midiFileUrl];
  
  NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"Blessed Assurance (Performance Track)" ofType:@"m4a"];
  NSLog(@"audioFilePath: %@", audioFilePath);
  NSURL *audioFileUrl = [NSURL fileURLWithPath:audioFilePath];
  NSLog(@"audoFileUrl: %@", audioFileUrl);
  audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioFileUrl error:NULL];
  [audioPlayer prepareToPlay];
}

- (void)setRepresentedObject:(id)representedObject {
  [super setRepresentedObject:representedObject];

  // Update the view, if already loaded.
}

- (IBAction)togglePlayingButtonPressed:(id)sender {
  if (playing) {
    NSLog(@"Stopping...");
    [midiFilePlayer stop];
    [audioPlayer stop];
    _togglePlayingButton.title = @"Play";
  } else {
    NSLog(@"Playing...");
    [midiFilePlayer play];
    [audioPlayer play];
    _togglePlayingButton.title = @"Stop";
  }
  playing = !playing;
}

- (IBAction)midiDeviceChanged:(id)sender {
  NSInteger deviceIndex = [_midiDevicePopUp indexOfItem:[_midiDevicePopUp selectedItem]];
  [midiFilePlayer setMIDIDeviceIndex:deviceIndex];
}

- (void)updateMIDIDevices {
  [_midiDevicePopUp addItemsWithTitles:[MIDIDeviceScanner getMIDIDestinations]];
}

@end
