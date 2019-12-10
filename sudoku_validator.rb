class SudokuValidator

  ROW_SEPARATOR = "------+------+------\n"
  COLUMN_SEPARATOR = " | "

  def valid?(str)
    raw_grid = str.gsub(ROW_SEPARATOR, "").gsub(COLUMN_SEPARATOR, " ")
    return rows_valid?(raw_grid) && columns_valid?(raw_grid) && squares_valid?(raw_grid)
  end

  def rows_valid?(grid)
    # puts ("rows:")
    grid.split("\n").each do |row_items|
      # puts row_items
      if row_items.split.uniq.count < 9
        return false
      end
    end
    return true
  end

  def columns_valid?(grid)
    rows = grid.split("\n")
    # puts ("columns:")
    for i in 0..8 do
      column_items = []
      rows.each do |row|
        column_items.push(row.split[i])
      end
      # puts column_items.join
      if column_items.uniq.count < 9
        return false
      end
    end
    return true
  end

  def squares_valid?(grid)
    row = 0
    col = 0
    # puts ("squares:")
    while row < 7 do
      while col < 7 do
        if !square_valid?(grid, row, row + 3, col, col + 3)
          return false
        end
        col += 3
      end
      col = 0
      row += 3
    end
    return true
  end

  def square_valid?(grid, row_low, row_high, col_low, col_high)
    square_items = []
    grid.split("\n").each_with_index do |row, j|
      row.split.each_with_index do |col, k|
        if j >= row_low and j < row_high && k >= col_low and k < col_high
          square_items.push(col)
        end
      end
    end
    # puts square_items.join
    if square_items.uniq.count < 9
      return false
    end

    return true
  end

end
