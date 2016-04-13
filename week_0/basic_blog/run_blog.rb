load "./blog.rb"

blog = Blog.new

blog.add_post("Breaking news!", "The famous TV series how I met the Bachelor has now a facetweetgram.").last.sponsor!
blog.add_post("Baking news!", "Apple crumble is best when still warm and served with high quality vanilla ice cream.")
blog.add_post("ABC", "defg hij klmn...")
blog.add_post("Baking news!", "Chocolate cake is everybodies darling.")
blog.add_post("ZZTOP", "Gimme all your lovin', all your hugs and kisses too")
blog.add_post("Breaking news!", "Kim K. accidentially sat for over 3h on her husband K. West. He stopped tweeting after 25 minutes and deceased.").last.sponsor!
blog.add_post("manamana", "Do doo be-do-do")
blog.add_post("Baking news!", "Carrot cake does not qualify as vegetable.")

blog.display_page
