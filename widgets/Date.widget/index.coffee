format = '%b %d %a'

command: "date +\"#{format}\""

# the refresh frequency in milliseconds
refreshFrequency: 1000 * 60 * 10

render: (output) -> """
  <h1>#{output}</h1>
"""

style: """
  color: #4788c2
  font-family: Helvetica Neue
  left: 10px
  top: 0px

  h1
    font-size: 48pt
    font-weight: 300
    margin: 0
    padding: 0
  """
