#! "netcoreapp2.1"
#load "common.csx"

try
{
    if (Directory.Exists(Args[0]) || File.Exists(Args[0]))
    {
        Console.ForegroundColor = ConsoleColor.Red;
        Console.Error.WriteLine($"A file or folder name '{Args[0]}' already exists.");
        return 1;
    }

    RunProcess("git", "clone", "https://github.com/smack0007/dotnet-new-repo-template.git", Args[0]);

    foreach (var file in Directory.EnumerateFiles(Args[0], ".gitkeep", SearchOption.AllDirectories))
    {
        File.Delete(file);
    }

    var oldDirectory = Directory.GetCurrentDirectory();

    Directory.SetCurrentDirectory(Args[0]);

    DeleteDirectory(".git");
    RunProcess("git", "init");
    RunProcess("dotnet", "new", "sln");

    Directory.SetCurrentDirectory(oldDirectory);
}
finally
{
    Console.ResetColor();
}