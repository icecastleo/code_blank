DXBCt*Уouv;є•Эвq.Ш;   ЄO     8   T    @  	  ∞	  RDEF          <    €€  а  RD11<          (   $          №                            б         	   €€€€          й            €€€€         ф            €€€€         ю                             samp cubeMap diffuseTex normalMap LightingConstants ю      (  @           x            М      €€€€    €€€€    ∞     0       Љ      €€€€    €€€€    cameraPos float4 ЂЂЂ                            В  _reserv1 ЂЂЂ                           В  Microsoft (R) HLSL Shader Compiler 6.3.9600.16384 ЂЂISGN∞         А                    М                   Х                   Ь                   §                   SV_POSITION POSITION NORMAL TANGENT TEXCOORD ЂЂЂOSGN,                               SV_TARGET ЂЂSHEXћ  P   s  jИ Y  FО         Z   `     X0  p     UU  X  p    UU  X  p    UU  b r    b r    b r    b 2    e  т      h             F    F    D        
      8  r                  В          F     8  r     f     ц     6  r     FАA         r     F    &      В      F    F    D  В      :      8  r     ц     F    8  r     f     &	    8  r     Ж     F    6  r     FАA         r     F    F    6            6  "     
     6  B           6       *     6  "          6  B     
      6        
     6  "      *     6  B      *      E  Л¬  АCU r     F    F~     `     8  
r     F    @     @   @   @    6  r     @    Ањ  Ањ  Ањ   А   r     F    F           F    F      "     F    F      B     F    F     6  r      FАA         r      F     FВ            В      F     F     D  В      :      8  r      ц     F     6  r      FАA         В      F     F       В      :      :      6  В      : АA       8  r     ц     F       r      F     F    E  Л¬  АCU r     F    F~     `     6  r     F    8  
r     F    @  ЌћL?ЌћL?ЌћL?    E  ЛВ АCU r      F     F~      `     8  
r      F     @  ЌћL>ЌћL>ЌћL>       r      F     F    +  В      @     6  r      F     >  STATФ   2             "                                                                                                                               SPDB F  Microsoft C/C++ MSF 7.00
DS         #   ®                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ј€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€8   €€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€       <       €€€€                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Ф.1
ЩZ   “И$1іMВ÷ЋНг»”                          AС2                                                                                                                                                                                                                                                                                                                                                                                                                                                                    at4 main(V2F input) : SV_TARGET
{
	float3 normal = normalize(input.normal);
	float3 tangent = normalize(input.tangent - dot(input.tangent, normal) * normal);
	float3 bitangent = cross(tangent, normal);

	float3x3 TBN = float3x3(tangent, bitangent, normal);

	float3 normTexel = normalMap.Sample(samp, input.uv).xyz * 2.0 - 1.0;

	normal = mul(normTexel, TBN);

	float3 viewDir = normalize(cameraPos.xyz - input.worldPos);
	float3 refl = reflect(-viewDir, normal);

	float3 color = diffuseTex.Samplws  3M  /,  6t  @U  L  Кn  ъr  Ыr  ¬b  ≠  ≠Z  б/  ]`  #  €x  ~E  oD  1-                                                                                                                                                                                                                                                                                                                                                                                                                                                     cbuffer LightingConstants : register (b0)
{
	float4	cameraPos;
	float4  _reserv1[3];
}

struct V2F
{
	float4 position	: SV_POSITION;
	float3 worldPos	: POSITION;
	float3 normal	: NORMAL;
	float3 tangent	: TANGENT;
	float2 uv		: TEXCOORD0;
};

TextureCube cubeMap : register(t0);
Texture2D diffuseTex : register(t1);
Texture2D normalMap : register(t2);
SamplerState samp : register(s0);

float4 main(V2F input) : SV_TARGET
{
	float3 normal = normalize(input.normal);
	float3 tangent = normalize(input.tangent - dot(input.tangent, normal) * normal);
	float3 bitangent = cross(tangent, normal);

	float3x3 TBN = float3x3(tangent, bitangent, normal);

	float3 normTexel = normalMap.Sample(samp, input.uv).xyz * 2.0 - 1.0;

	normal = mul(normTexel, TBN);

	float3 viewDir = normalize(cameraPos.xyz - input.worldPos);
	float3 refl = reflect(-viewDir, normal);

	float3 color = diffuseTex.Sample(samp, input.uv).rgb;
	color = color * 0.8 + cubeMap.Sample(samp, refl).rgb * 0.2;

	return float4(color, 1);
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  юпюп   i   D:\Profiles\cs2083\tofu\tofu\opaque_ps.hlsl  d:\profiles\cs2083\tofu\tofu\opaque_ps.hlsl cbuffer LightingConstants : register (b0)
{
	float4	cameraPos;
	float4  _reserv1[3];
}

struct V2F
{
	float4 position	: SV_POSITION;
	float3 worldPos	: POSITION;
	float3 normal	: NORMAL;
	float3 tangent	: TANGENT;
	float2 uv		: TEXCOORD0;
};

TextureCube cubeMap : register(t0);
Texture2D diffuseTex : register(t1);
Texture2D normalMap : register(t2);
SamplerState samp : register(s0);

floв0А   хФJ^”                                                               .   (   в08Юдn     -   .                                                                                                                                                                                                                                                                                                                                                                                                                  J <      @А%   @А%Microsoft (R) HLSL Shader Compiler 6.3.9600.16384 6 =hlslFlags 0x5 hlslTarget ps_5_0 hlslEntry main     *     »      0      0    Ь    †main . >  	 input                                  P     Ь    0     P    Ь    0    P    Ь    0    P    Ь    0    P    Ь    0    P    Ь    0    P    Ь    0    P    Ь    0     P     Ь    0$    P  $  Ь    0(    P  (  Ь    00    P  ,  Ь    04    P  0  Ь    08    P  4  Ь    0@    P  8  Ь    0D   : >  И <main return value>                                P     Ь    0     P    Ь    0    P    Ь    0    P    Ь    0   . >   normal                                 P     и    ∞     P      и    ƒ    P     и    Љ    P      l   `     P     И   D$    P     §   ((   . >   tangent                                P     †   L    P      †   L    P     †   L   2 >   bitangent                                  P         (     P        ($    P        ((   * >   TBN                                P          ђ0    P     4   Ш4    P     H   Д8    P     \   p@    P     p   \D    P     Д   HH    P     Ш   $     P     ђ       P      ј   ь    2 >   normTexel                                  P      P   \    P     P   \    P     P   \   . >   viewDir                                P      (         P     (        P     (       * >   refl                               P      »   Ф      P     »   Ф     P     »   Ф    . >   color                                  P         Ш     P        Ш     P        Ш     P      †   ,      P     †   ,     P     †   ,      ф         
"?39тЊOХ*м™z
W”  т   »        ћ      d   Љ  Ь     АЬ      Є     АЄ      ћ     Аћ      и     Аи          А          А      8    А8     T    АT     p    Аp     Д    АД     †    А†     Љ    АЉ     Ў    АЎ     р    Ар         А          А      4    А4     H    АH     \    А\     p    Аp     Д    АД     Ш    АШ     ђ    Ађ     ј    Ај     м    Ам         А     4    А4     P    АP     l    Аl     И    АИ     §  !  А§  !   Љ  !  АЉ  !   №  !  А№  !   ш  !  Аш  !     !  А  !   (  "  А(  "   @  "  А@  "   \  "  А\  "   x  "  Аx  "   Р  "  АР  "   ђ  "  Ађ  "   »  $  А»  $   ф  $  Аф  $     %  А  %   0  %  А0  %   \  %  А\  %   Д  %  АД  %   †  '  А†  '   і  '  Аі  '   »  '  А»  '    )  (  )  (  )  (  Q - F  Q - O  Q  O  Q  O  Q  P  Q  P  Q  P  +  *  +  *  +  *  +  *  5  4  5  4  5  4  5  4  5  4  5  4  5  4  5  4  5  4  E  4  E  >  E  D  E  D              <  :  <  :  <  ;  <  ;  <  ;  )    )  (  )  (  )  (  )  (  )  (  6  1  6 	 5  < 
   <  1  <  ;  < 
 ;   	          ц                    4   P   p   Р                                                                                                                                                                                                                                                                                                18        Ф  
 €€   А      L   L      T        @       float4 утс @       float3 утс @       float2 утсb       position с    worldPos с    normal утс   ( tangent тс   4 uv утс              < V2F тс
      
              @             $ float3x3 
         ј  тс
 
    
         ј  тс
     
          
ј  тс
     
                                                          18              €€   А                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  e(samp, input.uv).rgb;
	color = color * 0.8 + cubeMap.Sample(samp, refl).rgb * 0.2;

	return float4(color, 1);
}    .   -   Z                                                                                                                                                                                                                                                                                                                                                                                            D3DSHDR ћ                             `                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        €€€€	/с0           Q      q      С      5                                                                                                                                                                                                                                                                                                                                                                                                                                                    @                    @                                                                              $   0   <                                                                                                                                                                                                                                                                                                                                                                                                                                        %    И    main   Q	       €€€€€€cameraPos    Q   €€€€  €€€€cubeMap  Q   €€€€ €€€€diffuseTex   Q   €€€€ €€€€normalMap    Q   €€€€€€  €€samp                                                                                                                                                                                                                                                                                                                                                                                   €€€€	/с                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            €€€€w	1     Л Ј√   L       ,   8                                    ћ     `             	 ћ      ь     ∞БЯ        main none   -Ї.с       ћ     `                    €€€€    ћ        €€€€    €€€€         D:\Profiles\cs2083\tofu\tofu\opaque_ps.hlsl юпюп                  €€€€€€€€€€ €€€€€€€€€€                                                                                                                                                                                                 Ф.1
ЩZ   “И$1іMВ÷ЋНг»”Y   /LinkInfo /names /src/headerblock /src/files/d:\profiles\cs2083\tofu\tofu\opaque_ps.hlsl                       "      
                 AС2                                                                                                                                                                                                                                                                                                                                                  µ   ћ  ?  8       Щ  А     д  T       (   \  ,   ђ                                 	   
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 