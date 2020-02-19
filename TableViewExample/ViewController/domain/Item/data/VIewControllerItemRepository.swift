protocol ViewControllerItemRepositoryInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct ViewControllerItemRepository {
    let repositoryInput: ViewControllerItemRepositoryInput
}

extension ViewControllerItemRepository: ViewControllerItemUseCaseInput {
    func itemCount() -> Int {
        return repositoryInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return repositoryInput.itemData(of: index)
    }
}
