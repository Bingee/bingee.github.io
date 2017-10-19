# Import file "follow"
fb = Framer.Importer.load("imported/follow@1x")



scroll = new ScrollComponent
	width: 750
	height: 1334
	scrollHorizontal: false


# 标题文案
# title = new TextLayer
# 	x: 309
# 	y: 60
# 	html: "更多视频"
# 	scale: 0.9
# 	x:Align.center
# 	color: "(rgba(255,255,255,0.9))"
	
# 视频
video1 = new VideoLayer
    video: "images/video1.mp4"
    width: 750
    height: 422
    y: 148
 


#  video1.player.autoplay = true
 
 video2 = new VideoLayer
    video: "images/video2.mp4"
    width: 750
    height: 422
    y: 804

# 视频1的进度条
dot = new Layer
	width: 30
	height: 30
	x: 180
	y: 516
	borderRadius: 86
	backgroundColor: "rgba(214,214,214,1)"
	opacity: 1.00
	
line = new Layer
	x: 172
	y: 530
	height: 4
	width: 10
	backgroundColor: "rgba(235,235,235,1)"
	opacity: 0.90
	
# 视频2的进度条
dot2 = new Layer
	width: 30
	height: 30
	x: 168
	y: 1173
	borderRadius: 86
	backgroundColor: "rgba(214,214,214,1)"
	opacity: 0
	
line2 = new Layer
	x: 172
	y: 1186
	height: 4
	width: 1
	backgroundColor: "rgba(235,235,235,1)"
	opacity: 0.90
	
	

fb.video1.parent = scroll.content
fb.video2.parent = scroll.content
video1.parent = scroll.content
video2.parent = scroll.content
fb.video3.parent = scroll.content
fb.playbutton.parent = scroll.content
fb.mask3.parent = scroll.content
fb.mask4.parent = scroll.content
fb.mask.parent = scroll.content
fb.mask2.parent = scroll.content
fb.slidera.parent = scroll.content
fb.sliderb.parent = scroll.content
line.parent = scroll.content
dot.parent = scroll.content
line2.parent = scroll.content
dot2.parent = scroll.content



fb.bin.placeBefore(scroll)

fb.follow.opacity = 0
fb.sliderb.opacity = 0

# 视频1的进度条动画
v1an = new Animation
	layer:dot
	properties:{x:450}
	time:20
	curve:"linear"
v1an.on Events.AnimationEnd, ->
       v1an.restart()
#    进度条线    
v1anl = new Animation
	layer:line
	properties:{width:300}
	time:20
	curve:"linear"
v1anl.on Events.AnimationEnd, ->
       v1anl.restart()
       
       
# 视频2的进度条动画
v1an2 = new Animation
	layer:dot2
	properties:{x:320}
	time:20
	curve:"linear"
v1an2.on Events.AnimationEnd, ->
       v1an2.restart()
#    进度条线    
v1anl2 = new Animation
	layer:line2
	properties:{width:150}
	time:20
	curve:"linear"
v1anl2.on Events.AnimationEnd, ->
       v1anl2.restart()


	
# 监听滚动
scroll.content.on "change:y", ->
	fb.mask.opacity = Utils.modulate(scroll.content.y,[-210,-240],[0,1])
	fb.mask2.opacity = Utils.modulate(scroll.content.y,[-210,-240],[0,1])
	fb.mask3.opacity = Utils.modulate(scroll.content.y,[-210,-240],[1,0])
	fb.mask4.opacity = Utils.modulate(scroll.content.y,[-210,-240],[1,0])
	fb.playbutton.opacity = Utils.modulate(scroll.content.y,[-210,-240],[1,0])
	fb.followuser.opacity = Utils.modulate(scroll.content.y,[-210,-240],[1,0])
	fb.follow.opacity = Utils.modulate(scroll.content.y,[-210,-240],[0,1])
	
# 	视频1进度条消失和出现
	dot.opacity = Utils.modulate(scroll.content.y,[-230,-250],[1,0])
	line.opacity = Utils.modulate(scroll.content.y,[-230,-250],[1,0])
	fb.slidera.opacity = Utils.modulate(scroll.content.y,[-230,-250],[1,0])
	
# 	视频2进度条消失和出现
	dot2.opacity = Utils.modulate(scroll.content.y,[-230,-250],[0,1])
	line2.opacity = Utils.modulate(scroll.content.y,[-230,-250],[0,1])
	fb.sliderb.opacity = Utils.modulate(scroll.content.y,[-230,-250],[0,1])
	
	if scroll.content.y < -210
		video2.player.play()
		v1an2.start()
		v1anl2.start()
		
	else 
		video2.player.pause()
	
	if scroll.content.y > -210
		video1.player.play()
		v1an.start()
		v1anl.start()
	else 
		video1.player.pause()
		
	
	
	
	
# 	print scroll.content.y
	
	
	

	
	
	