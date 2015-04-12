require 'cairo'

format = Cairo::FORMAT_ARGB32
width = 300
height = 200

surface = Cairo::ImageSurface.new(format,width,height)
context = Cairo::Context.new(surface)

# 背景
context.fill do
	context.set_source_rgb(1, 1, 1) # 白
	context.rectangle(0, 0, width, height)
end

context.fill do
	context.set_source_rgb(0, 0, 0) # 黒
	context.rounded_rectangle(10, 10, width-20, height-20,10)
	context.stroke
end

context.target.write_to_png("cairotest.png")