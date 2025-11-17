# QuakeSpasm OpenGL函数调用文档

本文档列出了所有直接调用OpenGL函数的函数，包括它们的定义和用途。

## 渲染核心函数

### 1. R_SetupGL() - [`gl_rmain.c`](Quake/gl_rmain.c:489)
**定义**: `void R_SetupGL (void)`
**用途**: 设置OpenGL渲染状态，包括投影矩阵、视图矩阵和基本的渲染参数。这是每帧渲染的核心设置函数。
**调用的OpenGL函数**:
- `glMatrixMode(GL_PROJECTION)` - 设置投影矩阵模式
- `glLoadIdentity()` - 重置当前矩阵
- `glViewport()` - 设置视口
- `glFrustum()` - 设置透视投影
- `glMatrixMode(GL_MODELVIEW)` - 设置模型视图矩阵模式
- `glRotatef()` - 应用旋转变换
- `glTranslatef()` - 应用平移变换
- `glEnable(GL_CULL_FACE)` / `glDisable(GL_CULL_FACE)` - 控制面剔除
- `glDisable(GL_BLEND)` - 禁用混合
- `glDisable(GL_ALPHA_TEST)` - 禁用alpha测试
- `glEnable(GL_DEPTH_TEST)` - 启用深度测试

### 2. R_Clear() - [`gl_rmain.c`](Quake/gl_rmain.c:535)
**定义**: `void R_Clear (void)`
**用途**: 清除帧缓冲区，为新的渲染帧做准备。
**调用的OpenGL函数**:
- `glClear()` - 清除指定的缓冲区

### 3. R_RenderView() - [`gl_rmain.c`](Quake/gl_rmain.c:1068)
**定义**: `void R_RenderView (void)`
**用途**: 主渲染函数，负责渲染整个3D场景。
**调用的OpenGL函数**:
- `glFinish()` - 等待所有OpenGL命令完成
- `glColorMask()` - 控制颜色通道写入（用于立体渲染）

## 2D绘制函数

### 4. GL_Set2D() - [`gl_draw.c`](Quake/gl_draw.c:762)
**定义**: `void GL_Set2D (void)`
**用途**: 设置2D渲染模式，用于UI、控制台等2D元素的绘制。
**调用的OpenGL函数**:
- `glDisable(GL_DEPTH_TEST)` - 禁用深度测试
- `glDisable(GL_CULL_FACE)` - 禁用面剔除
- `glDisable(GL_BLEND)` - 禁用混合
- `glEnable(GL_ALPHA_TEST)` - 启用alpha测试
- `glColor4f()` - 设置颜色

### 5. GL_SetCanvas() - [`gl_draw.c`](Quake/gl_draw.c:680)
**定义**: `void GL_SetCanvas (canvastype newcanvas)`
**用途**: 设置不同的画布类型（控制台、菜单、状态栏等）的投影和视口。
**调用的OpenGL函数**:
- `glMatrixMode(GL_PROJECTION)` - 设置投影矩阵
- `glLoadIdentity()` - 重置矩阵
- `glOrtho()` - 设置正交投影
- `glViewport()` - 设置视口
- `glMatrixMode(GL_MODELVIEW)` - 设置模型视图矩阵

### 6. Draw_Character() - [`gl_draw.c`](Quake/gl_draw.c:458)
**定义**: `void Draw_Character (int x, int y, int num)`
**用途**: 绘制单个字符。
**调用的OpenGL函数**:
- `GL_Bind()` - 绑定字符纹理
- `glBegin(GL_QUADS)` - 开始绘制四边形
- `glTexCoord2f()` - 设置纹理坐标
- `glVertex2f()` - 设置顶点坐标
- `glEnd()` - 结束绘制

### 7. Draw_String() - [`gl_draw.c`](Quake/gl_draw.c:481)
**定义**: `void Draw_String (int x, int y, const char *str)`
**用途**: 绘制字符串。
**调用的OpenGL函数**:
- `GL_Bind()` - 绑定字符纹理
- `glBegin(GL_QUADS)` - 开始绘制四边形
- `glTexCoord2f()` - 设置纹理坐标
- `glVertex2f()` - 设置顶点坐标
- `glEnd()` - 结束绘制

### 8. Draw_Pic() - [`gl_draw.c`](Quake/gl_draw.c:505)
**定义**: `void Draw_Pic (int x, int y, qpic_t *pic)`
**用途**: 绘制图片。
**调用的OpenGL函数**:
- `GL_Bind()` - 绑定图片纹理
- `glBegin(GL_QUADS)` - 开始绘制四边形
- `glTexCoord2f()` - 设置纹理坐标
- `glVertex2f()` - 设置顶点坐标
- `glEnd()` - 结束绘制

### 9. Draw_Fill() - [`gl_draw.c`](Quake/gl_draw.c:624)
**定义**: `void Draw_Fill (int x, int y, int w, int h, int c, float alpha)`
**用途**: 用纯色填充矩形区域。
**调用的OpenGL函数**:
- `glDisable(GL_TEXTURE_2D)` - 禁用纹理
- `glEnable(GL_BLEND)` - 启用混合
- `glDisable(GL_ALPHA_TEST)` - 禁用alpha测试
- `glColor4f()` - 设置颜色和透明度
- `glBegin(GL_QUADS)` - 开始绘制四边形
- `glVertex2f()` - 设置顶点坐标
- `glEnd()` - 结束绘制
- `glColor3f()` - 重置颜色
- `glDisable(GL_BLEND)` - 禁用混合
- `glEnable(GL_ALPHA_TEST)` - 启用alpha测试
- `glEnable(GL_TEXTURE_2D)` - 启用纹理

### 10. Draw_ConsoleBackground() - [`gl_draw.c`](Quake/gl_draw.c:553)
**定义**: `void Draw_ConsoleBackground (void)`
**用途**: 绘制控制台背景。
**调用的OpenGL函数**:
- `glEnable(GL_BLEND)` - 启用混合
- `glColor4f()` - 设置颜色和透明度
- `glDisable(GL_ALPHA_TEST)` - 禁用alpha测试
- `glTexEnvf()` - 设置纹理环境
- `glTexEnvf()` - 重置纹理环境
- `glEnable(GL_ALPHA_TEST)` - 启用alpha测试
- `glDisable(GL_BLEND)` - 禁用混合

## 模型渲染函数

### 11. R_DrawAliasModel() - [`r_alias.c`](Quake/r_alias.c:600)
**定义**: `void R_DrawAliasModel (entity_t *e)`
**用途**: 绘制别名模型（玩家、怪物等）。
**调用的OpenGL函数**:
- `glDepthMask(GL_FALSE)` - 禁用深度写入
- `glEnable(GL_BLEND)` - 启用混合
- `glColor4f()` - 设置颜色和透明度
- `glTexEnvf()` - 设置纹理环境
- `glBlendFunc()` - 设置混合函数
- `glColor3f()` - 设置颜色
- `glTexEnvi()` - 设置纹理环境参数
- `GL_EnableMultitexture()` - 启用多重纹理
- `GL_DisableMultitexture()` - 禁用多重纹理
- `glHint()` - 设置渲染提示
- `glShadeModel()` - 设置着色模式
- `glDepthMask(GL_TRUE)` - 启用深度写入
- `glDisable(GL_BLEND)` - 禁用混合
- `glDisable(GL_ALPHA_TEST)` - 禁用alpha测试
- `glPopMatrix()` - 弹出矩阵

### 12. GL_DrawAliasFrame() - [`r_alias.c`](Quake/r_alias.c:400)
**定义**: `void GL_DrawAliasFrame (aliashdr_t *paliashdr, lerpdata_t lerpdata)`
**用途**: 绘制别名模型的单个帧。
**调用的OpenGL函数**:
- `glBegin(GL_TRIANGLES)` - 开始绘制三角形
- `glTexCoord2f()` - 设置纹理坐标
- `glVertex3fv()` - 设置顶点坐标
- `glEnd()` - 结束绘制

## 世界渲染函数

### 13. R_DrawWorld() - [`r_world.c`](Quake/r_world.c:1100)
**定义**: `void R_DrawWorld (void)`
**用途**: 绘制游戏世界（地图几何体）。
**调用的OpenGL函数**:
- `GL_Bind()` - 绑定纹理
- `glBegin(GL_POLYGON)` - 开始绘制多边形
- `glTexCoord2f()` - 设置纹理坐标
- `glVertex3fv()` - 设置顶点坐标
- `glEnd()` - 结束绘制
- `glTexEnvf()` - 设置纹理环境
- `glColor3f()` - 设置颜色
- `glEnable(GL_BLEND)` - 启用混合
- `glBlendFunc()` - 设置混合函数
- `glDisable(GL_BLEND)` - 禁用混合

## 粒子系统函数

### 14. R_DrawParticles() - [`r_part.c`](Quake/r_part.c:820)
**定义**: `void R_DrawParticles (void)`
**用途**: 绘制粒子效果（爆炸、火花等）。
**调用的OpenGL函数**:
- `glEnable(GL_BLEND)` - 启用混合
- `glTexEnvf()` - 设置纹理环境
- `glDepthMask(GL_FALSE)` - 禁用深度写入
- `glColor4ubv()` - 设置颜色
- `glDisable(GL_BLEND)` - 禁用混合
- `glTexEnvf()` - 重置纹理环境
- `glColor3f()` - 重置颜色

## 天空渲染函数

### 15. Sky_DrawSky() - [`gl_sky.c`](Quake/gl_sky.c:1089)
**定义**: `void Sky_DrawSky (void)`
**用途**: 绘制天空盒或滚动云层。
**调用的OpenGL函数**:
- `glDisable(GL_TEXTURE_2D)` - 禁用纹理
- `glColor3fv()` - 设置颜色
- `glEnable(GL_TEXTURE_2D)` - 启用纹理
- `glDepthFunc(GL_GEQUAL)` - 设置深度测试函数
- `glDepthMask(0)` - 禁用深度写入
- `glDepthMask(1)` - 启用深度写入
- `glDepthFunc(GL_LEQUAL)` - 重置深度测试函数

### 16. Sky_DrawSkyBox() - [`gl_sky.c`](Quake/gl_sky.c:802)
**定义**: `void Sky_DrawSkyBox (void)`
**用途**: 绘制天空盒。
**调用的OpenGL函数**:
- `GL_Bind()` - 绑定天空盒纹理
- `glBegin(GL_QUADS)` - 开始绘制四边形
- `glTexCoord2f()` - 设置纹理坐标
- `glVertex3fv()` - 设置顶点坐标
- `glEnd()` - 结束绘制
- `glEnable(GL_BLEND)` - 启用混合
- `glDisable(GL_TEXTURE_2D)` - 禁用纹理
- `glColor4f()` - 设置颜色和透明度
- `glEnable(GL_TEXTURE_2D)` - 启用纹理
- `glDisable(GL_BLEND)` - 禁用混合

## 雾效函数

### 17. Fog_SetupFrame() - [`gl_fog.c`](Quake/gl_fog.c:305)
**定义**: `void Fog_SetupFrame (void)`
**用途**: 设置每帧的雾效参数。
**调用的OpenGL函数**:
- `glFogfv()` - 设置雾颜色
- `glFogf()` - 设置雾密度

### 18. Fog_EnableGFog() - [`gl_fog.c`](Quake/gl_fog.c:318)
**定义**: `void Fog_EnableGFog (void)`
**用途**: 启用全局雾效。
**调用的OpenGL函数**:
- `glEnable(GL_FOG)` - 启用雾效

### 19. Fog_DisableGFog() - [`gl_fog.c`](Quake/gl_fog.c:331)
**定义**: `void Fog_DisableGFog (void)`
**用途**: 禁用全局雾效。
**调用的OpenGL函数**:
- `glDisable(GL_FOG)` - 禁用雾效

## 纹理管理函数

### 20. GL_Bind() - [`gl_texmgr.c`](Quake/gl_texmgr.c:1608)
**定义**: `void GL_Bind (gltexture_t *texture)`
**用途**: 绑定纹理到当前纹理单元。
**调用的OpenGL函数**:
- `glBindTexture()` - 绑定纹理

### 21. GL_EnableMultitexture() - [`gl_texmgr.c`](Quake/gl_texmgr.c:1593)
**定义**: `void GL_EnableMultitexture(void)`
**用途**: 启用多重纹理支持。
**调用的OpenGL函数**:
- `GL_SelectTexture()` - 选择纹理单元
- `glEnable(GL_TEXTURE_2D)` - 启用2D纹理

### 22. GL_DisableMultitexture() - [`gl_texmgr.c`](Quake/gl_texmgr.c:1578)
**定义**: `void GL_DisableMultitexture(void)`
**用途**: 禁用多重纹理支持。
**调用的OpenGL函数**:
- `glDisable(GL_TEXTURE_2D)` - 禁用2D纹理
- `GL_SelectTexture()` - 选择纹理单元

## 视频系统函数

### 23. GL_SetupState() - [`gl_vidsdl.c`](Quake/gl_vidsdl.c:1332)
**定义**: `static void GL_SetupState (void)`
**用途**: 初始化OpenGL状态，设置默认的渲染参数。
**调用的OpenGL函数**:
- `glClearColor()` - 设置清除颜色
- `glCullFace(GL_BACK)` - 设置背面剔除
- `glFrontFace(GL_CW)` - 设置正面方向
- `glEnable(GL_TEXTURE_2D)` - 启用2D纹理
- `glEnable(GL_ALPHA_TEST)` - 启用alpha测试
- `glAlphaFunc()` - 设置alpha测试函数
- `glPolygonMode()` - 设置多边形模式
- `glShadeModel()` - 设置着色模式
- `glHint()` - 设置渲染提示
- `glBlendFunc()` - 设置混合函数
- `glTexEnvf()` - 设置纹理环境
- `glTexParameterf()` - 设置纹理参数
- `glDepthRange()` - 设置深度范围
- `glDepthFunc()` - 设置深度测试函数

### 24. GL_Init() - [`gl_vidsdl.c`](Quake/gl_vidsdl.c:1358)
**定义**: `static void GL_Init (void)`
**用途**: 初始化OpenGL，获取版本信息和扩展。
**调用的OpenGL函数**:
- `glGetString()` - 获取OpenGL字符串信息

## 特殊效果函数

### 25. R_ShowTris() - [`gl_rmain.c`](Quake/gl_rmain.c:799)
**定义**: `void R_ShowTris (void)`
**用途**: 显示三角形线框，用于调试。
**调用的OpenGL函数**:
- `glDisable(GL_DEPTH_TEST)` - 禁用深度测试
- `glPolygonMode(GL_FRONT_AND_BACK, GL_LINE)` - 设置线框模式
- `glDisable(GL_TEXTURE_2D)` - 禁用纹理
- `glColor3f()` - 设置颜色
- `glEnable(GL_TEXTURE_2D)` - 启用纹理
- `glPolygonMode(GL_FRONT_AND_BACK, GL_FILL)` - 重置填充模式
- `glEnable(GL_DEPTH_TEST)` - 启用深度测试

### 26. R_DrawShadows() - [`gl_rmain.c`](Quake/gl_rmain.c:883)
**定义**: `void R_DrawShadows (void)`
**用途**: 绘制实体阴影。
**调用的OpenGL函数**:
- `glClear(GL_STENCIL_BUFFER_BIT)` - 清除模板缓冲区
- `glStencilFunc()` - 设置模板测试函数
- `glStencilOp()` - 设置模板操作
- `glEnable(GL_STENCIL_TEST)` - 启用模板测试
- `glDisable(GL_STENCIL_TEST)` - 禁用模板测试
### 27. SCR_ScreenShot_f() - [`gl_screen.c`](Quake/gl_screen.c:757)
**定义**: `void SCR_ScreenShot_f (void)`
**用途**: 截取屏幕截图，支持PNG、TGA、JPG格式。
**调用的OpenGL函数**:
- `glPixelStorei(GL_PACK_ALIGNMENT, 1)` - 设置像素存储模式
- `glReadPixels()` - 读取帧缓冲区像素数据

### 28. GL_BeginRendering() - [`gl_vidsdl.c`](Quake/gl_vidsdl.c:1409)
**定义**: `void GL_BeginRendering (int *x, int *y, int *width, int *height)`
**用途**: 开始渲染，设置渲染区域参数。
**调用的OpenGL函数**: 无直接调用，但设置渲染状态

### 29. GL_EndRendering() - [`gl_vidsdl.c`](Quake/gl_vidsdl.c:1421)
**定义**: `void GL_EndRendering (void)`
**用途**: 结束渲染，交换前后缓冲区。
**调用的OpenGL函数**:
- `SDL_GL_SwapWindow()` / `SDL_GL_SwapBuffers()` - 交换缓冲区


## 总结

这个文档列出了QuakeSpasm中所有直接调用OpenGL函数的函数，按功能模块分类：

1. **渲染核心**: 场景设置、清除、主渲染循环
   - R_SetupGL(), R_Clear(), R_RenderView(), R_RenderScene()

2. **2D绘制**: UI元素、文字、图片、控制台
   - GL_Set2D(), GL_SetCanvas(), Draw_Character(), Draw_String(), Draw_Pic(), Draw_Fill(), Draw_ConsoleBackground(), SCR_ScreenShot_f()

3. **模型渲染**: 别名模型（玩家、怪物）
   - R_DrawAliasModel(), GL_DrawAliasFrame()

4. **世界渲染**: 地图几何体
   - R_DrawWorld(), R_DrawTextureChains()

5. **粒子系统**: 粒子效果
   - R_DrawParticles()

6. **天空渲染**: 天空盒和云层
   - Sky_DrawSky(), Sky_DrawSkyBox(), Sky_DrawSkyLayers()

7. **雾效**: 全局雾效
   - Fog_SetupFrame(), Fog_EnableGFog(), Fog_DisableGFog(), Fog_StartAdditive(), Fog_StopAdditive()

8. **纹理管理**: 纹理绑定和多重纹理
   - GL_Bind(), GL_EnableMultitexture(), GL_DisableMultitexture(), TexMgr_SetFilterModes()

9. **视频系统**: OpenGL初始化和状态设置
   - GL_SetupState(), GL_Init(), GL_BeginRendering(), GL_EndRendering()

10. **特殊效果**: 调试显示、阴影、截图
    - R_ShowTris(), R_DrawShadows(), SCR_ScreenShot_f()

总共记录了 **29个函数**，涵盖了QuakeSpasm引擎中所有直接调用OpenGL API的函数。每个函数都详细说明了其用途和调用的具体OpenGL函数，为理解QuakeSpasm的渲染系统提供了完整的参考。

## 使用说明

要查找特定OpenGL函数的调用位置，可以使用以下搜索模式：
- 矩阵操作: `glMatrixMode`, `glLoadIdentity`, `glOrtho`, `glFrustum`
- 状态管理: `glEnable`, `glDisable`, `glColor*`, `glBlendFunc`
- 纹理操作: `glBindTexture`, `glTexParameter*`, `glTexEnv*`
- 几何绘制: `glBegin`, `glEnd`, `glVertex*`, `glTexCoord*`
- 缓冲区操作: `glClear`, `glReadPixels`

这个文档可以帮助开发者：
1. 理解QuakeSpasm的渲染架构
2. 定位特定的OpenGL调用
3. 进行渲染优化或调试
4. 移植到其他图形API