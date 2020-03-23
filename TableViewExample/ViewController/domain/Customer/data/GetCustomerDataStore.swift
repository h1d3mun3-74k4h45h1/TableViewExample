struct GetCustomerDataStore {
    let customerName: String?
}

extension GetCustomerDataStore: GetCustomerRepositoryInput {
    func itemCount() -> Int {
        return 1
    }

    func itemData(of index: Int) -> String? {
        return customerName
    }
}
