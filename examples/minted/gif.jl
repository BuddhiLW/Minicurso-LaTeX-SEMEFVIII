using Plots
x = 0:pi/100:8π
anim =  @animate for v in 0:pi/20:2pi
    plot(x, sin.(x .+ v), legend=false)
end
 
gif(anim, "myanim.gif", fps = 15)

using Plots
loadpath = "/tmp/"
anim = Animation(loadpath,String[])
p = plot([sin,cos], 0, pi, size=(300,300))
scatter!([0], [sin,cos])
for i in 0:0.1:pi
    p[3] = [i], [sin(i)]
    p[4] = [i], [cos(i)]    
    frame(anim)
end
run( `ffmpeg -r 15 -i $loadpath"%06d.png" -vcodec libx264 -crf 25 "~/file.mp4"` )
