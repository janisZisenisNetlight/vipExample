import Foundation

protocol OverviewPresenting {
    func presentViewDidLoad(_ response: OverviewModel.ViewDidLoad.Response)
    func presentWithDraw(_ response: OverviewModel.WithDraw.Response)
    func presentDeposit(_ response: OverviewModel.Deposit.Response)
}

protocol OverviewRouting {
    func showHistory()
}

class OverviewInteractor: OverviewInteracting {
    private let presenter: OverviewPresenting
    private let account: Account
    private let router: OverviewRouting

    init(presenter: OverviewPresenting, account: Account, router: OverviewRouting) {
        self.presenter = presenter
        self.account = account
        self.router = router

    }

    func handleViewDidLoad(_ request: OverviewModel.ViewDidLoad.Request) {
        let owner = account.owner
        let balance = account.balance

        let response = OverviewModel.ViewDidLoad.Response(owner: owner, balance: balance)
        presenter.presentViewDidLoad(response)
    }
    
    func handleWithDraw(_ request: OverviewModel.WithDraw.Request) {
        guard let amount = request.amount.asDouble() else {
            return
        }

        account.withDraw(amount: amount)

        let response = OverviewModel.WithDraw.Response(balance: account.balance)
        presenter.presentWithDraw(response)
    }
    
    func handleDeposit(_ request: OverviewModel.Deposit.Request) {
        guard let amount = request.amount.asDouble() else {
            return
        }
    
        account.deposit(amount: amount)
        
        let response = OverviewModel.Deposit.Response(balance: account.balance)
        presenter.presentDeposit(response)
    }

    func handleShowHistory(_ request: OverviewModel.ShowHistory.Request) {
        router.showHistory()
    }
}

private extension String {
    func asDouble() -> Double? {
        guard let double = (self as NSString?)?.doubleValue else {
            return nil
        }
        
        return double > 0 ? double: nil
    }
}
