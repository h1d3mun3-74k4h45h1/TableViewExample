protocol GetItemUseCaseInput {
    func execute() -> [String]
}

struct GetItemUseCase {
    let useCaseInput: GetItemUseCaseInput
}

extension GetItemUseCase: GetUseCaseProtocol {
    func execute() -> [String] {
        return useCaseInput.execute()
    }
}
