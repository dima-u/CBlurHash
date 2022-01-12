//
//  encode.h
//  KaraokeStar
//
//  Created by dmitriy Uyanov on 12.01.2022.
//

#ifndef __BLURHASH_ENCODE_H__
#define __BLURHASH_ENCODE_H__

#include <stdint.h>
#include <stdlib.h>

const char *blurHashForPixels(int xComponents, int yComponents, int width, int height, uint8_t *rgb, size_t bytesPerRow);

#endif
