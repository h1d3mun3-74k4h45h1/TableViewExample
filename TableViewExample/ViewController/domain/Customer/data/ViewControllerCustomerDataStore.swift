struct ViewControllerCustomerDataStore {
    let customerName: String?
}

extension ViewControllerCustomerDataStore: ViewControllerCustomerRepositoryInput {
    func itemCount() -> Int {
        return 1
    }

    func itemData(of index: Int) -> String? {
        return customerName
    }
}
