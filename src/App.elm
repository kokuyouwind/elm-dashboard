module App exposing (main)

import Html exposing (div)
import Markdown


main =
  div [] [
    Markdown.toHtml [] markdown1,
    Markdown.toHtml [] markdown2
  ]


markdown1 = """

# This is Markdown 1

 * item
 * item
 * item

"""

markdown2 = """

# This is Markdown 2

test

"""
