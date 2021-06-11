import UIKit

class AccountCoordinator {
    private weak var navigationController: UINavigationController?
    
    private let account: Account
    
    init(navigationController: UINavigationController, account: Account) {
        self.navigationController = navigationController
        self.account = account
    }
    
    func start() {
        let viewController = OverviewSceneFactory.makeScene(router: self, account: account)
        navigationController?.viewControllers = [viewController]
    }
}

extension AccountCoordinator: OverviewRouting {
    func showHistory() {
        let viewController = HistorySceneFactory.makeScene(account: account)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
