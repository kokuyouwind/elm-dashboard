module App exposing (main)

import Html exposing (div)
import Html.Attributes exposing (style)
import Markdown
import Ui.Container

main =
  Ui.Container.view
    { direction = "column", align = "center", compact = True }
    [ style [ ("margin", "10px auto"), ("width", "80%") ] ]
    [ Ui.Container.view
        { direction = "row", align = "start", compact = False }
        [ style [ ("width", "100%") ] ]
        [ Markdown.toHtml [ markdownStyle ] markdownTop ],
      Ui.Container.view
        { direction = "row", align = "start", compact = False }
        [ style [ ("margin-top", "10px"), ("width", "100%") ] ]
        [ Markdown.toHtml [ markdownStyle ] markdown1,
          Markdown.toHtml [ markdownStyle ] markdown2]
    ]

markdownTop = """
# This is Top Markdown

test
"""

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

markdownStyle = style [ ("border", "solid"), ("padding", "10px"), ("width", "100%") ]