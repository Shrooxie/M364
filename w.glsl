GLuint texture = 0;

GLsizei width = 2;
GLsizei height = 2;
GLsizei layerCount = 2;
GLsizei mipLevelCount = 1;

// Read you texels here. In the current example, we have 2*2*2 = 8 texels, with each texel being 4 GLubytes.
GLubyte texels[32] = 
{
     // Texels for first image.
     0,   0,   0,   255,
     255, 0,   0,   255,
     0,   255, 0,   255,
     0,   0,   255, 255,
     // Texels for second image.
     255, 255, 255, 255,
     255, 255,   0, 255,
     0,   255, 255, 255,
     255, 0,   255, 255,
};

glGenTextures(1,&texture);
glBindTexture(GL_TEXTURE_2D_ARRAY,texture);
// Allocate the storage.
glTexStorage3D(GL_TEXTURE_2D_ARRAY, mipLevelCount, GL_RGBA8, width, height, layerCount);
// Upload pixel data.
// The first 0 refers to the mipmap level (level 0, since there's only 1)
// The following 2 zeroes refers to the x and y offsets in case you only want to specify a subrectangle.
// The final 0 refers to the layer index offset (we start from index 0 and have 2 levels).
// Altogether you can specify a 3D box subset of the overall texture, but only one mip level at a time.
glTexSubImage3D(GL_TEXTURE_2D_ARRAY, 0, 0, 0, 0, width, height, layerCount, GL_RGBA, GL_UNSIGNED_BYTE, texels);

// Always set reasonable texture parameters
glTexParameteri(GL_TEXTURE_2D_ARRAY,GL_TEXTURE_MIN_FILTER,GL_LINEAR);
glTexParameteri(GL_TEXTURE_2D_ARRAY,GL_TEXTURE_MAG_FILTER,GL_LINEAR);
glTexParameteri(GL_TEXTURE_2D_ARRAY,GL_TEXTURE_WRAP_S,GL_CLAMP_TO_EDGE);
glTexParameteri(GL_TEXTURE_2D_ARRAY,GL_TEXTURE_WRAP_T,GL_CLAMP_TO_EDGE);
