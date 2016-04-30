# ASCII art

We are going to create a web page that renders some ASCII art. This means some images built using standard text characters.

Using Sinatra, build a web that accepts routes like

<http://localhost:4567/ascii/one_random_word>

Where 'one_random_word' can be any text. The web should render the text in ascii art.

For example:

```
                                         _                                      _
                                        | |                                    | |
   ___  _ __   ___   _ __ __ _ _ __   __| | ___  _ __ _____      _____  _ __ __| |
  / _ \| '_ \ / _ \ | '__/ _` | '_ \ / _` |/ _ \| '_ ` _ \ \ /\ / / _ \| '__/ _` |
 | (_) | | | |  __/ | | | (_| | | | | (_| | (_) | | | | | \ V  V / (_) | | | (_| |
  \___/|_| |_|\___| |_|  \__,_|_| |_|\__,_|\___/|_| |_| |_|\_/\_/ \___/|_|  \__,_|
                ______                                  ______
               |______|                                |______|

```

## Iteration 1 - create a route

Create the basic route as demonstrated in the example above. You're going to need to create a route for `/ascii/word`.  

For now just take the input parameter and display it on the website. This small step is enough to test that our route is working as expected.


## Iteration 2 - convert param to ASCII and display it

Now we want to convert that word to ASCII and then print it out.

Make sure in your view you surround the word with `<pre></pre>` tags. pre prints out text exactly as it is. Try printing your ascii art to the screen without it and see what happens... yeah not so pretty.

**Hints:**

- to create the ASCII art you can use the gem [artii](https://github.com/miketierney/artii)
- In the browser you need to use a **monospaced font**. Otherwise your ascii art will look weird.


## Iteration 3 - take an optional param

Accept an _optional parameter_ for your route that takes in a font name. Usually when we pass parameters to a route, we're going to have a route like:

`/items/:item`

That means that our route is expecting something to be filled in for `:item`, ie:

```ruby
/items/apple
/items/watermelon
/items/grapes
```

In sinatra, what we can do is make the parameter optional. What do I mean by optional? Just that, we may or may not be providing that parameter in the route.

Let's say for our font example that sometimes we just want a regular old default font when we type in

```ruby
/ascii/word
```

But we want to make adding an additional font _optional_. How do we do this? With the optional parameters, here's an example:

```ruby
get '/test/?:p1?/?:p2?' do
  "Hello #{params[:p1]}, #{params[:p2]}"
end
```

The question marks simple denote that we may or may not provide this parameter in the URL.

**To finish this iteration, just display the font name together with the ASCII art.**


## Iteration 4 - integrate additional fonts

Here's a list of a couple cool fonts to test with:

- alligator
- 3-d
- 3x5
- acrobatic
- avatar
- banner /3/4
- cosmic
- defleppard
- doh
- epic
- fraktur
- ... and many more.

A full list can be found here in the source code:
<https://github.com/miketierney/artii/tree/master/lib/figlet/fonts>

There's a pretty nice example of how to plug in the font for ASCII art on the gem's documentation page.


## Iteration 5 - easter egg

Create a secret easter egg route for your users. Usually when they enter a word into `/ascii/word_goes_here`, it takes them to a page with an asciifyed version of the word.

Make it so that if a user enters your favorite animal in the parameter with a font type parameter of "special" an extra optional parameter of "secret", it takes them to a page with an image of your favorite animal on it. For example:

`/ascii/unicorn/special/secret/`

If you forgot how to display an image, check the HTML documentation for the image tag `<img ... />`
