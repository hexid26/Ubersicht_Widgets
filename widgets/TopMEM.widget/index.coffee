command: "ps axo \"rss,pid,ucomm\" | sort -nr | head -n5 | awk '{if(NF > 3) for(i=4;i<=NF;i++) $3=$3\" \"$i}{printf \"%8.0f,%s,%s\\n\", $1/1024, $3, $2}'"

refreshFrequency: 10000

style: """
  bottom: 10px
  left: 340px
  color: #aaa
  font-family: Helvetica Neue
  border:1px solid rgba(#ff0000, 1)
  border-radius:3px
  table
    border-collapse: collapse
    table-layout: fixed    
    margin-bottom: 3px

  td
    font-size: 11px
    font-weight: normal
    width: 25px
    max-width: 120px
    overflow: ellipsis

"""


render: ->
  """
  <table>
    <tr id="row-1"></tr>
    <tr id="row-2"></tr>
    <tr id="row-3"></tr>
    <tr id="row-4"></tr>
    <tr id="row-5"></tr>
  </table>
"""

update: (output, domEl) ->
  processes = output.split('\n')
  table     = $(domEl).find('table')

  renderProcess = (mem, name) ->
    "<td>#{name}</td><td ALIGN=RIGHT>#{mem}</td>"

  for process, i in processes
    args = process.split(',')
    table.find("#row-#{i+1}").html renderProcess(args...)

