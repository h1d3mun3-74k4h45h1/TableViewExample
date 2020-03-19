import UIKit

protocol ViewControllerTableViewSectionFooterUtilitiesProtocol {
    func footer(for footerModel: SectionFooterModel) -> UIView?
    func height(for footerModel: SectionFooterModel) -> CGFloat
}

struct ViewControllerTableViewSectionFooterUtilities {

}

extension ViewControllerTableViewSectionFooterUtilities: ViewControllerTableViewSectionFooterUtilitiesProtocol {
    func footer(for footerModel: SectionFooterModel) -> UIView? {
        switch footerModel.sectionType {
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

    func height(for footerModel: SectionFooterModel) -> CGFloat {
        guard footerModel.isHidden == false else { return .leastNormalMagnitude }
        switch footerModel.sectionType {
        case .customer:
            return 10.0
        case .item:
            return 20.0
        case .address:
            return 30.0
        }
    }
}
