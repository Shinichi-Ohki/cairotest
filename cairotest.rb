require 'cairo'

format = Cairo::FORMAT_ARGB32
width = 300
height = 200

if ARGV[0]==nil then
	ExitStatus = 0
	puts("Please set output filename.")
	exit(0)
end

SVGfilename = ARGV[0]+".svg"

puts(SVGfilename)

surface = Cairo::SVGSurface.new(SVGfilename,width,height)
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

context.target.finish
#context.target.write_to_png("cairotest.png")
