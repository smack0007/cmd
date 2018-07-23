public static void DeleteDirectory(string directoryName)
{
    var directory = new DirectoryInfo(directoryName);

    void RemoveReadOnlyAttribute(DirectoryInfo dir)
    {
        foreach (var subDir in dir.GetDirectories())
        {
            RemoveReadOnlyAttribute(subDir);
        }

        foreach (var file in dir.GetFiles())
        {
            file.Attributes = FileAttributes.Normal;
        }
    }

    RemoveReadOnlyAttribute(directory);

    directory.Delete(true);
}

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

