class Builder
  DEFAULT_POSITIONS = ['PG', 'SG','SF', 'PF','C']
  POS_GROUPS = {'PG'=>[0, 5, 7]} "0...00" -> "0....."

  def build_fixtures
    fixtures = []

    50.times do |index|
      fixtures << build_fixture(index)
    end

    fixtures
  end

  def build_fixture(player_index)
    random_salary = Random.rand(30..100)*100
    random_exp_points = Random.rand(4.0..6.0)*random_salary/1000
    random_position = DEFAULT_POSITIONS.sample

    ["player_#{player_index}", random_salary, random_exp_points, random_position]
  end
  [a, b, c, d, e, f.... ]
  (111111, 50000, 0) -> [[]]
  (1101111, 35000, 15) -> [[15, 17, 35], [15, ....], ...]
  (01001111, 27000, 16) -> [[17, 35, .. ], .......]
  (111111, 50000, 1)
  (101111, 40000, 1)

  #positions_needed "1010111"
  #salary remaining 31000
  #players_ind 13
  #output
  #

  def get_position_ind(pos, pos_needed)
    POS_GROUPS[pos].each do |posind|
      if pos_needed[posind] == "1"
        return posind
      end
    end
    return nil
  end

  def sl_helper(fixture_list, positions_needed, sal_rem, player_ind, num_players_needed)
    cur_player = fixture_list[player_ind]
    name, salary, fp, pos = cur_player

    #BASE CASE
    if num_players_needed == 0
      if sal_rem <= 100

      end

    end

    #CASE 1:  we do not include cur_player
    output = sl_helper(fixture_list, positions_needed, sal_rem, player_ind+1, num_players_needed)

    #CASE 2:  we incude cur_player
    pos_ind = get_position_ind(pos, positions_needed)
    unless pos_ind.nil?
      new_pos_needed = positions_needed.dup
      new_pos_needed[pos_ind] = "0"
      tail_lineups = sl_helper(fixture_list, new_pos_needed, sal_rem-salary, player_ind+1, num_players_needed-1)
    end

    unless tail_lineups.nil? do
      tail_lineups.each do |tl|
        tl_dup = tl.dup
        tl_dup << player_ind
        output << tl_dup
      end
    end



    memo[[positions_needed, sal_rem, player_ind]] = output

    return output
  end

  def solve_lineups(fixture_list)
    raw_lineups = sl_helper(fixture_list, "11111111", 50000, 0, 8)
  end
end
