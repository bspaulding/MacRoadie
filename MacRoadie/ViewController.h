#import <Cocoa/Cocoa.h>
#include "MIDIFilePlayer.h"
#include "MIDIDeviceScanner.h"
#import <AVFoundation/AVAudioPlayer.h>

@interface ViewController : NSViewController {
  AVAudioPlayer *audioPlayer;
  BOOL playing;
  MIDIFilePlayer *midiFilePlayer;
}

@property (weak) IBOutlet NSPopUpButton *midiDevicePopUp;
@property (weak) IBOutlet NSButton *togglePlayingButton;

@end

