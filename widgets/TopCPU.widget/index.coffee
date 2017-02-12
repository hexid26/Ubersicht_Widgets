command: "ps axro \"pid, %cpu, ucomm\" | awk 'FNR>1' | head -n 5 | awk '{if(NF > 3) for(i=4;i<=NF;i++) $3=$3\" \"$i}{ printf \"%5.1f%%,%s,%s\\n\", $2, $3, $1}'"

refreshFrequency: 10000

style: """
  bottom: 94px
  left: 10px
  color: #fff
  font-family: Helvetica Neue
  border:1px solid rgba(#00ff00, 1)
  border-radius:4px
  table
    border-collapse: collapse
    table-layout: fixed

  td
    font-size: 23px
    font-weight: 200
    width: 88px
    max-width: 88px
    color: #aaaaaa
    overflow: ellipsis

  .wrapper
    padding: 4px 6px 4px 6px
    position: relative

  p
    padding: 0
    margin: 0
    font-size: 12px
    font-weight: normal
    max-width: 100%
    color: #dddddd

  .pid
    position: absolute
    top: 2px
    right: 2px
    font-size: 10px
    font-weight: normal

"""


render: -> """
  <table>
    <tr>
      <td class='col1'></td>
      <td class='col2'></td>
      <td class='col3'></td>
      <td class='col4'></td>
      <td class='col5'></td>
    </tr>
  </table>
"""

update: (output, domEl) ->
  processes = output.split('\n')
  table     = $(domEl).find('table')

  renderProcess = (cpu, name, id) ->
    "<div class='wrapper'>" +
      "#{cpu}<p>#{name}</p>" +
    "</div>"

  for process, i in processes
    args = process.split(',')
    table.find(".col#{i+1}").html renderProcess(args...)

