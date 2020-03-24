struct GetCustomerDataStore {
    let customerName: String?
}

extension GetCustomerDataStore: GetCustomerRepositoryInput {
    func execute() -> [String] {
        guard let customerName = customerName else { return [] }
        return [customerName]
    }
}
