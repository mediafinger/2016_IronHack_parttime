My way to store ENV (ENvironment Variables) on my machine is to:

- create a file `$HOME/.secrets`

- set the ENV variables in there through:

      export GMAIL_IRONHACK_USERNAME=your-email-address
      export GMAIL_IRONHACK_PASSWORD=...

- source this file in `~/.bashrc` (or `~/.profile`)

      . $HOME/.secrets

  (you have to run this file once, in your already
   open terminal session - it will be run automatically
   in new terminal sessions)

- check if your ENV was correctly set by running

      env | grep GMAIL

This way all my usernames and passwords are always set
in the ENV and available to all my apps.

To use them in the Rails app just access them:

    ENV["GMAIL_IRONHACK_USERNAME"]
