
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
  return nil
end

def makeSteps(direction, numberOfSteps)
  stepList = []
  (0...numberOfSteps).each do
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

# method is included for scoring although not part of requested output
def moveToPrincess(n,r,c,grid)
  botLocation = [r, c]
  princessLocation = findPrincess(grid)
  if princessLocation == nil
    puts('No princess here')
    return nil
  end
  stepList = []

  horizontalSteps = princessLocation[1] - botLocation[1]
  if horizontalSteps < 0
    stepList.push(makeSteps('LEFT', horizontalSteps.abs))
  else
    stepList.push(makeSteps('RIGHT', horizontalSteps))
  end

  verticalSteps = princessLocation[0] - botLocation[0]
  if verticalSteps < 0
    stepList.push(makeSteps('UP', verticalSteps.abs))
  else
    stepList.push(makeSteps('DOWN', verticalSteps))
  end

  return formatStepList(stepList)
end

def nextMove(n,r,c,grid)
  botLocation = [r,c]
  princessLocation = findPrincess(grid)
  if princessLocation == nil
    puts('-1. This princess is a figment of your imagination. She does not exist. Stop looking.')
    return '-1'
  end
  # find how many steps the bot must take horizontally and in which direction
  horizontalSteps = princessLocation[1] - botLocation[1]
  if horizontalSteps < 0
    puts('LEFT')
    return 'LEFT'
  elsif horizontalSteps > 0
    puts('RIGHT')
    return 'RIGHT'
  else
    # No horizontal steps are needed so look vertically
    verticalSteps = princessLocation[0] - botLocation[0]
    if verticalSteps < 0
      puts('UP')
      return 'UP'
    elsif verticalSteps > 0
      puts('DOWN')
      return 'DOWN'
    end
  end

end

# Set testing to true to run as hackerrank originally set up the problem
if TESTING == FALSE
  n = gets.to_i

  r,c = gets.strip.split.map {|num| num.to_i}

  grid = Array.new(n)

  (0...n).each do |i|
    grid[i] = gets
  end

  returnVal = nextMove(n,r,c,grid)
  stepsList = []
  if returnVal != -1
    stepsList = moveToPrincess(n,r,c,grid)
  end
end

