# Setup your System

_This is a Markdown file. It should be opened in a Markdown reader or in Atom (press SHIFT + CTRL + M to display it properly formatted)._

## Editor
- Install Atom from <https://atom.ui>
- press SHIFT + CMD + P to open the command palette
- search for "Install Packages"

### Install Packages

#### General Packages
- search for the package "atom-beautify" and install it
- search for the package "sort-lines" and install it
- search for the package "file-icons" and install it

#### Linters
- search for the package "linter" and install it
- for every language you (will) use, install a fitting linter: <https://atomlinter.github.io/>
  - search for the package "linter-htmlhint" and install it
  - search for the package "linter-csslint" and install it
  - search for the package "linter-jshint" and install it

#### Rubocop

To use Rubocop as the Ruby linter, a few steps are necessary:

- first we have to install the gem rubocop - in your terminal run: `gem install rubocop`
- then run `which rubocop` and copy the path (mine looks like this: /Users/andy/.rbfu/rubies/2.3.0/lib/ruby/gems/bin/rubocop)
- search for the package "linter-rubocop" and install it
- go to "Settings" -> "Open Config Folder"
- open the file "config.cson"
- add the path to rubocop to the config file while keeping it alphabetically sorted (use the path you copied, not mine ;-))

````
"linter-rubocop":
    command: "/Users/andy/.rbfu/rubies/2.3.0/lib/ruby/gems/bin/rubocop"
````

In it's current state Rubocop might be extremly strict.
- download my Rubocop config file from: <https://github.com/mediafinger/2016_IronHack_parttime/blob/master/.rubocop.yml>
- copy it as .rubocop.yml into your home directory: `$HOME/.rubocop.yml`

Now the Rubocop setup is done and it should just work™. There is one catch though. Atom has issues handling the PATH environment variable :-/ This means, for Rubocop to work, you have to start Atom in terminal from the directory where you Ruby files are with `atom .`. In my case it looks like this:

`~/www/2016/ironhack/part_time $ atom .`

In case you still get error messages every time you save a .rb file, just deactivate the linter-rubocop package under Settings -> Packages.

### Configuring the Linter
- Press "CMD + ," to go to Settings
- select "Packages" -> "linter" -> "Settings"
- remove the checkmark from "lint as you type" to make the editor less annoying

Now the linter should be run automatically when saving a file and inform you about any issues.

### Using Packages
- when editing a file, you can now: press CTRL + ALT + B to "beautify" it (corrects indentation and other things)
- when in a .markdown (or .md or any other markdown) file, press SHIFT + CTRL + M to open a preview
- to sort lines alphabetically press F5 (not sure if this is the default, or my personal setup)
- other packages come with other shortcuts, which you find under Settings -> Keybindings

If you can not remember a keyboard shortcut, you can open the command palette with SHIFT + CMD + P and just type the name of the command.

### Other editor settings:
- activate "Show line numbers"
- activate "Soft Tabs"
- set Tab length to "2"
