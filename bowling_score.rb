class BowlingScore
  attr_reader :frames

  def initialize(str_of_input)
    @frames = []
    rows = str_of_input.split.map(&:to_i)
    while rows.count > 0 || @frames.count < 10
      if @frames.count == 9
        @frames << [ rows.shift.to_i, rows.shift.to_i, rows.shift.to_i ]
      elsif rows[0].to_i < 10
        @frames << [ rows.shift.to_i, rows.shift.to_i ]
      else
        @frames << [ rows.shift.to_i ]
      end
    end
  end

  def frame(num)
    frames[num]
  end

  def score
    rows = frames.flatten
    ret = rows.inject(:+)
    frames.each_with_index do |frame, i|
      i1 = i + 1
      i2 = i + 2
      ret += frames[i1][0] if frame.count == 2 && frame.inject(:+) == 10 #spare
      if frame.count == 1 && frame.inject(:+) == 10 && i != 9 # stirke
        ret += frames[i1].count >= 2 ? frames[i1][0] + frames[i1][1] : frames[i1][0] + frames[i2][0]
      end
    end
    ret
  end

end