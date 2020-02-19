import UIKit

protocol ViewControllerTableViewSectionHeaderUtilitiesProtocol {
    func header(for headerModel: ViewControllerSectionHeaderModel) -> UIView?
    func height(for headerModel: ViewControllerSectionHeaderModel) -> CGFloat
}

struct ViewControllerTableViewSectionHeaderUtilities {
    
}

extension ViewControllerTableViewSectionHeaderUtilities: ViewControllerTableViewSectionHeaderUtilitiesProtocol {
    func header(for headerModel: ViewControllerSectionHeaderModel) -> UIView? {
        switch headerModel.sectionType {
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

    func height(for headerModel: ViewControllerSectionHeaderModel) -> CGFloat {
        guard headerModel.isHidden == false else { return .leastNormalMagnitude }
        switch headerModel.sectionType {
        case .customer:
            return 30.0
        case .item:
            return 20.0
        case .address:
            return 10.0
        }
    }
}
