func ex1() -> Bool {
  let loanAmount: Double = 1000.0
  var remaining: Double = loanAmount
  var month: Int = 0

  while(remaining > 0) {
    // add interest
    var interestRate: Double = (remaining > 500.0) ? 1.02 : 1.01
    remaining *= interestRate
    // make the payment
    var payment: Double = (remaining < 100) ? remaining : 100.0
    remaining -= payment
    // output
    print("Month \(month): Paid \(payment), \(remaining) remaining")
    // prep for next loop
    month = month + 1
  }
  return true
}

func getRunningStatus(weather: Int, schedule: Int, likeRunning: Int) -> String {
  let goingText = "Going for a Run"
  let notGoingText = "Not going for a Run"
  // find all the reasons not to run
  let notEnoughInterest = likeRunning < 4
  let tooBusy = schedule > 2
  let badWeather = weather<=45 || weather>=90
  //return the text
  if (notEnoughInterest || tooBusy || badWeather) {
    return notGoingText
  }
  return goingText
}

func ex2() -> Bool {
  let Weather = 70
  let Schedule = 0
  let LikeRunning = 6
  let runningStatus = getRunningStatus(
    weather: Weather,
    schedule: Schedule,
    likeRunning: LikeRunning
  )
  print(runningStatus)
  return true
}

func ex3() -> Bool {
  let runnerSpeeds: [String: Int] = [
    "Elena": 341, "Thomas": 273, "Hamilton": 278, "Suzie": 329, 
    "Phil": 445, "Matt": 402, "Alex": 388, "Emma": 275, 
    "John": 243, "James": 334, "Jane": 412, "Emily": 393,
    "Daniel": 299, "Neda": 343, "Aaron": 317, "Kate": 265
  ]
  var fastestSpeed = Int.max
  var fastestRunner = ""
  for (runner, speed) in runnerSpeeds {
    if (speed < fastestSpeed) {
      fastestSpeed = speed
      fastestRunner = runner
    }
  }
  print("Fastest runner is \(fastestRunner) with a time of \(fastestSpeed).")
  return true
}

print()
print("Exercise 1:")
//ex1()

print()
print("Execise 2:")
ex2()

print()
print("Execise 3:")
ex3()
