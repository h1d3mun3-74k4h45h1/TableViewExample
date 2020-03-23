protocol GetCustomerRepositoryInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct GetCustomerRepository {
    let repositoryInput: GetCustomerRepositoryInput
}

extension GetCustomerRepository: GetCustomerUseCaseInput {
    func itemCount() -> Int {
        return repositoryInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return repositoryInput.itemData(of: index)
    }
}
