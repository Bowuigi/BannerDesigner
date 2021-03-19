Banner Designer
---
A banner (or card) designer made in Lua

This tool requires figlet for the title

Usage
---

```bash
git clone https://github.com/Bowuigi/BannerDesigner
# or using gax from extrautils:
git clone $(gax Bowuigi BannerDesigner)
# cd to the folder
cd BannerDesigner
# Usr the program
./BannerDesigner [color (in numbers 0-9)] [title] [paragraph 1] [paragraph 2] [...] [paragraph n]
```

Since the program outputs to standard input, you can redirect it to a file like this:
```bash
[the previous command] > file.txt
```

And if we read the file with ``cat`` it outputs the same, with colors and such, check the example banners
