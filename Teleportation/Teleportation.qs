namespace Quantum.Teleportation
{
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    
    // Defining the Teleportation operation to perform the required step. It will input a boolean message and output a boolean
    operation Teleportation (sentMessage : Bool) : Bool {

        //Initialixe a variable to return the received message
        mutable receivedMessage = false;        
        // Here we initialize 3 qubits, one for Alice, one for Bob and one for the message to be sent
        using (qubits = Qubit[3]) {
            // We denote the first qubit as message
            let message = qubits[0];

            // Flip the message qubit if the sentMessage holds True value as all the qubits are initilized to 0 in the beginning
            if (sentMessage) {
                X(message);     
			}

            // We then assign Alice and Bob to their respective qubits
            let alice = qubits[1];
            let bob = qubits[2];

            // We perform entanglement between the qubits of ALice and Bob. Here they are in close proximity
            H(alice);
            CNOT(alice, bob);
            
            // Now, ALice and Bob are lightyears away and Alice wants to send a message to Bob. We now transfer the state of the message qubit to Alice using CNOT() on Alice and the message
            CNOT(message, alice);
            // We again perform the H() to transfer the message to the entangled pair.
            H(message);
            // The sequence of CNOT() and H() is Entanglement in reverse.
            // We have to send information to Bob regarding which of the four state was used. We collapse the qubits to get their state
            let messageState = M(message);
            let aliceState = M(alice);
            // This information is transmitted by some classical method, thus bounded by the speed of light
            
            // Now we can define two if blocks to determine the state
            if (messageState == One) {
                Z(bob);     
			}

            if (aliceState == One) {
                X(bob);     
			}
            // Make the necessary changes to the receivedMessage variable based on the state of the qubit at Bob's end
            if (M(bob) == One) {
                set receivedMessage = true;
			}
            
            //Reset all the value
            ResetAll(qubits);
        }
        // Finally return the received message
        return receivedMessage;
    }
}
