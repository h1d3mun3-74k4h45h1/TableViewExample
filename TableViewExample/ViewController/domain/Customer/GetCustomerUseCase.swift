protocol GetCustomerUseCaseInput {
    func execute() -> [String]
}

struct GetCustomerUseCase {
    let useCaseInput: GetCustomerUseCaseInput
}

extension GetCustomerUseCase: GetUseCaseProtocol {
    func execute() -> [String] {
        return useCaseInput.execute()
    }
}
