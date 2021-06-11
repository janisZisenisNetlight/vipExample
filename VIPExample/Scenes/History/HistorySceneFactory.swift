import UIKit

class HistorySceneFactory {
    static func makeScene(account: Account) -> UIViewController {
        let viewController = HistoryViewController()
        let presenter = HistoryPresenter(display: viewController)
        let interactor = HistoryInteractor(presenter: presenter, account: account)
        viewController.interactor = interactor
        
        return viewController
    }
}
