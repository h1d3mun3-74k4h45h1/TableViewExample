import UIKit

protocol ViewControllerTableViewSectionHeaderUtilitiesProtocol {
    func header(for sectionType: ViewControllerTableViewSectionType) -> UIView?
    func height(for sectionType: ViewControllerTableViewSectionType, hasContent: Bool) -> CGFloat
}

struct ViewControllerTableViewSectionHeaderUtilities {
    
}

extension ViewControllerTableViewSectionHeaderUtilities: ViewControllerTableViewSectionHeaderUtilitiesProtocol {
    func header(for sectionType: ViewControllerTableViewSectionType) -> UIView? {
        switch sectionType {
        case .customer:
            let view = UIView()
            view.backgroundColor = .blue
            return view
        case .item:
            let view = UIView()
            view.backgroundColor = .red
            return view
        case .address:
            let view = UIView()
            view.backgroundColor = .purple
            return view
        }
    }

    func height(for sectionType: ViewControllerTableViewSectionType, hasContent: Bool) -> CGFloat {
        guard hasContent == true else { return .leastNormalMagnitude }
        switch sectionType {
        case .customer:
            return 30.0
        case .item:
            return 20.0
        case .address:
            return 10.0
        }
    }
}
