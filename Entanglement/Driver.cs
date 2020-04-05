using System;
using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Quantum.Entanglement
{
    class Driver
    {
        static void Main(string[] args)
        {
            var ones = 0;
            var same = 0;
            // We initialize a Quantum Simulator same as before.
            using (var qsim = new QuantumSimulator())
            {
                // We run a loop for 1000 times to test the principle
                for (int i = 0; i < 1000; i++)
                {
                    // We run the Entanglement operation and store the returned results in the respective varialbles 
                    var (qone_state, qtwo_state) = Entanglement.Run(qsim).Result;
                    // Check to see how many times we got state value 1. This will confirm our Superposition that collapses to state 0 or 1 with 50% probability for each
                    if (qone_state == Result.One)
                    {
                        ones++;
                    }
                    // Next we perform the comparison to check if the state values of the qubit match. They should, if they are entangled and result in 100% matches
                    if (qone_state == qtwo_state)
                    {
                        same++;
                    }
                }
            }
            // Fancy printing the results.
            Console.WriteLine("Entanglement Results: ");
            Console.WriteLine($"\t   One: {ones}");
            Console.WriteLine($"\t  Zero: {1000 - ones}");
            Console.WriteLine($"\t Same: {same / 1000 * 100}%");
            Console.ReadKey();
        }
    }
}
