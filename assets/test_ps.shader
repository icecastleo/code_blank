DXBCґ"VАћєЂ=5AG,   †8     8   ш   P  Д  ь  Ш  RDEFЄ              <    €€  Е   RD11<          (   $          |                            Б            €€€€          samp tex Microsoft (R) HLSL Shader Compiler 6.3.9600.16384 ЂISGNP         8                    D                   SV_POSITION TEXCOORD ЂЂЂOSGN,                               SV_TARGET ЂЂSHEXp   P      jИ Z   `     X  p     UU  b 2    e  т      E  Л¬  АCU т      F    F~      `     >  STATФ                                                                                                                                                   SPDB 6  Microsoft C/C++ MSF 7.00
DS            И                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ј€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€8  €€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€       <       €€€€                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Ф.1X%qZ   Ђc©gaGЃ\Р_ЏЭжj                          AС2                                                                                                                                                                                                                                                                                                                                                                                                                                                                    (samp, input.texcoord);
}    5   4   h                       f:\capstone pre\engine\engine\shaders\test_ps.hlsl    4      5                                                                                                                                                                                                                                                                                                                                                                                              ws  /,  JN  OL  “A  Кn  ≠"  ЦE  р1  ,  Mu  ≠Z  б/                                                                                                                                                                                                                                                                                                                                                                                                                                                                             cbuffer LightingConstants : register (b0)
{
	float4  lightColor;
	float3  lightDirection;
	float   padding1;
	float3	lightPos;
	
}

struct PS_INPUT
{
	float4		position	: SV_POSITION;
	float2		texcoord	: TEXCOORD0;
};

Texture2D tex : register(t0);

SamplerState samp : register(s0);

float4 main(PS_INPUT input) : SV_TARGET
{
	//return float4(lightColor);
	return tex.Sample(samp, input.texcoord);
}                                                                                          юпюп      F:\capstone pre\engine\engine\Shaders\test_ps.hlsl  f:\capstone pre\engine\engine\shaders\test_ps.hlsl cbuffer LightingConstants : register (b0)
{
	float4  lightColor;
	float3  lightDirection;
	float   padding1;
	float3	lightPos;
	
}

struct PS_INPUT
{
	float4		position	: SV_POSITION;
	float2		texcoord	: TEXCOORD0;
};

Texture2D tex : register(t0);

SamplerState samp : register(s0);

float4 main(PS_INPUT input) : SV_TARGET
{
	//return float4(lightColor);
	return tex.Sampleв0А   Ђ«QЖ8Ъ”                                                               5   (   в0]µtК¶     4   5                                                                                                                                                                                                                                                                                                                                                                                                                  J <      @А%   @А%Microsoft (R) HLSL Shader Compiler 6.3.9600.16384 6 =hlslFlags 0x5 hlslTarget ps_5_0 hlslEntry main     *           0       0     @    †main . >  	 input                                  P     @    0      P    @    0     P    @    0     P    @    0     P    @    0     P    @    0    : >  И <main return value>                                P     @    0      P    @    0     P    @    0     P    @    0      ф         kf8І: ы л÷≈„~	  т   H         p          <   @     А@      l     Аl       ) 	 (  )  ) ц                    ,                                                                                                                                                                                                                                                                                                                                                                    18        ф   
 €€   А      4   4      <        @       float4 утс @       float2 утс*       position с    texcoord с               PS_INPUT с
      
                    тс
     
          
    тс
 
    
                                                                                                                                                                                                                          18              €€   А                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  D3DSHDR p                              `                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        €€€€	/с                 -                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           %    И    main   Q	   €€€€  €€€€tex  Q   €€€€€€  €€samp                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       €€€€	/с                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            €€€€w	1     Л Ј√   L       ,   @                                    p      `             	       |      рEЭ        main none   -Ї.с       p      `                    €€€€    p         €€€€    €€€€         F:\capstone pre\engine\engine\Shaders\test_ps.hlsl  юпюп                  €€€€€€€€€€ €€€€€€€€€€                                                                                                                                                                                         Ф.1X%qZ   Ђc©gaGЃ\Р_ЏЭжj`   /LinkInfo /names /src/headerblock /src/files/f:\capstone pre\engine\engine\shaders\test_ps.hlsl                       "      
                 AС2                                                                                                                                                                                                                                                                                                                                           Љ   ,  G  8       ?  А   ¶  †  <       (   8  ,   H                  	      
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     