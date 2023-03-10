class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      (0..3).each { cup << :stone } unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    curr_idx = start_pos
    until stones.empty?
      curr_idx += 1
      curr_idx = 0 if curr_idx > 13

      if curr_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif curr_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[curr_idx] << stones.pop
      end
    end
    render
    next_turn(curr_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? { |cup| cup.empty? } || @cups[7..13].all? { |cup| cup.empty? }
    false
  end

  def winner
    count_for_p1 = @cups[6].count
    count_for_p2 = @cups[13].count

    count_for_p1 == count_for_p2 ? :draw : count_for_p1 > count_for_p2 ? @name1 : @name2
  end
end
