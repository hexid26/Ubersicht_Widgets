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
refreshFrequency: 1000*60*5

# render gets called after the shell command has executed. The command's output
# is passed in as a string. Whatever it returns will get rendered as HTML.
render: (output) -> """
  #{output}
"""

# the CSS style for this widget, written using Stylus
# (http://learnboost.github.io/stylus/)
style: """
  background: rgba(#217, 0.35) url('wordcloud.widget/FeelGood.png') no-repeat 50% 0px
  background-size: 1441px 1015px
  -webkit-backdrop-filter: blur(20px)
  border-radius: 1px
  color: #ffffff
  font-family: Helvetica Neue
  font-weight: 300
  left: 50%
  line-height: 1
  margin-left: -720px
  padding: 1015px 0px 0px
  top: 10%
  width: 1441px
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
