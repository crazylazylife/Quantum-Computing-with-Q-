using System;
using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Quantum.Superposition
{
    class Driver
    {
        static void Main(string[] args)
        {
            int ones = 0;
            // We initialize a Quantum Simulator same as before
            using (var qsim = new QuantumSimulator())
            {
                // We run a loop for 1000 times to test the phenomenon
                for (int i = 0; i < 1000; i++)
                {
                    // We run the Superposition operation and store the returned result in the respective varialble 
                    var result = Superposition.Run(qsim).Result;
                    // Check if the value of the resultant state is 1
                    if (result == Result.One)
                    {
                        ones++;
                    }
                }
            }

            // Print the number of times the resultant state has assumed the value of 0 and 1. They should be nearly 50% of the time.
            Console.WriteLine("Collapsed States: ");
            Console.WriteLine($"One: {ones}");
            Console.WriteLine($"Zero: {1000 - ones}");
            Console.ReadKey();
        }
    }
}