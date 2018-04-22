# This is a simple example Widget, written in CoffeeScript, to get you started
# with Übersicht. For the full documentation please visit:
#
# https://github.com/felixhageloh/uebersicht
#
# You can modify this widget as you see fit, or simply delete this file to
# remove it.

# this is the shell command that gets executed every time this widget refreshes
command: "cat ~/Public/Desktop/welcome.txt"

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
  background: rgba(#217, 0.35) url('welcome.widget/Qrcode.jpg') no-repeat 50% 20px
  background-size: 176px 176px
  -webkit-backdrop-filter: blur(20px)
  border-radius: 1px
  border: 2px solid #700
  box-sizing: border-box
  color: #ffffff
  font-family: Helvetica Neue
  font-weight: 300
  left: 10px
  line-height: 1
  margin-left: 0px
  padding: 200px 20px 20px
  top: 20%
  width: 340px
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
