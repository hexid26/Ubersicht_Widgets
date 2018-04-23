format = '%l:%M %p'

command: "date +\"#{format}\""

# the refresh frequency in milliseconds
refreshFrequency: 1000 * 30

render: (output) -> """
  <h1>#{output}</h1>
"""

style: """
  color: rgb(#cf37c2)
  font-family: Helvetica Neue
  left: 10px
  top: 75px

  h1
    font-size: 42pt
    font-weight: 300
    margin: 0
    padding: 10
  """
