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
}
finally
{
    Console.ResetColor();
}