func getLoanStatus (remainingAmount: Double, monthCount: Int) -> Bool {
    print(remainingAmount)
    if (remainingAmount < 100) {
        print("Done")
        return true
    }
    let payment: Double = 100
    let newRemaining = remainingAmount - payment
    let newMonth = monthCount + 1
    print("Month ",  newMonth,  ": ",  newRemaining)
    return getLoanStatus(remainingAmount: newRemaining, monthCount: newMonth)
}

let LOAN_AMOUNT: Double = 1000
let MONTH_START : Int = 0
func ex1() -> Bool {
    getLoanStatus(remainingAmount: LOAN_AMOUNT, monthCount: MONTH_START)
    print(1000)
    return true
}

ex1()
