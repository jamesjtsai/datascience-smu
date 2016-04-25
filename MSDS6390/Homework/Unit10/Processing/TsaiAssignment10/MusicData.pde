interface MusicData extends Notes {
  
  // chromatic scale
  final static float[] chromatic = { 
                                     C3, CS3, D3, DS3, E3, F3, FS3, G3, GS3, A3, AS3, B3, 
                                     C4, CS4, D4, DS4, E4, F4, FS4, G4, GS4, A4, AS4, B4,
                                     C5, CS5, D5, DS5, E5, F5, FS5, G5, GS5, A5, AS5, B5,
                                     C6
                                   };
                                   
  // J.S. Bach - Prelude from Suite No. 1 for unaccompanied cello
  float[] cello_suite_1 = { 
                            G3, D4, B4, A4, B4, D4, B4, D4, G3, D4, B4, A4, B4, D4, B4, D4,
                            G3, E4, C5, B4, C5, E4, C5, E4, G3, E4, C5, B4, C5, E4, C5, E4,
                            G3, FS4, C5, B4, C5, FS4, C5, FS4, G3, FS4, C5, B4, C5, FS4, C5, FS4,
                            G3, G4, B4, A4, B4, G4, B4, G4, G3, G4, B4, A4, B4, G4, B4, FS4,
                            G3, E4, B4, A4, B4, G4, FS4, G4, E4, G4, FS4, G4, B3, D4, CS4, B3,
                            CS4, G4, A4, G4, A4, G4, A4, G4, CS4, G4, A4, G4, A4, G4, A4, G4,
                            FS4, A4, D5, CS5, D5, A4, G4, A4, FS4, A4, G4, A4, D4, FS4, E4, D4,
                            E3, B3, G4, FS4, G4, B3, G4, B3, E3, B3, G4, FS4, G4, B3, G4, B3,
                            E3, CS4, D4, E4, D4, CS4, B3, A3, G4, FS4, E4, D5, CS5, B4, A4, G4,
                            FS4, E4, D4, D5, A4, D5, FS4, A4, D4, E4, FS4, A4, G4, FS4, E4, D4,
                            GS4, D4, F4, D4, F4, D4, GS4, D4, B4, D4, F4, D4, F4, D4, GS4, D4,
                            C4, E4, A4, B4, C5, A4, E4, D4, C4, E4, A4, B4, C5, A4, FS4, E4,
                            DS4, FS4, DS4, FS4, A4, FS4, A4, FS4, DS4, FS4, DS4, FS4, A4, FS4, A4, FS4,
                            G4, FS4, E4, G4, FS4, G4, A4, FS4, G4, FS4, E4, D4, C4, B3, A3, G3,
                            FS3, C4, D4, C4, D4, C4, D4, C4, FS3, C4, D4, C4, D4, C4, D4, C4,
                            G3, B3, F4, E4, F4, B3, F4, B3, G3, B3, F4, E4, F4, B3, F4, B3,
                            G3, C4, E4, D4, E4, C4, E4, C4, G3, C4, E4, D4, E4, C4, E4, C4,
                            G3, FS4, C5, B4, C5, FS4, C5, FS4, G3, FS4, C5, B4, C5, FS4, C5, FS4,
                            G3, D4, B4, A4, B4, G4, FS4, E4, D4, C4, B3, A3, G3, FS3, E3, D3,
                            CS3, A3, E4, FS4, G4, E4, FS4, G4, CS3, A3, E4, FS4, G4, E4, FS4, G4
                          };
                          
  // Jean-Joseph Mouret - Rondeau
  float[] rondeau = { 
                      E4, D4, C4, C4, G3, G3, C4, C4, D4, D4, E4, F4, E4, D4, C4, D4, E4, F4, G4, G4,
                      G4, G4, G4, A4, G4, G4, G4, F4, E4, E4, E4, F4, G4, G4, C5, C5, G4, G4, G4, F4,
                      E4, E4, D4, E4, F4, G4, E4, F4, D4, D4, G3, G3, D4, D4, D4, D4, D4, D4, D4, D4,
                      D4, D4, E5, D5, C5, C5, G4, G4, C5, C5, D5, D5, E5, F5, E5, D5, C5, D5, E5, F5,
                      G5, G5, G5, G5, G5, G5, A5, A5, G5, G5, G5, F5, E5, E5, E5, F5, G5, G5, C6, C6,
                      G5, G5, G5, F5, E5, E5, D5, E5, F5, G5, E5, F5, D5, G5, F5, E5, D5, D5, D5, C5,
                      C5, C5, C5, C5, C5, C5, C5
                    };
    
   float[] pause = {
                     P1, P1, P1, P1
                   };
  
}