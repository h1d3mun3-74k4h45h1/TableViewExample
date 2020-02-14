import UIKit

protocol ViewControllerWireframeProtocol {
    func showCustomerDetail(name: String)
    func showItemDetail(itemName: String)
    func showAddressDetail(address: String)
}

final class ViewControllerWireframe {
    weak var view: UIViewController?

    init(view: UIViewController) {
        self.view = view
    }
}

extension ViewControllerWireframe: ViewControllerWireframeProtocol {
    func showCustomerDetail(name: String) {
        let alert = UIAlertController(
            title: "Customer Detail",
            message: "Your name is \(name)",
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            )
        )
        view?.present(alert, animated: true, completion: nil)
    }

    func showItemDetail(itemName: String) {
        let alert = UIAlertController(
            title: "Item Detail",
            message: "This Item Name is \(itemName)",
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            )
        )
        view?.present(alert, animated: true, completion: nil)
    }

    func showAddressDetail(address: String) {
        let alert = UIAlertController(
            title: "Address Detail",
            message: "Your Order Will be ship to \(address)",
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            )
        )
        view?.present(alert, animated: true, completion: nil)
    }
}
