//
//  CBlurHash.h
//  
//
//  Created by dmitriy Uyanov on 12.01.2022.
//

#ifndef CBlurHash
#define CBlurHash

#include <stdlib.h>
#include <stdint.h>

uint8_t * decode(const char * blurhash, int width, int height, int punch, int nChannels);

const char *blurHashForPixels(int xComponents, int yComponents, int width, int height, uint8_t *rgb, size_t bytesPerRow);

#endif /* CBlurHash */
