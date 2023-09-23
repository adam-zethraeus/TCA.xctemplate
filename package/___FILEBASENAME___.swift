import ComposableArchitecture

package struct ___VARIABLE_MODULENAME___: Reducer {
    package struct State: Equatable {
        package init(){}
    }

    package enum Action: Equatable {
        case activate
    }

    package init(){}

    package var body: some Reducer<State, Action> {
        Reduce { state, action in
            return .none
        }
    }
}