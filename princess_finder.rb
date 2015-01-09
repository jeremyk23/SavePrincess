#!/bin/ruby
TESTING = TRUE

def findPrincess(grid)
  rowNumber = 0
  for row in grid
    if row.include? 'p'
      return [rowNumber, row.index('p')]
    end
    rowNumber += 1
  end
end

def printSteps(direction, numberOfSteps)
  stepList = []
  (0...numberOfSteps).each do
    puts(direction)
    stepList.push(direction)
  end
  return stepList
end

# flatten 2d array into one array of sequential moves
def formatStepList(stepList)
  formattedList = []
  for direction in stepList
    for step in direction
      formattedList.push(step)
    end
  end
  return formattedList
end

def displayPathToPrincess(n,grid)
  gridCenter = (n-1)/2
  botLocation = [gridCenter, gridCenter]
  princessLocation = findPrincess(grid)
  stepList = []

  # determine number of vertical steps the bot must take and in which direction
  verticalSteps = princessLocation[0] - botLocation[0]
  if verticalSteps < 0
    stepList.push(printSteps('UP', verticalSteps.abs))
  else
    stepList.push(printSteps('DOWN', verticalSteps))
  end

  # determine number of horizontal steps the bot must take and in which direction
  horizontalSteps = princessLocation[1] - botLocation[1]
  if horizontalSteps < 0
    stepList.push(printSteps('LEFT', horizontalSteps.abs))
  else
    stepList.push(printSteps('RIGHT', horizontalSteps))
  end
  return formatStepList(stepList)
end

# Set testing to true to run as hackerrank originally set up the problem
if TESTING == FALSE
  m = gets.to_i

  grid = Array.new(m)

  (0...m).each do |i|
    grid[i] = gets.strip
  end
  displayPathToPrincess(m,grid)
end

