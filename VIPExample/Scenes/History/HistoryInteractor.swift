import Foundation

protocol HistoryPresenting {
    func presentViewDidLoad(_ response: HistoryModel.ViewDidLoad.Response)
}

class HistoryInteractor: HistoryInteracting {
    private let presenter: HistoryPresenting
    private let account: Account

    init(presenter: HistoryPresenting, account: Account) {
        self.presenter = presenter
        self.account = account
    }
    
    func handleViewDidLoad(_ request: HistoryModel.ViewDidLoad.Request) {
        let response = HistoryModel.ViewDidLoad.Response(transactions: account.allTransactions)
        presenter.presentViewDidLoad(response)
    }
}
