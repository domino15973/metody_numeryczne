//Cordic in 8 bit signed fixed point math
//Function is valid for arguments in range -pi/2 -- pi/2
//for values pi/2--pi: value = half_pi-(theta-half_pi) and similarly for values -pi---pi/2
//
// 1.0 = 64
// 1/k = 0.6072529350088812561694
// pi = 3.1415926536897932384626
//Constants
#define cordic_1K_8BIT 0x00000026
#define half_pi_8BIT 0x00000064
#define MUL_8BIT 64.000000
#define CORDIC_NTAB_8BIT 8
int cordic_ctab_8bit [] = {0x00000032, 0x0000001D, 0x0000000F, 0x00000007, 0x00000003, 0x00000001, 0x00000000, 0x00000000, };

void cordic_8bit(int theta, int *s, int *c, int n)
{
  int k, d, tx, ty, tz;
  int x=cordic_1K_8BIT,y=0,z=theta;
  n = (n>CORDIC_NTAB_8BIT) ? CORDIC_NTAB_8BIT : n;
  for (k=0; k<n; ++k)
  {
    d = z>>7;
    //get sign. for other architectures, you might want to use the more portable version
    //d = z>=0 ? 0 : -1;
    tx = x - (((y>>k) ^ d) - d);
    ty = y + (((x>>k) ^ d) - d);
    tz = z - ((cordic_ctab_8bit[k] ^ d) - d);
    x = tx; y = ty; z = tz;
  }
 *c = x; *s = y;
}