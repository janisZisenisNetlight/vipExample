import UIKit

class OverviewSceneFactory {
    static func makeScene(router: OverviewRouting, account: Account) -> UIViewController {
        let viewController = OverviewViewController()
        let presenter = OverviewPresenter(display: viewController)
        let interactor = OverviewInteractor(presenter: presenter, account: account, router: router)
        viewController.interactor = interactor
    
        return viewController
    }
}
