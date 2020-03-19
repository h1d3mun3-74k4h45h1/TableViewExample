enum TableViewSectionType: Int {
    case customer = 0
    case item
    case address

    func cellIdentifier() -> String {
        switch self {
        case .customer:
            return "CustomerCell"
        case .item:
            return "ItemCell"
        case .address:
            return "AddressCell"
        }
    }
}
