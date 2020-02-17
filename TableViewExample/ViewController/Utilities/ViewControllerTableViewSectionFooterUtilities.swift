import UIKit

protocol ViewControllerTableViewSectionFooterUtilitiesProtocol {
    func footer(for sectionType: ViewControllerTableViewSectionType) -> UIView?
    func height(for sectionType: ViewControllerTableViewSectionType, hasContent: Bool) -> CGFloat
}

struct ViewControllerTableViewSectionFooterUtilities {

}

extension ViewControllerTableViewSectionFooterUtilities: ViewControllerTableViewSectionFooterUtilitiesProtocol {
    func footer(for sectionType: ViewControllerTableViewSectionType) -> UIView? {
        switch sectionType {
        case .customer:
            let view = UIView()
            view.backgroundColor = .lightGray
            return view
        case .item:
            let view = UIView()
            view.backgroundColor = .systemPink
            return view
        case .address:
            let view = UIView()
            view.backgroundColor = .systemTeal
            return view
        }
    }

    func height(for sectionType: ViewControllerTableViewSectionType, hasContent: Bool) -> CGFloat {
        guard hasContent == true else { return .leastNormalMagnitude }
        switch sectionType {
        case .customer:
            return 10.0
        case .item:
            return 20.0
        case .address:
            return 30.0
        }
    }
}
