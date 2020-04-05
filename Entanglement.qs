namespace Quantum.Entanglement
{
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    
    // Define the Entanglement operation that returns the mesurement of the state of the two qubits
    operation Entanglement () : (Result, Result) {      // The two return types are of Result

        // We initialize two variables to hold the value of the resultant state of the qubits after measurement
        mutable qone_state = Zero;
        mutable qtwo_state = Zero;

        // We initialize the two qubits within the using block. This helps in Garbage Collection
        using ((qubitOne, qubitTwo) = (Qubit(), Qubit())) {
            // Perform operation to convert the first qubit to a superposition state.
            // Note: We do not need to bring both the qubits to a superposition state
            H(qubitOne);
            // We perform the operation to Entangle the qubits
            CNOT(qubitOne, qubitTwo);
            // The sequnce of H() and CNOT() helps in entangling two qubits

            // Finally we measure the state of the qubits with the M() and store them in the variable
            set qone_state = M(qubitOne);
            set qtwo_state = M(qubitTwo);

            // We also reset the two initialized qubit. Microsoft requires it.
            Reset(qubitOne);
            Reset(qubitTwo);
		}
        // Finally we return the results of the measurement.
        return (qone_state, qtwo_state);
    }
}namespace Quantum.Entanglement {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    
    operation HelloQ () : Unit {
        Message("Hello quantum world!");
    }
}
