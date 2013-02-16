//
//  Constants.h
//  darkskyClient
//
//  Created by Joseph Bell on 2/11/13.
//  Copyright (c) 2013 iAchieved.it LLC. All rights reserved.
//

#ifndef darkskyClient_Constants_h
#define darkskyClient_Constants_h

// Go register for a DarkSky API key at https://developer.darkskyapp.com/register
#define DARKSKY_API_KEY        @"--------------------------------"
#define NO_DARKSKY_KEY_DEFINED @"--------------------------------"

#ifdef DEVELOPMENT_ENVIRONMENT
  #define DARKSKY_INTERESTING_STORMS @"https://beta-api.darkskyapp.com/v1/interesting"
#else
  #define DARKSKY_INTERESTING_STORMS @"https://api.darkskyapp.com/v1/interesting"
#endif

#endif
