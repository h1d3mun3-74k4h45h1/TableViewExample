protocol ViewControllerCustomerRepositoryInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct ViewControllerCustomerRepository {
    let repositoryInput: ViewControllerCustomerRepositoryInput
}

extension ViewControllerCustomerRepository: ViewControllerCustomerUseCaseInput {
    func itemCount() -> Int {
        return repositoryInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return repositoryInput.itemData(of: index)
    }
}
