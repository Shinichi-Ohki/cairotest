require 'cairo'

format = Cairo::FORMAT_ARGB32
width = 300
height = 200
merginV = 5
merginH = 5

if ARGV[0]==nil then
	ExitStatus = 0
	puts("Please set output filename.")
	exit(0)
end

SVGfilename = ARGV[0]+".svg"
PNGfilename = ARGV[0]+".png"

puts(PNGfilename)

#surface = Cairo::SVGSurface.new(SVGfilename,width,height)
surface = Cairo::ImageSurface.new(format,width,height)
context = Cairo::Context.new(surface)

# 背景
context.fill do
	context.set_source_rgb(1, 1, 1) # 白
	context.rectangle(0, 0, width, height)
end

# 角丸四角
context.fill do
	context.set_source_rgb(0, 0, 0) # 黒
	context.rounded_rectangle(10, 10, width-20, height-20,10)
	context.stroke
end

# 文字
context.set_source_rgb(0, 0, 0) # 黒
context.select_font_face("Helvetica",nil,"bold")
context.set_font_size(20)
context.move_to(20,100)
str = "test"
context.set_line_width(3.0)
context.show_text(str)
context.fill do
	context.set_source_rgb(0, 0, 0) # 黒
	width = context.text_extents(str).width
	height = context.text_extents(str).height
	context.rounded_rectangle(20-merginH, 100-height-merginV, width+merginH*2, height+merginV*2,5)
	context.set_line_width(4.0)
	context.stroke
end

#context.target.finish
context.target.write_to_png(PNGfilename)
