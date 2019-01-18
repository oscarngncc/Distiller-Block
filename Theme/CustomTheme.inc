;;;;This file allows user to customize you own theme
;;;;Using their own background, different colors and so ow
;;;;Follow the Instruction below to see what properties you can change
;;;;Once you have made the changes, you can click "Custom" Button in Setting to apply such change


;;;;If you are interested to use your own custom application icon,
;;;;you can replace the icons under @Resource\Icon folder
;;;;In the Format of 32 x 32 pixels .png
;;;;Also make sure to follow the same name of the original icon picture


[Variables]

;Defines the background image of the bottom part of the skin ( displaying information )
;You should put your custom picture under the @Resources\Image Folder
;Then change the following variable with your new picture name ( e.g. ImgBackground=SomeNewImageName.png )
;Make sure your image has a resolution of 60 x 48 pixels (WxH)

ImgBackground=Background_Rainmeter.png



;Defines the background image of the upper part of the skin ( for displaying various processes ) 
;You should put your custom picture under the @Resources\Image Folder
;Then change the following variable with your new picture name ( e.g. ProcImgBackground=SomeNewImageName.png )
;Make sure your image has a resolution of 60 x 15 pixels (WxH)

ProcImgBackground=Process_Rainmeter.png




;Defines the color of the text on the top side
;Follows Setting of RGBA

textcolor=235,235,235,255



;Defines the color of the text on the bottom part
;Follows Setting of RGBA

textcolor2=235,235,235,255



;Defines the style of the font for all the texts
;You may put your 3rd Party fonts inside the @Resources\Fonts Folder
;Alternatively, you can use fonts that are built-in inside Windows, refer to Microsoft for more detail
;Do Be aware that this Rainmeter skin is not optimized for other fonts, so using Some fonts may result in altered UI-structure

textfont=Arial



;Color-Matrix for the all the application icons, allows you to put some filtering/color changes to them
;Refer to https://docs.rainmeter.net/tips/colormatrix-guide/ for more details
;Be aware that due to technical issue, This skin should only support ColorMatrix R,G,B (1,2,3) 
;Any changes to forth coloum or adding a forth row to deal with Opacity will result in display error
R_Matrix=1; 0; 0; 0; 0
G_Matrix=0; 1; 0; 0; 0
B_Matrix=0; 0; 1; 0; 0







;Testing
W_Matrix=0; 0; 0; 0; 1


