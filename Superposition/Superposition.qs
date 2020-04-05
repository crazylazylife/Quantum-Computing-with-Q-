namespace Quantum.Superposition
{
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    
    // Define the superposition function
    operation Superposition () : Result {

        // Initialize a variable to store the valeu of the resultant state
        mutable state = Zero;
        // Initialize a qubit
        using (qubit = Qubit()){
            // Performing Hadamard operation to change the qubit to a superposition state
            H(qubit);
            // We measure the state of the qubit using M() and store it in the variable
            set state = M(qubit);
            
            // We reset the qubit as Microsoft requires us to do so
            Reset(qubit);
		}
        // Finally we return the value
        return state;
    }
}
