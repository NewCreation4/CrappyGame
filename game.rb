P="\e[34m\e[1m&\e[0m"
T="\e[90m#\e[0m"
W="\e[94m\e[2m!\e[0m"
G="\e[32m$\e[0m"

map=[
  [W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W],
  [W,P,W,T,T,T,W,T,W,T,W,T,T,T,T,T,T,T,W],
  [W,T,T,T,W,T,T,T,T,T,T,T,T,W,W,W,W,T,W],
  [W,T,W,T,T,T,T,T,W,W,W,W,W,W,T,T,T,T,W],
  [W,W,W,W,W,W,W,W,W,W,T,T,W,T,T,T,W,W,W],
  [W,G,T,T,T,T,T,T,T,T,T,T,T,T,W,T,T,T,W],
  [W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W,W]
]
mapMessages={
  "onWinMessage"=>"u win",
}

px=1
py=1

define_singleton_method("showmap") {
  map.each do |line|
    line.each do |tile|
      print "#{tile} "
    end
    print "\n"
  end
}
define_singleton_method("win") {
  puts mapMessages["onWinMessage"]
  exit
}
showmap

puts """
v is down
^ is up
> is frontwards
< is backwards
"""

while true
  print "Move: "
  move=gets.chomp
  system("clear")
  
  case move
  when ">"
    if map[py][px+1]==T 
      map[py][px]=T
      map[py][px+1]=P
      px+=1
    elsif map[py][px+1]==G
      win
    end
  when "<"
    if map[py][px-1]==T 
      map[py][px]=T
      map[py][px-1]=P
      px-=1
    elsif map[py][px-1]==G
      win
    end
  when "^"
    if map[py-1][px]==T 
      map[py][px]=T
      map[py-1][px]=P
      py-=1
    elsif map[py-1][px]==G
      win
    end
  when "v"
    if map[py+1][px]==T 
      map[py][px]=T
      map[py+1][px]=P
      py+=1
    elsif map[py+1][px]==G
      win
    end
  end
  showmap
end
