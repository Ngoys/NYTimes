import UIKit
import CoreLocation

protocol HomeCoordinatorDelegate: NSObjectProtocol {
}

class HomeCoordinator: BaseCoordinator {

    //----------------------------------------
    // MARK:- Initialization
    //----------------------------------------

    init(homeViewController: HomeViewController) {
        homeViewController.viewModel = HomeViewModel(locationManager: CLLocationManager())

        self.homeViewController = homeViewController
    }

    //----------------------------------------
    // MARK:- Delegate
    //----------------------------------------

    weak var delegate: HomeCoordinatorDelegate?

    //----------------------------------------
    // MARK:- Starting flows
    //----------------------------------------

    func start() {
        self.homeViewController.delegate = self
    }

    //----------------------------------------
    // MARK:- Internals
    //----------------------------------------

    private let homeViewController: HomeViewController
}

//----------------------------------------
// MARK:- HomeViewController delegate
//----------------------------------------

extension HomeCoordinator: HomeViewControllerDelegate {

    func homeViewControllerDidSelectSearchArticle(_ homeViewController: HomeViewController) {
        _ = showSearch(activeViewController: homeViewController)
    }

    func homeViewControllerDidSelectMostViewed(_ homeViewController: HomeViewController) {
        _ = showArticleListing(activeViewController: homeViewController, articleListingContentType: .mostViewed)
    }

    func homeViewControllerDidSelectMostShared(_ homeViewController: HomeViewController) {
        _ = showArticleListing(activeViewController: homeViewController, articleListingContentType: .mostShared)
    }

    func homeViewControllerDidSelectMostEmailed(_ homeViewController: HomeViewController) {
        _ = showArticleListing(activeViewController: homeViewController, articleListingContentType: .mostEmailed)
    }
}
