DXBC\ГЖUb}k3эkOЂlDH   42     <       0  1  Ј1   2  Aon9д  д   џџЌ  (     (   (   (  $   (     џџўџ[ DBUG(   4         T      X        x   D:\Profiles\cs2083\tofu\tofu\test_ps.hlsl ЋЋ(     џџt    џџ            main input position            texcoord ЋЋЋ                    Ј          И         џџџџ                           x   }   Ш      и       x   ф      є   Microsoft (R) HLSL Shader Compiler 6.3.9600.16384 ЋЋ       А       B      фА ф      фџџ  SHDRd   @      Z   `     X  p     UU  b 2    e  ђ      E  	ђ      F    F~      `     >  SPDB .  Microsoft C/C++ MSF 7.00
DS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Рџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ8 џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ       <       џџџџ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         .1ю|Z    іТЄ@GГсГэеНZ                          A2                                                                                                                                                                                                                                                                                                                                                                                                                                                                    D3DSHDR d                              `                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ws  /,  JN  OL  вA  n  ­"  $e  №1  ,  Mu  ­Z  с/                                                                                                                                                                                                                                                                                                                                                                                                                                                                             struct PS_INPUT
{
	float4		position	: SV_POSITION;
	float2		texcoord	: TEXCOORD0;
};

Texture2D tex : register(t0);

SamplerState samp : register(s0);

float4 main(PS_INPUT input) : SV_TARGET
{
	return tex.Sample(samp, input.texcoord);
}                                                                                                                                                                                                                                                                      ўяўя   Q   D:\Profiles\cs2083\tofu\tofu\test_ps.hlsl  d:\profiles\cs2083\tofu\tofu\test_ps.hlsl struct PS_INPUT
{
	float4		position	: SV_POSITION;
	float2		texcoord	: TEXCOORD0;
};

Texture2D tex : register(t0);

SamplerState samp : register(s0);

float4 main(PS_INPUT input) : SV_TARGET
{
	return tex.Sample(samp, input.texcoord);
}        +              ,   V                                                                                                                                     т0   ЮогмXг                                                               ,   (   т0Bњ      +   ,                                                                                                                                                                                                                                                                                                                                                                                                                  J <      @%   @%Microsoft (R) HLSL Shader Compiler 6.3.9600.16384 > =hlslFlags 0x5 hlslTarget ps_4_0_level_9_3 hlslEntry main   *           (       (     <     main . >  	 input                                  P     <    (      P    <    (     P    <    (     P    <    (     P    <    (     P    <    (    : >   <main return value>                                P     <    (      P    <    (     P    <    (     P    <    (      є         н]Ц}XЭцQI  ђ   H         d          <   <     <      `     `       ) 	 (  )  ) і                    ,                                                                                                                                                                                                                                                                                                                                                           Ъ18        є   
 џџ         4   4      <        @       float4 ѓђё @       float2 ѓђё*       position ё    texcoord ё               PS_INPUT ё
      
                 `  ђё
     
          
    ђё
 
    
                                                                                                                                                                                                                         Ъ18              џџ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     џџџџ	/ё                 -                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           %        main   Q	   џџџџ  џџџџtex  Q   џџџџџџ  џџsamp                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       џџџџ	/ё                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            џџџџw	1      ЗУ   L       ,   8                                    d      `             	       |       ]ш         main none   -К.ё       d      `                    џџџџ    d         џџџџ    џџџџ         D:\Profiles\cs2083\tofu\tofu\test_ps.hlsl   ўяўя                  џџџџџџџџџџ џџџџџџџџџџ                                                                                                                                                                                                 .1ю|Z    іТЄ@GГсГэеНZW   /LinkInfo /names /src/headerblock /src/files/d:\profiles\cs2083\tofu\tofu\test_ps.hlsl                 "            
                 A2                                                                                                                                                                                                                                                                                                                                                    Г   ,  ?  8            њ   Ј  <       (   8  ,   H                  	   
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         STATt                                                                                                                   RDEF                  џџ  e   \                            a            џџџџ          samp tex Microsoft (R) HLSL Shader Compiler 6.3.9600.16384 ЋISGNP         8                    D                   SV_POSITION TEXCOORD ЋЋЋOSGN,                               SV_TARGET ЋЋ