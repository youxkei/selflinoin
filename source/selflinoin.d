module selflinoin;

import std.format : format;

string makeCompilationErrorMessage(string message, string file = __FILE__, size_t line = __LINE__)
{
    return "\x1b[1m%s(%d): \x1b[31mError:\x1b[m %s".format(file, line, message);
}

debug (selflinoin) unittest
{
    assert (makeCompilationErrorMessage("this is a test message") == "\x1b[1msource/selflinoin.d(12): \x1b[31mError:\x1b[m this is a test message");
    assert (makeCompilationErrorMessage("foo", "bar.d")           == "\x1b[1mbar.d(13): \x1b[31mError:\x1b[m foo");
    assert (makeCompilationErrorMessage("foo", "bar.d", 3141592)  == "\x1b[1mbar.d(3141592): \x1b[31mError:\x1b[m foo");

    pragma (msg, makeCompilationErrorMessage("This is not an actual error. Please ignore me."));
}
