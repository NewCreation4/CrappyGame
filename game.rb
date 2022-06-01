wall="!"
win="$"
tile="#"
player="&"

map = [wall,player,tile,tile,tile,tile,win,wall]
mlen=map.length()
px=1
puts "Welcome to some random game."
puts "
Actions:
>   Move Forward
<   Move Backwards
"

while true
  puts map[0]+map[1]+map[2]+map[3]+map[4]+map[5]+map[6]+map[7]
  a=gets.chomp()
  if a==">"
    for i in 0..7
      if map[i+1]=="#"
        if px==i
          map[i+1]="&"
          map[i]="#"
          px=px+1
          break
        end
      elsif map[i+1]=="$"
        if px==i
          puts "You Won!"
          exit()
          break
        end
      end
    end
  elsif a=="<"
    for i in 0..7
      if map[i-1]=="#"
        if px==i
          map[i-1]="&"
          map[i]="#"
          px=px-1
          break
        end
      elsif map[i-1]=="$"
        if px==i
          puts "You Won!"
          exit()
          break
        end
      end
    end
  end
end
