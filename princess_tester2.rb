#!/bin/ruby
load 'princess_finder2.rb'

class String
  def isInteger?
    self.to_i.to_s == self
  end
end

File.open("problem2TestCases.txt", "r") do |f|
  storeGrid = true
  currentGrid = []
  correctMoves = []
  testCaseNum = 1
  n = -1
  r = -1
  c = -1

  f.each_line do |line|
    line = line.strip
    # READ IN GRID
    # =====================================
    if storeGrid
      if line.match(" ")
        nAndC = line.split(' ')
        r = nAndC.first.to_i
        c = nAndC.last.to_i
      elsif line.isInteger?
        n = line.to_i
      elsif line.length != 0
        currentGrid.push(line)
      else
        storeGrid = false
      end
    # ======================================

    # READ IN AND CHECK CORRECT MOVES
    # ======================================
    else
      if line.length != 0
        correctMoves.push(line)
      else
        directionMoved = nextMove(n,r,c,currentGrid)
        if correctMoves.include? directionMoved
          puts("Passed Test Case #{testCaseNum}")
        else
          puts("Failed Test Case #{testCaseNum}")
        end
    # ======================================

    # Reset the parameters for the next test case
        n = -1
        r = -1
        c = -1
        currentGrid = []
        storeGrid = true
        correctMoves = []
        testCaseNum += 1
      end
    end
  end
end