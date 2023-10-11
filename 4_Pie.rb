def cuts(pie_array, x, y, width, height)
  height.times do |i|
    width.times { |j| pie_array[y + i][x + j] = "notch" }
  end
  pie_array
end

def to_string(rectangle)
  rectangle.map { |i| i.join('') }.join("\n")
end

def finding(pie_array)
  pie_array.each_with_index do |row, i|
    row.each_with_index do |place, j|
      return { y: i, x: j } if place != "notch"
    end
  end
  nil
end

def validate_piece(pie_array, x, y, width, height)
  return nil if (x + width) > pie_array[0].size || (y + height) > pie_array.size

  piece = pie_array[y, height].map { |row| row[x, width] }
  string_cut = to_string(piece)

  return nil if string_cut.include?("notch") || string_cut.count("o") != 1

  string_cut
end

def selection(pie_array, pieces, size)
  position = finding(pie_array)
  return pieces if position.nil?

  piece_width = size
  while piece_width > 0
    piece_height = 0
    while piece_height < size
      piece_height += 1
      next unless piece_width * piece_height == size

      piece = validate_piece(pie_array, position[:x], position[:y], piece_width, piece_height)
      next if piece.nil?

      new_pieces = pieces.dup
      new_pieces.push(piece)

      new_pie_array = pie_array.map(&:dup)

      new_pie_array = cuts(new_pie_array, position[:x], position[:y], piece_width, piece_height)

      res = selection(new_pie_array, new_pieces, size)
      return res unless res.empty?
    end
    piece_width -= 1
  end

  []
end

def is_pie_valid?(pie)

  num_of_raisins = pie.count("o")
  return false if num_of_raisins <= 1 || num_of_raisins >= 10

  lines = pie.split("\n")
  pie_width = lines[0].size

  lines.each do |line|
    return false unless line.size == pie_width
  end

  true
end

pie = ".o.o....\n........\n....o...\n........\n.....o..\n........"
puts "pie =\n#{pie}"
raisins = pie.count("o")

unless is_pie_valid?(pie)
  puts "I only cut rectangular pies of rectangular pies with raisins no larger than 10"
  exit
end

array_pie = pie.split("\n").map(&:chars)
slice_size = (array_pie.size * array_pie[0].size) / raisins
pieces = selection(array_pie, [], slice_size)

if pieces.empty?
  puts "Unfortunately, I can't cut this pie!"
else
  puts "\nHere's what I cut up:"
  pieces.each_with_index do |piece, inx|
    puts "Piece #{inx + 1}"
    puts piece
  end
  puts "\nBon appetit!"
end
