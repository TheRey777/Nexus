/**
 *	Code Extensive Modifications and Settings by Kyo
 *	Initial Code designed by gp65cj04
 *  Values edited by Ivy 
 */

// PS_ProcessPass3 new optimized code by Arsil 
 
/*--------------------------------------------------------------------------------------------------------------
	Enable by removing '//' - Disable by adding '//'
--------------------------------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------------------
	KYO : IMPORTANT DEFINE
	Below is a toggle, depending on you're using pre-1.4x binaries a/o Old Detector version in enbseries.ini
	If using post 0.14x binaries and Old Detector, the following define SHALL REMAIN ENABLED
	If using previous binaries or New Detector, you have to comment it ''//')
--------------------------------------------------------------------------------------------------------------*/

#define ENABLE_FLIP_DAY_NIGHT_FACTOR

/*--------------------------------------------------------------------------------------------------------------
	Overall Defines 
--------------------------------------------------------------------------------------------------------------*/
//#define NOT_BLURRING_SKY_MODE

/**
 *	Depth of Field Quality
 */
#define	DEPTH_OF_FIELD_QUALITY 2	//5	//7	//[KYO : From 1 to 7 - The better the Q, the harder the performance hit]

int MaxDepthOfFieldQuality <
   string UIName="MaxDepthOfFieldQuality";
   string UIWidget="Spinner";
   int UIMin=1;
   int UIMax=7;
> = DEPTH_OF_FIELD_QUALITY;

//changes in range 0..1, 0 means full quality, 1 lowest dynamic quality (0.33, 0.66 are limits for quality levels)
float	EAdaptiveQualityFactor; 

/**
 *	Grain Enable-Disable
 */
#define GRAIN_FORMULA	1		//[KYO : Can be 1 or 2]
//#define GRAIN_DAY
//#define GRAIN_NIGHT
//#define GRAIN_INTERIOR

/**
 *	Chromatic Aberration Enable-Disable
 */
#define	ChA_DAY
#define	ChA_NIGHT
#define	ChA_INTERIOR

/**
 *	Sharpening Enable-Disable
 */
//#define USE_SHARPENING			//[Enables-Disables all Pixel Sharpening at once]
#define	SHARPENING_DAY
#define	SHARPENING_NIGHT
#define	SHARPENING_INTERIOR


/*--------------------------------------------------------------------------------------------------------------
	Offsets Defines - DOF Sampling Vectors
	KYO : alternative method to modify blur's clarity and behaviour
	*Still experimental*
	*Select only ONE* - Default is ORIGINAL
--------------------------------------------------------------------------------------------------------------*/
//#define USE_TIGHT_OFFSETS	1			
//#define USE_CENTERED_OFFSETS	1				
//#define USE_REGULAR_OFFSETS	1		
//#define USE_ORIGINAL_OFFSETS	1			
#define USE_WIDE_OFFSETS	1		
//#define USE_NATURAL_OFFSETS	1


/*--------------------------------------------------------------------------------------------------------------
	Toggles DYNAMIC (AutoFocus) or STATIC DOF ('//')
--------------------------------------------------------------------------------------------------------------*/
#define AUTO_FOCUS


/*--------------------------------------------------------------------------------------------------------------
	Tilt-Shift Effect Enable and Angle
--------------------------------------------------------------------------------------------------------------*/
//#define TILT_SHIFT

// Day, Night, Interior angles
float	TiltShiftAngleDay=30.0;
float	TiltShiftAngleNight=30.0;
float	TiltShiftAngleInterior=30.0;


/*--------------------------------------------------------------------------------------------------------------
	Polygonal Bokeh Shape
--------------------------------------------------------------------------------------------------------------*/
#define POLYGON_NUM 7

/*--------------------------------------------------------------------------------------------------------------
	DYNAMIC DOF Settings
--------------------------------------------------------------------------------------------------------------*/
// FOCUS POINT DAY
float2 	FocusPointDay=float2(0.5, 0.5); 

// FOCUS POINT NIGHT	
float2 	FocusPointNight=float2(0.5, 0.5);	//0.45, 0.45	//0.45, 0.5

// FOCUS POINT INTERIOR 
float2 	FocusPointInterior=float2(0.5, 0.5);	//0.45, 0.45 

// DYNAMIC DOF DAY SETTINGS
float FocusSampleRangeDay=1.0;		//1.333 	//1.0	//3.0
float NearBlurCurveDay=14.55;		//14.90 //16.70
float FarBlurCurveDay=1.675;		//1.25	//1.45	//Q5->1.45-1.65	//1.25	//1.665	//1.615	//2.615		
float DepthClipDay=150000.0; 

// DYNAMIC DOF NIGHT SETTINGS
float FocusSampleRangeNight=1.0; 
float NearBlurCurveNight=14.45; 
float FarBlurCurveNight=1.625;		//Q5->1.45	
float DepthClipNight=150000.0; 

// DYNAMIC DOF INTERIOR SETTINGS
float FocusSampleRangeInterior=1.0;	//2.22		//1.0	//3.0	//1.333	//2.0	//1.33	
float NearBlurCurveInterior=10.00;	//14.70	//17.80	//11.70	//10.70	//14.70	
float FarBlurCurveInterior=0.85;	//1.00	//1.25	//1.55  //0.75	//0.55	//1.25	
float DepthClipInterior=150000.0;  				

/*--------------------------------------------------------------------------------------------------------------
	STATIC DOF Settings
--------------------------------------------------------------------------------------------------------------*/
// DAY SETTINGS
float	FocalPlaneDepthDay=7.00;
float	FarBlurDepthDay=150.00;	

// NIGHT SETTINGS
float	FocalPlaneDepthNight=1.00;
float	FarBlurDepthNight=150.00;	

// INTERIOR SETTINGS
float	FocalPlaneDepthInterior=1.00;
float	FarBlurDepthInterior=150.00;				
			
/*--------------------------------------------------------------------------------------------------------------
	BOKEH Effect Parameters
--------------------------------------------------------------------------------------------------------------*/
// BOKEH DAY SETTINGS
float	BokehBiasDay=-0.00125;	//0.00		//0.00125	//-.00125;	//[KYO : Impacts overall brightness-exposure - Leave @0.00 for normalize]
float	BokehBiasCurveDay=0.75;			//0.925		//.90	//.75	//1.0	
float	BokehBrightnessThresholdDay=0.975;	//.825	//1.0	//.885	//.925	//.95
float	BokehBrightnessMultiplierDay=1.00;	//1.20	
float	RadiusScaleMultiplierDay=2.23;		//2.33	

// BOKEH NIGHT SETTINGS
float	BokehBiasNight=0.00;			//0.00125	//-.00125;	//[KYO : Impacts overall brightness-exposure - Leave @0.00 for normalize]
float	BokehBiasCurveNight=0.65;		//0.925		//.90	//.75	//1.0	
float	BokehBrightnessThresholdNight=.885;	//.825	//1.0	//.885	//.925	//.95
float	BokehBrightnessMultiplierNight=0.75;	//1.125		
float	RadiusScaleMultiplierNight=2.23;	//2.33	

// BOKEH INTERIOR SETTINGS
float	BokehBiasInterior=0.00;			//0.00125	//-.00125;	//[KYO : Impacts overall brightness-exposure - Leave @0.00 for normalize]
float	BokehBiasCurveInterior=0.75;		//0.925		//.90	//.75	//1.0	
float	BokehBrightnessThresholdInterior=0.975;	//.825	//1.0	//.885	//.925
float	BokehBrightnessMultiplierInterior=1.00;	//1.125
float	RadiusScaleMultiplierInterior=2.23;	//2.33		

/*--------------------------------------------------------------------------------------------------------------
	IMAGE GRAIN Settings
--------------------------------------------------------------------------------------------------------------*/
// GRAIN DAY SETTINGS
float	NoiseAmountDay=0.075;		//0.095		//-0.35		//0.085		//0.195		//0.175
float	NoiseCurveDay=1.177;		//0.970		//0.50		//1.125		//0.50	
float	NoiseDiffusionDay=0.5;		//0.7		//[KYO : From 0.0 to 1.8]

// GRAIN NIGHT SETTINGS
float	NoiseAmountNight=0.0775;	//0.095		//-0.35		//0.085		//0.195		//0.175
float	NoiseCurveNight=0.999;		//0.970		//0.50		//1.125		//0.50	
float	NoiseDiffusionNight=0.5;	//0.7		//[KYO : From 0.0 to 1.8]

// GRAIN INTERIOR SETTINGS
float	NoiseAmountInterior=0.0725;	//0.095		//-0.35		//0.085		//0.195		//0.175
float	NoiseCurveInterior=0.999;	//0.970		//0.50		//1.125		//0.50	
float	NoiseDiffusionInterior=0.5;	//0.7		//[KYO : From 0.0 to 1.8]
	
/*--------------------------------------------------------------------------------------------------------------
	CHROMATIC ABERRATION settings
--------------------------------------------------------------------------------------------------------------*/
// CHROMATIC ABERRATION DAY
float	ChromaticAberrationAmountDay=0.225;

// CHROMATIC ABERRATION NIGHT
float	ChromaticAberrationAmountNight=0.25275;

// CHROMATIC ABERRATION INTERIOR
float	ChromaticAberrationAmountInterior=0.2225;	//0.225


/*--------------------------------------------------------------------------------------------------------------
	SHARPENING settings
--------------------------------------------------------------------------------------------------------------*/
// SHARPENING STRENGTH DAY
float fSharpScaleDay=0.0425;		//0.0325	//0.0315	//0.0515	//0.0625			

// SHARPENING STRENGTH NIGHT
float fSharpScaleNight=0.0435;		//0.0325	//0.0315	//0.0515	//0.06225	

// SHARPENING STRENGTH INTERIOR
float fSharpScaleInterior=0.0485;	//0.0335	//0.345		//0.0325	//0.0525	//0.06275	

// Set your Display resolution	
// 1,777777777777778 Ratio			
float2 fvTexelSize = float2(1.0 / 1920.0, 1.0 / 1080.0);	
//float2 fvTexelSize = float2(1.0 / 2560.0, 1.0 / 1440.0);
//float2 fvTexelSize = float2(1.0 / 3449.0, 1.0 / 1940.0);
//float2 fvTexelSize = float2(1.0 / 3840.0, 1.0 / 2160.0);
//float2 fvTexelSize = float2(1.0 / 2880.0, 1.0 / 1620.0);
//float2 fvTexelSize = float2(1.0 / 3200.0, 1.0 / 1800.0);
//float2 fvTexelSize = float2(1.0 / 3552.0, 1.0 / 1998.0);

// 1,6 Ratio			
//float2 fvTexelSize = float2(1.0 / 1680.0, 1.0 / 1050.0);	
//float2 fvTexelSize = float2(1.0 / 1920.0, 1.0 / 1200.0);
//float2 fvTexelSize = float2(1.0 / 3840.0, 1.0 / 2400.0);

// 2,35 : 1 Ratio
//float2 fvTexelSize = float2(1.0 / 2538.0, 1.0 / 1080.0);
//float2 fvTexelSize = float2(1.0 / 2869.0, 1.0 / 1221.0);
//float2 fvTexelSize = float2(1.0 / 3200.0, 1.0 / 1362.0);
//float2 fvTexelSize = float2(1.0 / 3760.0, 1.0 / 1600.0);

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/*--------------------------------------------------------------------------------------------------------------
	KYO : Now Start Code - DO NOT MODIFY ANYTHING BELOW ! Unless you know what you're doing.
--------------------------------------------------------------------------------------------------------------*/
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#ifndef ENABLE_FLIP_DAY_NIGHT_FACTOR
		1 - ENightDayFactor = ENightDayFactor;
#endif

/*--------------------------------------------------------------------------------------------------------------
	Code, routines, shaders - Coding skills required
--------------------------------------------------------------------------------------------------------------*/
float4 tempF1; //0,1,2,3
float4 tempF2; //5,6,7,8
float4 tempF3; //9,0
float4 ScreenSize;
float4 Timer;
float ENightDayFactor;
float EInteriorFactor;
float FadeFactor;

texture2D texColor;
texture2D texDepth;
texture2D texNoise;
texture2D texPalette;
texture2D texFocus; //computed focusing depth
texture2D texCurr; //4*4 texture for focusing
texture2D texPrev; //4*4 texture for focusing

sampler2D SamplerColor = sampler_state
{
	Texture   = <texColor>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;		
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;			
	MipMapLodBias=0;
};

sampler2D SamplerDepth = sampler_state
{
	Texture   = <texDepth>;
	MinFilter = POINT;
	MagFilter = POINT;
	MipFilter = NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D SamplerNoise = sampler_state
{
	Texture   = <texNoise>;
	MinFilter = POINT;
	MagFilter = POINT;
	MipFilter = NONE;//NONE;
	AddressU  = Wrap;
	AddressV  = Wrap;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D SamplerPalette = sampler_state
{
	Texture   = <texPalette>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;//NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D SamplerCurr = sampler_state
{
	Texture   = <texCurr>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = LINEAR;//NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D SamplerPrev = sampler_state
{
	Texture   = <texPrev>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D SamplerFocus = sampler_state
{
	Texture   = <texFocus>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

struct VS_OUTPUT_POST
{
	float4 vpos  : POSITION;
	float2 txcoord : TEXCOORD0;
};

struct VS_INPUT_POST
{
	float3 pos  : POSITION;
	float2 txcoord : TEXCOORD0;
};
		
/*------------------------------------------------------------
	Start focusing
------------------------------------------------------------*/
VS_OUTPUT_POST VS_Focus(VS_INPUT_POST IN)
{
	VS_OUTPUT_POST OUT;

	float4 pos=float4(IN.pos.x,IN.pos.y,IN.pos.z,1.0);

	OUT.vpos=pos;
	OUT.txcoord.xy=IN.txcoord.xy;

	return OUT;
}

float linearlizeDepth(float nonlinearDepth)
{
	float2 dofProj=float2(0.0509804, 3098.0392);
	float2 dofDist=float2(0.0, 0.0509804);
		
	float4 depth=nonlinearDepth;
	
	
	depth.y=-dofProj.x + dofProj.y;
	depth.y=1.0/depth.y;
	depth.z=depth.y * dofProj.y; 
	depth.z=depth.z * -dofProj.x; 
	depth.x=dofProj.y * -depth.y + depth.x;
	depth.x=1.0/depth.x;

	depth.y=depth.z * depth.x;

	depth.x=depth.z * depth.x - dofDist.y; 
	depth.x+=dofDist.x * -0.5;

	depth.x=max(depth.x, 0.0);
		
	return depth.x;
}

float4 PS_ReadFocus(VS_OUTPUT_POST IN) : COLOR
{

/*------------------------------------------------------------
	Offsets 
------------------------------------------------------------*/
float2 FocusPoint =lerp( lerp( FocusPointDay, FocusPointNight, 1 - ENightDayFactor ), FocusPointInterior, EInteriorFactor);
	float2 uvsrc=FocusPoint;

	float2 pixelSize=ScreenSize.y;
	pixelSize.y*=ScreenSize.z;

#ifdef USE_TIGHT_OFFSETS
	const float2 offset[4] = 
	{
		float2(0.262, 0.641),
		float2(0.262, -0.641),
		float2(0.641, 0.262),
		float2(-0.641, 0.262)
	};
#endif

#ifdef USE_CENTERED_OFFSETS
	const float2 offset[4] = 
	{
		float2(0.5, 1.0),
		float2(0.5, -1.0),
		float2(1.0, 0.5),
		float2(-1.0, 0.5)
	};
#endif

#ifdef USE_REGULAR_OFFSETS
	const float2 offset[4] = 
	{
		float2(0.3, 0.9),
		float2(0.3, -0.9),
		float2(0.9, 0.3),
		float2(-0.9, 0.3)
	};
#endif

#ifdef USE_ORIGINAL_OFFSETS
	const float2 offset[4]=
	{
		float2(0.0, 1.0),
		float2(0.0, -1.0),
		float2(1.0, 0.0),
		float2(-1.0, 0.0)
	};
#endif

#ifdef USE_WIDE_OFFSETS	
	const float2 offset[4]=
	{
		float2(0.524, 1.282),
		float2(0.524, -1.282),
		float2(1.282, 0.524),
		float2(-1.282, 0.524)
	};	
#endif

#ifdef USE_NATURAL_OFFSETS
	const float2 offset[16] = { 
	float2(0.2007, 0.9796),
	float2(-0.2007, 0.9796), 
	float2(0.2007, 0.9796),
	float2(-0.2007, 0.9796), 
		
	float2(0.8240, 0.5665),
	float2(0.5665, 0.8240),
	float2(0.8240, 0.5665),
	float2(0.5665, 0.8240),

	float2(0.9796, 0.2007),
	float2(0.9796, -0.2007),
	float2(0.9796, 0.2007),
	float2(0.9796, -0.2007),
		
	float2(-0.8240, 0.5665),
	float2(-0.5665, 0.8240),
	float2(-0.8240, 0.5665),
	float2(-0.5665, 0.8240)
};			
#endif	//Thanx Matso !;)

	float res=linearlizeDepth(tex2D(SamplerDepth, uvsrc.xy).x);
	for (int i=0; i<4; i++)
	{
		uvsrc.xy=uvsrc.xy;

		float FocusSampleRange =lerp( lerp( FocusSampleRangeDay, FocusSampleRangeNight, 1 - ENightDayFactor ), FocusSampleRangeInterior, EInteriorFactor);
		uvsrc.xy+=offset[i] * pixelSize.xy * FocusSampleRange;

float DepthClip =lerp( lerp( DepthClipDay, DepthClipNight, 1 - ENightDayFactor ), DepthClipInterior, EInteriorFactor);

		#ifdef NOT_BLURRING_SKY_MODE
			res+=linearlizeDepth(tex2D(SamplerDepth, uvsrc).x);
		#else
			res+=min(linearlizeDepth(tex2D(SamplerDepth, uvsrc).x), DepthClip);
		#endif
	}
	res*=0.2;	//.21	//.22
	return res;
}

float4 PS_WriteFocus(VS_OUTPUT_POST IN) : COLOR
{
float2 FocusPoint =lerp( lerp( FocusPointDay, FocusPointNight, 1 - ENightDayFactor ), FocusPointInterior, EInteriorFactor);
	float2 uvsrc=FocusPoint;

	float res=0.0;
	float curr=tex2D(SamplerCurr, uvsrc.xy).x;
	float prev=tex2D(SamplerPrev, uvsrc.xy).x;

	
	res=lerp(prev, curr, saturate(FadeFactor));//time elapsed factor

	return res;
}

technique ReadFocus
{
	pass P0
	{
		VertexShader = compile vs_3_0 VS_Focus();
		PixelShader  = compile ps_3_0 PS_ReadFocus();

		ZEnable=FALSE;
		CullMode=NONE;
		ALPHATESTENABLE=FALSE;
		SEPARATEALPHABLENDENABLE=FALSE;
		AlphaBlendEnable=FALSE;
		FogEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
}

technique WriteFocus
{
	pass P0
	{
		VertexShader = compile vs_3_0 VS_Focus();
		PixelShader  = compile ps_3_0 PS_WriteFocus();

		ZEnable=FALSE;
		CullMode=NONE;
		ALPHATESTENABLE=FALSE;
		SEPARATEALPHABLENDENABLE=FALSE;
		AlphaBlendEnable=FALSE;
		FogEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
}

VS_OUTPUT_POST VS_PostProcess(VS_INPUT_POST IN)
{
	VS_OUTPUT_POST OUT;

	float4 pos=float4(IN.pos.x,IN.pos.y,IN.pos.z,1.0);

	OUT.vpos=pos;
	OUT.txcoord.xy=IN.txcoord.xy;

	return OUT;
}

float4 PS_ProcessPass1(VS_OUTPUT_POST IN, float2 vPos : VPOS) : COLOR0
{

#ifndef	SHARPENING_DAY
float fSharpScaleDay=0.0;
#endif
#ifndef	SHARPENING_NIGHT
float fSharpScaleNight=0.0;
#endif
#ifndef	SHARPENING_INTERIOR
float fSharpScaleInterior=0.0;
#endif

	float2 coord = IN.txcoord.xy;
	float4 Color = 9.0 * tex2D(SamplerColor, coord.xy);

float fSharpScale =lerp( lerp( fSharpScaleDay, fSharpScaleNight, 1 - ENightDayFactor ), fSharpScaleInterior, EInteriorFactor);	

	Color -= tex2D(SamplerColor, coord.xy + float2(-fvTexelSize.x, fvTexelSize.y) * fSharpScale);
	Color -= tex2D(SamplerColor, coord.xy + float2(0.0, fvTexelSize.y) * fSharpScale);
	Color -= tex2D(SamplerColor, coord.xy + float2(fvTexelSize.x, fvTexelSize.y) * fSharpScale);
	Color -= tex2D(SamplerColor, coord.xy + float2(fvTexelSize.x, 0.0) * fSharpScale);
	Color -= tex2D(SamplerColor, coord.xy + float2(fvTexelSize.x, -fvTexelSize.y) * fSharpScale);
	Color -= tex2D(SamplerColor, coord.xy + float2(0.0, -fvTexelSize.y) * fSharpScale);
	Color -= tex2D(SamplerColor, coord.xy + float2(-fvTexelSize.x, -fvTexelSize.y) * fSharpScale);
	Color -= tex2D(SamplerColor, coord.xy + float2(-fvTexelSize.x, 0.0) * fSharpScale);
	
	Color.a = 1.0;
	return Color;
}

float4 PS_ProcessPass2(VS_OUTPUT_POST IN, float2 vPos : VPOS) : COLOR
{
	float4 res;
	float2 coord=IN.txcoord.xy;

	float4 origcolor=tex2D(SamplerColor, coord.xy);
	float scenedepth=tex2D(SamplerDepth, IN.txcoord.xy).x;
	float scenefocus=tex2D(SamplerFocus, 0.5).x;
	res.xyz=origcolor.xyz;

	float depth=linearlizeDepth(scenedepth);

float FarBlurCurve =lerp( lerp( FarBlurCurveDay, FarBlurCurveNight, 1 - ENightDayFactor ), FarBlurCurveInterior, EInteriorFactor);
float FocalPlaneDepth =lerp( lerp( FocalPlaneDepthDay, FocalPlaneDepthNight, 1 - ENightDayFactor ), FocalPlaneDepthInterior, EInteriorFactor);
float FarBlurDepth =lerp( lerp( FarBlurDepthDay, FarBlurDepthNight, 1 - ENightDayFactor ), FarBlurDepthInterior, EInteriorFactor);

	#ifdef AUTO_FOCUS
		float focalPlaneDepth=scenefocus;
		float farBlurDepth=scenefocus*pow(4.0, FarBlurCurve);
	#else
		float focalPlaneDepth=FocalPlaneDepth;
		float farBlurDepth=FarBlurDepth;
	#endif
	
	#ifdef TILT_SHIFT
float TiltShiftAngle =lerp( lerp( TiltShiftAngleDay, TiltShiftAngleNight, 1 - ENightDayFactor ), TiltShiftAngleInterior, EInteriorFactor);
		float shiftAngle=(frac(TiltShiftAngle / 90.0) == 0) ? 0.0 : TiltShiftAngle;
		float depthShift=1.0 + (0.5 - coord.x)*tan(-shiftAngle * 0.017453292);
		focalPlaneDepth*=depthShift;
		farBlurDepth*=depthShift;
	#endif
	
	
	if(depth < focalPlaneDepth)
		res.w=(depth - focalPlaneDepth)/focalPlaneDepth;
	else
	{
		res.w=(depth - focalPlaneDepth)/(farBlurDepth - focalPlaneDepth);
		res.w=saturate(res.w);
	}

	res.w=res.w * 0.5 + 0.5;
	
	#ifdef NOT_BLURRING_SKY_MODE
		#define	DEPTH_OF_FIELD_QUALITY 2	
		//#define DEPTH_OF_FIELD_QUALITY 0
		res.w=(depth > 1000.0) ? 0.5 : res.w;
	#endif
	
	return res;
}

float4 PS_ProcessPass3(VS_OUTPUT_POST IN, float2 vPos : VPOS) : COLOR
{
	float4 res;
	
	float2 coord=IN.txcoord.xy;

	float4 origcolor=tex2D(SamplerColor, coord.xy);
	
	float centerDepth=origcolor.w;

	float2 pixelSize=ScreenSize.y;
	pixelSize.y*=ScreenSize.z;
	float blurAmount=abs(centerDepth * 2.0 - 1.0);
	float discRadius=blurAmount * MaxDepthOfFieldQuality;

	float RadiusScaleMultiplier =lerp( lerp( RadiusScaleMultiplierDay, RadiusScaleMultiplierNight, 1 - ENightDayFactor ), RadiusScaleMultiplierInterior, EInteriorFactor);	
	float NearBlurCurve =lerp( lerp( NearBlurCurveDay, NearBlurCurveNight, 1 - ENightDayFactor ), NearBlurCurveInterior, EInteriorFactor);
	float BokehBias =lerp( lerp( BokehBiasDay, BokehBiasNight, 1 - ENightDayFactor ), BokehBiasInterior, EInteriorFactor);
	float BokehBrightnessThreshold =lerp( lerp( BokehBrightnessThresholdDay, BokehBrightnessThresholdNight, 1 - ENightDayFactor ), BokehBrightnessThresholdInterior, EInteriorFactor);
	float BokehBrightnessMultiplier =lerp( lerp( BokehBrightnessMultiplierDay, BokehBrightnessMultiplierNight, 1 - ENightDayFactor ), BokehBrightnessMultiplierInterior, EInteriorFactor);
	float BokehBiasCurve =lerp( lerp( BokehBiasCurveDay, BokehBiasCurveNight, 1 - ENightDayFactor ), BokehBiasCurveInterior, EInteriorFactor);
	
	discRadius*=RadiusScaleMultiplier;
	
	#ifdef AUTO_FOCUS
	discRadius*=(centerDepth < 0.5) ? (1.0 / max(NearBlurCurve, 1.0)) : 1.0;
	#endif
		
	res.xyz=origcolor.xyz;
	

	res.w=dot(res.xyz, 0.3333);
	res.w=max((res.w - BokehBrightnessThreshold) * BokehBrightnessMultiplier, 0.0);
	res.xyz*=1.0 + res.w*blurAmount;
	
	res.w=1.0;
	

	int dofQuality = MaxDepthOfFieldQuality;

	if (discRadius <= 0.2)
		dofQuality = 1;
	else if (discRadius <= 1.0)
		dofQuality = min(dofQuality, 2);
	else if (discRadius <= 2.3)
		dofQuality = min(dofQuality, 3);

	int	dofTaps = dofQuality * (dofQuality + 1) / 2.0;

	// adaptive quality
	if (dofQuality > 1 && EAdaptiveQualityFactor > 0.01)
	{
		float changeFactor = EAdaptiveQualityFactor * 4.0;
		float requestedDof = dofQuality - changeFactor;
		requestedDof = max(requestedDof, 1);
		
		dofTaps = requestedDof * (requestedDof + 1) / 2.0;
	}

	int loopNumber = dofQuality;

	float basedAngle = 360.0 / POLYGON_NUM;
	int inPartAngle = 0;

	float dofQualityRecip = 1.0f / float(dofQuality);
	float2 discRadiusInPixels = (pixelSize.xy * discRadius);

	int minLoopNumber = 0;

	[loop] 
	for(int i = 0; i < dofTaps; i++)
	{
		int numberOfSamplesInLoop = loopNumber * POLYGON_NUM;
		float inPartAngleStep = 360.0f / float(numberOfSamplesInLoop);
		float radiusCoeff = float(loopNumber) * dofQualityRecip;
		float powerCoeff = 1.0 + BokehBias * pow(radiusCoeff, BokehBiasCurve);

		float remainAngle = inPartAngleStep * ((inPartAngle * 17) % loopNumber);

		// sampling for each sixth

		// 0 -> 1
		float2 sampleOffset = lerp(float2(0.5f, 0.866025403f), float2(-0.5f, 0.866025403f), remainAngle / basedAngle) * radiusCoeff;

		float2 coordLow=coord.xy + (sampleOffset.xy * discRadiusInPixels);
		float4 tap=tex2Dlod(SamplerColor, float4(coordLow.x, coordLow.y, 0.0, 0.0));
		
		float weight = (tap.w >= centerDepth) ? 1.0 : abs(tap.w * 2.0 - 1.0);

		float luma = dot(tap.xyz, 0.3333);
		float brightMultiplier = max((luma - BokehBrightnessThreshold) * BokehBrightnessMultiplier, 0.0);
		tap.xyz *= 1.0 + brightMultiplier * abs(tap.w * 2.0 - 1.0);
		tap.xyz *= powerCoeff;
		
		res.xyz += tap.xyz * weight;
		res.w += weight;

		// 1 -> 2
		sampleOffset = lerp(float2(-0.5f, 0.866025403f), float2(-1.0f, 0.0f), remainAngle / basedAngle) * radiusCoeff;

		coordLow=coord.xy + (sampleOffset.xy * discRadiusInPixels);
		tap=tex2Dlod(SamplerColor, float4(coordLow.x, coordLow.y, 0.0, 0.0));
		
		weight = (tap.w >= centerDepth) ? 1.0 : abs(tap.w * 2.0 - 1.0);

		luma = dot(tap.xyz, 0.3333);
		brightMultiplier = max((luma - BokehBrightnessThreshold) * BokehBrightnessMultiplier, 0.0);
		tap.xyz *= 1.0 + brightMultiplier * abs(tap.w * 2.0 - 1.0);
		tap.xyz *= powerCoeff;
		
		res.xyz += tap.xyz * weight;
		res.w += weight;

		// 2 -> 3
		sampleOffset = lerp(float2(-1.0f, 0.0f), float2(-0.5f, -0.866025403f), remainAngle / basedAngle) * radiusCoeff;

		coordLow=coord.xy + (sampleOffset.xy * discRadiusInPixels);
		tap=tex2Dlod(SamplerColor, float4(coordLow.x, coordLow.y, 0.0, 0.0));
		
		weight = (tap.w >= centerDepth) ? 1.0 : abs(tap.w * 2.0 - 1.0);

		luma = dot(tap.xyz, 0.3333);
		brightMultiplier = max((luma - BokehBrightnessThreshold) * BokehBrightnessMultiplier, 0.0);
		tap.xyz *= 1.0 + brightMultiplier * abs(tap.w * 2.0 - 1.0);
		tap.xyz *= powerCoeff;
		
		res.xyz += tap.xyz * weight;
		res.w += weight;

		// 3 -> 4
		sampleOffset = lerp(float2(-0.5f, -0.866025403f), float2(0.5f, -0.866025403f), remainAngle / basedAngle) * radiusCoeff;

		coordLow=coord.xy + (sampleOffset.xy * discRadiusInPixels);
		tap=tex2Dlod(SamplerColor, float4(coordLow.x, coordLow.y, 0.0, 0.0));
		
		weight = (tap.w >= centerDepth) ? 1.0 : abs(tap.w * 2.0 - 1.0);

		luma = dot(tap.xyz, 0.3333);
		brightMultiplier = max((luma - BokehBrightnessThreshold) * BokehBrightnessMultiplier, 0.0);
		tap.xyz *= 1.0 + brightMultiplier * abs(tap.w * 2.0 - 1.0);
		tap.xyz *= powerCoeff;
		
		res.xyz += tap.xyz * weight;
		res.w += weight;

		// 4 -> 5
		sampleOffset = lerp(float2(0.5f, -0.866025403f), float2(1.0f, 0.0f), remainAngle / basedAngle) * radiusCoeff;

		coordLow=coord.xy + (sampleOffset.xy * discRadiusInPixels);
		tap=tex2Dlod(SamplerColor, float4(coordLow.x, coordLow.y, 0.0, 0.0));
		
		weight = (tap.w >= centerDepth) ? 1.0 : abs(tap.w * 2.0 - 1.0);

		luma = dot(tap.xyz, 0.3333);
		brightMultiplier = max((luma - BokehBrightnessThreshold) * BokehBrightnessMultiplier, 0.0);
		tap.xyz *= 1.0 + brightMultiplier * abs(tap.w * 2.0 - 1.0);
		tap.xyz *= powerCoeff;
		
		res.xyz += tap.xyz * weight;
		res.w += weight;

		// 5 -> 0
		sampleOffset = lerp(float2(1.0f, 0.0f), float2(0.5f, 0.866025403f), remainAngle / basedAngle) * radiusCoeff;

		coordLow=coord.xy + (sampleOffset.xy * discRadiusInPixels);
		tap=tex2Dlod(SamplerColor, float4(coordLow.x, coordLow.y, 0.0, 0.0));
		
		weight = (tap.w >= centerDepth) ? 1.0 : abs(tap.w * 2.0 - 1.0);

		luma = dot(tap.xyz, 0.3333);
		brightMultiplier = max((luma - BokehBrightnessThreshold) * BokehBrightnessMultiplier, 0.0);
		tap.xyz *= 1.0 + brightMultiplier * abs(tap.w * 2.0 - 1.0);
		tap.xyz *= powerCoeff;
		
		res.xyz += tap.xyz * weight;
		res.w += weight;


		--loopNumber;
		if (loopNumber == minLoopNumber)
		{
			loopNumber = dofQuality;
			inPartAngle += 1;
			++minLoopNumber;
		}
	}

	res.xyz /= res.w;
	res.w=centerDepth;

	return res;
}

float4 PS_ProcessPass4(VS_OUTPUT_POST IN, float2 vPos : VPOS) : COLOR
{
float RadiusScaleMultiplier =lerp( lerp( RadiusScaleMultiplierDay, RadiusScaleMultiplierNight, 1 - ENightDayFactor ), RadiusScaleMultiplierInterior, EInteriorFactor);	

	float2 coord=IN.txcoord.xy;	
	float2 pixelSize=ScreenSize.y;
	pixelSize.y*=ScreenSize.z;
	
	float4 origcolor=tex2D(SamplerColor, coord.xy);
	float depth=origcolor.w;
	float blurAmount=abs(depth * 2.0 - 1.0);
	float discRadius=blurAmount * float(DEPTH_OF_FIELD_QUALITY) * RadiusScaleMultiplier;

float NearBlurCurve =lerp( lerp( NearBlurCurveDay, NearBlurCurveNight, 1 - ENightDayFactor ), NearBlurCurveInterior, EInteriorFactor);	

	#ifdef AUTO_FOCUS
		discRadius*=(depth < 0.5) ? (1.0 / max(NearBlurCurve, 1.0)) : 1.0;
	#endif

#ifndef	ChA_DAY
float	ChromaticAberrationAmountDay=0.0;
#endif
#ifndef	ChA_NIGHT
float	ChromaticAberrationAmountNight=0.0;
#endif
#ifndef	ChA_INTERIOR
float	ChromaticAberrationAmountInterior=0.0;
#endif

	float4 res=origcolor;

	float3 distortion=float3(-1.0, 0.0, 1.0);
float ChromaticAberrationAmount =lerp( lerp( ChromaticAberrationAmountDay, ChromaticAberrationAmountNight, 1 - ENightDayFactor ), ChromaticAberrationAmountInterior, EInteriorFactor);

	distortion*=ChromaticAberrationAmount*discRadius;

	origcolor=tex2D(SamplerColor, coord.xy + pixelSize.xy*distortion.x);
	origcolor.w=smoothstep(0.0, depth, origcolor.w);
	res.x=lerp(res.x, origcolor.x, origcolor.w);
	
	origcolor=tex2D(SamplerColor, coord.xy + pixelSize.xy*distortion.z);
	origcolor.w=smoothstep(0.0, depth, origcolor.w);
	res.z=lerp(res.z, origcolor.z, origcolor.w);

	return res;
}

float4 PS_ProcessPass5(VS_OUTPUT_POST IN, float2 vPos : VPOS) : COLOR
{
	float2 coord=IN.txcoord.xy;
	
	float2 pixelSize=ScreenSize.y;
	pixelSize.y*=ScreenSize.z;
	
	float4 origcolor=tex2D(SamplerColor, coord.xy);
	float depth=origcolor.w;
	float blurAmount=abs(depth*2.0 - 1.0);

float NearBlurCurve =lerp( lerp( NearBlurCurveDay, NearBlurCurveNight, 1 - ENightDayFactor ), NearBlurCurveInterior, EInteriorFactor);	

	#if (DEPTH_OF_FIELD_QUALITY > 0)
		#ifdef AUTO_FOCUS
			blurAmount*=(depth < 0.5) ? (1.0 / max(NearBlurCurve, 1.0)) : 1.0;
		#endif
		blurAmount=smoothstep(0.15, 1.0, blurAmount);
	#endif
	
	float weight[5] = {0.2270270270, 0.1945945946, 0.1216216216, 0.0540540541, 
		0.0162162162};
	
	float4 res=origcolor * weight[0];
	
	for(int i=1; i < 5; i++)
	{
		res+=tex2D(SamplerColor, coord.xy + float2(i*pixelSize.x*blurAmount, 0)) * weight[i];
		res+=tex2D(SamplerColor, coord.xy - float2(i*pixelSize.x*blurAmount, 0)) * weight[i];
	}
	
	res.w=depth;
	
	return res;
}

float4 PS_ProcessPass6(VS_OUTPUT_POST IN, float2 vPos : VPOS) : COLOR
{
	float2 coord=IN.txcoord.xy;
	
	float2 pixelSize=ScreenSize.y;
	pixelSize.y*=ScreenSize.z;
		
	float4 origcolor=tex2D(SamplerColor, coord.xy);
	float depth=origcolor.w;
	float blurAmount=abs(depth*2.0 - 1.0);

float NearBlurCurve =lerp( lerp( NearBlurCurveDay, NearBlurCurveNight, 1 - ENightDayFactor ), NearBlurCurveInterior, EInteriorFactor);
	
	#if (DEPTH_OF_FIELD_QUALITY > 0)
		#ifdef AUTO_FOCUS
			blurAmount*=(depth < 0.5) ? (1.0 / max(NearBlurCurve, 1.0)) : 1.0;
		#endif
		blurAmount=smoothstep(0.15, 1.0, blurAmount);
	#endif
	
	float weight[5] = {0.2270270270, 0.1945945946, 0.1216216216, 0.0540540541, 
		0.0162162162};
	float4 res=origcolor * weight[0];

	for(int i=1; i < 5; i++)
	{
		res+=tex2D(SamplerColor, coord.xy + float2(0, i*pixelSize.y*blurAmount)) * weight[i];
		res+=tex2D(SamplerColor, coord.xy - float2(0, i*pixelSize.y*blurAmount)) * weight[i];
	}
	
#ifndef GRAIN_DAY
float	NoiseAmountDay=0.0;
float	NoiseCurveDay=0.0;	
float	NoiseDiffusionDay=0.0;
#endif
#ifndef GRAIN_NIGHT
float	NoiseAmountNight=0.0;
float	NoiseCurveNight=0.0;	
float	NoiseDiffusionNight=0.0;
#endif
#ifndef GRAIN_INTERIOR
float	NoiseAmountInterior=0.0;
float	NoiseCurveInterior=0.0;	
float	NoiseDiffusionInterior=0.0;
#endif

	#if (GRAIN_FORMULA==1)
	float origgray=max(res.x, res.y);	//dot(res.xyz, 0.333);
	origgray=max(origgray, res.z);
	#else
	#if (GRAIN_FORMULA==2)
	float origgray=dot(res.xyz, 0.3333);
	origgray/=origgray + 1.0;
 	 #endif
	#endif

	coord.xy=IN.txcoord.xy*16.0 + origgray;
	float4 cnoi=tex2D(SamplerNoise, coord);

float NoiseAmount =lerp( lerp( NoiseAmountDay, NoiseAmountNight, 1 - ENightDayFactor ), NoiseAmountInterior, EInteriorFactor);
float NoiseCurve =lerp( lerp( NoiseCurveDay, NoiseCurveNight, 1 - ENightDayFactor ), NoiseCurveInterior, EInteriorFactor);
float noiseAmount=NoiseAmount*pow(blurAmount, NoiseCurve);
float NoiseDiffusion =lerp( lerp( NoiseDiffusionDay, NoiseDiffusionNight, 1 - ENightDayFactor ), NoiseDiffusionInterior, EInteriorFactor);

	res=lerp(res, (cnoi.x+0.5)*res, noiseAmount*saturate(1.0-origgray*NoiseDiffusion));	
	
	res.w=depth;
		
	return res;
}
#ifdef USE_SHARPENING
technique PostProcess
{
	pass P0
	{

		VertexShader = compile vs_3_0 VS_PostProcess();
		PixelShader  = compile ps_3_0 PS_ProcessPass1();

		DitherEnable=FALSE;
		ZEnable=FALSE;
		CullMode=NONE;
		ALPHATESTENABLE=FALSE;
		SEPARATEALPHABLENDENABLE=FALSE;
		AlphaBlendEnable=FALSE;
		StencilEnable=FALSE;
		FogEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
}
#endif
#ifdef USE_SHARPENING
technique PostProcess2
#else
technique PostProcess
#endif
{
	pass P0
	{

		VertexShader = compile vs_3_0 VS_PostProcess();
		PixelShader  = compile ps_3_0 PS_ProcessPass2();

		DitherEnable=FALSE;
		ZEnable=FALSE;
		CullMode=NONE;
		ALPHATESTENABLE=FALSE;
		SEPARATEALPHABLENDENABLE=FALSE;
		AlphaBlendEnable=FALSE;
		StencilEnable=FALSE;
		FogEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
}

#ifdef USE_SHARPENING
technique PostProcess3
#else
technique PostProcess2
#endif
{
	pass P0
	{

		VertexShader = compile vs_3_0 VS_PostProcess();
		PixelShader  = compile ps_3_0 PS_ProcessPass3();

		DitherEnable=FALSE;
		ZEnable=FALSE;
		CullMode=NONE;
		ALPHATESTENABLE=FALSE;
		SEPARATEALPHABLENDENABLE=FALSE;
		AlphaBlendEnable=FALSE;
		StencilEnable=FALSE;
		FogEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
}

#ifdef USE_SHARPENING
technique PostProcess4
#else
technique PostProcess3
#endif
{
	pass P0
	{

		VertexShader = compile vs_3_0 VS_PostProcess();
		PixelShader  = compile ps_3_0 PS_ProcessPass4();

		DitherEnable=FALSE;
		ZEnable=FALSE;
		CullMode=NONE;
		ALPHATESTENABLE=FALSE;
		SEPARATEALPHABLENDENABLE=FALSE;
		AlphaBlendEnable=FALSE;
		StencilEnable=FALSE;
		FogEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
}

#ifdef USE_SHARPENING
technique PostProcess5
#else
technique PostProcess4
#endif
{
	pass P0
	{

		VertexShader = compile vs_3_0 VS_PostProcess();
		PixelShader  = compile ps_3_0 PS_ProcessPass5();

		DitherEnable=FALSE;
		ZEnable=FALSE;
		CullMode=NONE;
		ALPHATESTENABLE=FALSE;
		SEPARATEALPHABLENDENABLE=FALSE;
		AlphaBlendEnable=FALSE;
		StencilEnable=FALSE;
		FogEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
}

#ifdef USE_SHARPENING
technique PostProcess6
#else
technique PostProcess5
#endif
{
	pass P0
	{

		VertexShader = compile vs_3_0 VS_PostProcess();
		PixelShader  = compile ps_3_0 PS_ProcessPass6();

		DitherEnable=FALSE;
		ZEnable=FALSE;
		CullMode=NONE;
		ALPHATESTENABLE=FALSE;
		SEPARATEALPHABLENDENABLE=FALSE;
		AlphaBlendEnable=FALSE;
		StencilEnable=FALSE;
		FogEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
}