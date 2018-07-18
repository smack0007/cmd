public static int RunProcess(string fileName, params string[] args)
{
    var startInfo = new ProcessStartInfo()
    {
        FileName = fileName,
        Arguments = "\"" + string.Join("\" \"", args) + "\"",
        UseShellExecute = false,
        RedirectStandardOutput = true,
        RedirectStandardError = true
    };

    using (var process = Process.Start(startInfo))
    {
        process.WaitForExit();
        
        Console.WriteLine(process.StandardOutput.ReadToEnd());
        Console.Error.WriteLine(process.StandardError.ReadToEnd());

        return process.ExitCode;
    }
}

