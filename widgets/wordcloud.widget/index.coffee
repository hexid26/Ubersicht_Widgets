# This is a simple example Widget, written in CoffeeScript, to get you started
# with Übersicht. For the full documentation please visit:
#
# https://github.com/felixhageloh/uebersicht
#
# You can modify this widget as you see fit, or simply delete this file to
# remove it.

# this is the shell command that gets executed every time this widget refreshes
command: ""

# the refresh frequency in milliseconds
refreshFrequency: 1000*60*100

# render gets called after the shell command has executed. The command's output
# is passed in as a string. Whatever it returns will get rendered as HTML.
render: (output) -> """
  #{output}
"""

# the CSS style for this widget, written using Stylus
# (http://learnboost.github.io/stylus/)
style: """
  background: rgba(#000, 0.0) url('wordcloud.widget/FeelGood.png') no-repeat 50% 0px
  background-size: 920px 546px
  -webkit-backdrop-filter: blur(0px)
  border-radius: 0px
  color: #ffffff
  font-family: Helvetica Neue
  font-weight: 300
  left: 42%
  line-height: 1
  margin-left: -273px
  padding: 546px 0px 0px
  top: 18%
  width: 920px
  text-align: justify

  h1
    font-size: 30px
    font-weight: 300
    margin: 16px 0 8px
    color: #ff0000

  em
    font-weight: 400
    font-style: normal
"""
