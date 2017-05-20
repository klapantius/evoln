using System;
using System.Diagnostics;
using System.IO;

namespace EvoLNPrototype1
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            var converter = new Process()
            {
                StartInfo = new ProcessStartInfo()
                {
                    FileName = @"C:\Users\z001rybj\fop\fop.cmd",
                    Arguments = @"-xml data.xml -xsl evoln.xsl -pdf prototype.pdf 2>&1",
                    UseShellExecute = false,
                    RedirectStandardOutput = true,
                    CreateNoWindow = true
                }
            };
            converter.Start();
            while (!converter.StandardOutput.EndOfStream)
            {
                Console.WriteLine(converter.StandardOutput.ReadLine());
            }
            if (converter.ExitCode != 0 || !File.Exists("prototype.pdf"))
            {
                Console.WriteLine("\nthat's all - press a key to exit");
                Console.ReadKey();
                return;
            }
            var viewer = new Process()
            {
                StartInfo = new ProcessStartInfo()
                {
                    FileName = @"C:\Program Files (x86)\Adobe\Reader 11.0\Reader\AcroRd32.exe",
                    Arguments = string.Format("\"{0}\\prototype.pdf\"", Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location)),
                }
            };
            Console.WriteLine("\nopening {0}", viewer.StartInfo.Arguments);
            viewer.Start();
            viewer.WaitForExit();
            converter.Close();
        }
    }
}
