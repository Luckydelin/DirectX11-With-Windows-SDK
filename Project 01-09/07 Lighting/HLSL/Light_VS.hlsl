#include "Light.hlsli"

// 顶点着色器
VertexOut VS(VertexIn vIn)
{
    VertexOut vOut;
    matrix viewProj = mul(g_View, g_Proj);//mvp,m=srt   vp矩阵
    float4 posW = mul(float4(vIn.posL, 1.0f), g_World);// m矩阵 到世界空间

    vOut.posH = mul(posW, viewProj);//世界空间-》裁剪空间
    vOut.posW = posW.xyz;//世界空间下的位置
    vOut.normalW = mul(vIn.normalL, (float3x3) g_WorldInvTranspose);//世界空间下的法线量
    vOut.color = vIn.color; // 这里alpha通道的值默认为1.0
    return vOut; 
}
