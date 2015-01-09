#!/bin/ruby
load 'princess_finder.rb'

class String
  def isInteger?
    self.to_i.to_s == self
  end
end

File.open("problem1TestCases.txt", "r") do |f|
  storeGrid = true
  currentGrid = []
  correctMoves = []
  testCaseNum = 1
  m = -1

  f.each_line do |line|
    line = line.strip

    # READ IN GRID
    # =====================================
    if storeGrid
      if line.isInteger?
        m = line.to_i
      elsif line.length != 0
        currentGrid.push(line)
      else
        storeGrid = false
      end
    else
      if line.length != 0
        correctMoves.push(line)
    # ======================================

    # READ IN AND CHECK CORRECT MOVES
    # ======================================
      else
        stepList = displayPathToPrincess(m, currentGrid)
        if stepList == correctMoves
          puts("Passed Test Case #{testCaseNum}")
        else
          puts("Failed Test Case #{testCaseNum}")
        end
    # ======================================

    # Reset the parameters for the next test case
        m = -1
        currentGrid = []
        storeGrid = true
        correctMoves = []
        testCaseNum += 1
      end
    end
  end
end