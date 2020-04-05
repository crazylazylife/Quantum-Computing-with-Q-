using System;
using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Quantum.Teleportation
{
    class Driver
    {
        static void Main(string[] args)
        {
            var t = 0;
            var same = 0;
            var random = new Random();
            // We initialize a Quantum Simulator same as before
            using (var qsim = new QuantumSimulator())
            {
                // We run a loop for 1000 times to test the phenomenon
                for (int i = 0; i < 1000; i++)
                {
                    // Randomly generate boolean values to send as messages
                    var sentMessage = random.Next(2) == 0;
                    // We run the Superposition operation and store the returned result in the respective varialble
                    var receivedMessage = Teleportation.Run(qsim, sentMessage).Result;
                    // Check the ditribution of trues and false
                    if (receivedMessage)
                    {
                        t++;
                    }
                    // Confirm if the sent and received messages are the same.
                    if (sentMessage == receivedMessage)
                    {
                        same++;
                    }
                }
            }
            // Print the desired results
            Console.WriteLine("Teleportation Result: ");
            Console.WriteLine($"True: {t}");
            Console.WriteLine($"False: {1000 - t}");
            Console.WriteLine($"Same: {same / 1000 * 100}%");
            Console.ReadKey();
        }
    }
}