#define GPIO_ENSET      0x60000310
#define GPIO_OUTSET     0x60000304
#define GPIO_OUTCLR     0x60000308
#define IOMUX_GPIO2     0x60000838

void dummy ( unsigned int );
void PUT32 ( unsigned int, unsigned int );
unsigned GET32 ( unsigned int );
void notmain ( void )
{
    unsigned int ra;
    unsigned int rx;
    ra=GET32(IOMUX_GPIO2);
    ra&=(~0x130);
    PUT32(IOMUX_GPIO2,ra);
    PUT32(GPIO_ENSET,1<<2);
    while(1)
    {
        PUT32(GPIO_OUTSET,1<<2);
        for(rx=0;rx<400000;rx++) dummy(rx);
        PUT32(GPIO_OUTCLR,1<<2);
        for(rx=0;rx<400000;rx++) dummy(rx);
    }
}
