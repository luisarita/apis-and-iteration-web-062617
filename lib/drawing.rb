def screen_size
  20
end

def star_wars_logo
 puts "\r\n
     ________________.  ___     .______
    /                | /   \\    |   _  \\
   |   (-----|  |----`/  ^  \\   |  |_)  |
     \\   \\   |  |    /  /_\\  \\  |      /
.-----)   |  |  |   /  _____  \\ |  |\\  \\-------.
|________/   |__|  /__/     \\__\\| _| `.________|
____    __    ____  ___     .______    ________.
\\   \\  /  \\  /   / /   \\    |   _  \\  /        |
 \\   \\/    \\/   / /  ^  \\   |  |_)  ||   (-----`
  \\            / /  /_\\  \\  |      /  \\   \\
   \\    /\\    / /  _____  \\ |  |\\  \\---)   |
    \\__/  \\__/ /__/     \\__\\|__| `._______/
    \r\n\r\n\r\n"
end

def screen_draw(lines)
  (1..screen_size).each do
    lines.unshift("")
  end
  (1..screen_size).each do
    lines.push("")
  end
  screen_redraw(lines)
end

def screen_redraw(lines)
  system('clear')
  star_wars_logo
  (1..screen_size).each do |line|
    puts lines[line]
  end
  sleep(1)
  lines.shift
  if lines.size > screen_size
    screen_redraw(lines)
  else
    system('clear')
  end
end
